import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../profile/domain/entities/user_video_entity.dart';
import '../../../profile/domain/repositories/profile_repository.dart';
import 'generating_event.dart';
import 'generating_state.dart';

class GeneratingBloc extends Bloc<GeneratingEvent, GeneratingState> {
  final ProfileRepository profileRepository;
  Timer? _timer;
  String? _videoId;

  GeneratingBloc({required this.profileRepository}) : super(const GeneratingState.initial()) {
    on<GeneratingEvent>((event, emit) async {
      await event.when(
        startGenerating: (title, imageUrl) => _onStartGenerating(title, imageUrl, emit),
        tickProgress: () => _onTickProgress(emit),
        notifyComplete: () => _onNotifyComplete(emit),
      );
    });
  }

  Future<void> _onStartGenerating(
    String title,
    String? imageUrl,
    Emitter<GeneratingState> emit,
  ) async {
    LogUtils.d("Starting video generation for: $title");
    _videoId = const Uuid().v4();

    // Create the initial entity with status 'generating'
    final newVideo = UserVideoEntity(
      id: _videoId!,
      title: title,
      imageUrl: imageUrl ?? 'http://localhost:3845/assets/8d2e689548257916e559ea3ee6ad104a56bd01e1.png',
      status: 'generating',
      progress: 0.0,
      createdAt: _formatCurrentDate(),
      isLiked: false,
    );

    // Save initial state to history datasource
    await profileRepository.addUserVideo(newVideo);

    emit(GeneratingState.generating(
      progress: 0.0,
      title: title,
      imageUrl: imageUrl,
    ));

    // Tick every 500ms
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!isClosed) {
        add(const GeneratingEvent.tickProgress());
      }
    });
  }

  Future<void> _onTickProgress(Emitter<GeneratingState> emit) async {
    await state.mapOrNull(
      generating: (generatingState) async {
        final currentProgress = generatingState.progress;
        final nextProgress = currentProgress + 0.1;

        if (nextProgress >= 1.0) {
          _timer?.cancel();
          _timer = null;

          // Update final progress to 1.0/done in repository
          await profileRepository.updateVideoProgress(_videoId!, 1.0, 'done');

          emit(GeneratingState.success(
            videoId: _videoId!,
            title: generatingState.title,
            imageUrl: generatingState.imageUrl,
            videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            createdAt: _formatCurrentDate(),
          ));
        } else {
          // Update intermediate progress in repository
          await profileRepository.updateVideoProgress(_videoId!, nextProgress, 'generating');

          emit(generatingState.copyWith(progress: nextProgress));
        }
      },
    );
  }

  Future<void> _onNotifyComplete(Emitter<GeneratingState> emit) async {
    LogUtils.d("User requested background notification");
    _timer?.cancel();
    _timer = null;
    emit(const GeneratingState.notifiedAndExited());
  }

  String _formatCurrentDate() {
    final now = DateTime.now();
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final time = "${twoDigits(now.hour)}:${twoDigits(now.minute)}";
    final date = "${twoDigits(now.day)}-${twoDigits(now.month)}-${now.year}";
    return "$time  •  $date";
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

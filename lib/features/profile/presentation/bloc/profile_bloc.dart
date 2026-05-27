import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/resource.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const ProfileState.loading());
          await Future.delayed(const Duration(milliseconds: 500));
          emit(const ProfileState.ready(
            subTabIndex: 0,
            videosState: Resource.empty(),
          ));
        },
        changeSubTab: (subTabIndex) async {
          emit(ProfileState.ready(
            subTabIndex: subTabIndex,
            videosState: Resource.loading(),
          ));
          await Future.delayed(const Duration(milliseconds: 400));
          emit(ProfileState.ready(
            subTabIndex: subTabIndex,
            videosState: Resource.empty(),
          ));
        },
      );
    });
  }
}

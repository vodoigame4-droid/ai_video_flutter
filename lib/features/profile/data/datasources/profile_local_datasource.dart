import '../models/user_video_model.dart';

abstract class ProfileLocalDataSource {
  Future<List<UserVideoModel>> getUserVideos();
  Future<bool> deleteUserVideo(String id);
  Future<void> updateVideoProgress(String id, double progress, String status);
  Future<void> addUserVideo(UserVideoModel video);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  // In-memory mock list of user videos
  static final List<UserVideoModel> _videos = [
    const UserVideoModel(
      id: '1',
      title: 'Image Generation',
      imageUrl: 'http://localhost:3845/assets/8d2e689548257916e559ea3ee6ad104a56bd01e1.png',
      status: 'generating',
      progress: 0.3,
      createdAt: '09:54  •  19-05-2026',
      isLiked: false,
    ),
    const UserVideoModel(
      id: '2',
      title: 'Image Generation',
      imageUrl: 'http://localhost:3845/assets/8d2e689548257916e559ea3ee6ad104a56bd01e1.png',
      status: 'generating',
      progress: 0.45,
      createdAt: '09:54  •  19-05-2026',
      isLiked: false,
    ),
    const UserVideoModel(
      id: '3',
      title: 'Image Generation',
      imageUrl: 'http://localhost:3845/assets/bc116fdfa92b3da8beeebebc663d074ef7137492.png',
      status: 'done',
      progress: 1.0,
      createdAt: '09:54  •  19-05-2026',
      isLiked: true,
    ),
    const UserVideoModel(
      id: '4',
      title: 'Image Generation',
      imageUrl: 'http://localhost:3845/assets/f612b9f001f83217161da6534e1a3c09c5520c3d.png',
      status: 'done',
      progress: 1.0,
      createdAt: '09:54  •  19-05-2026',
      isLiked: false,
    ),
    const UserVideoModel(
      id: '5',
      title: 'Image Generation',
      imageUrl: 'http://localhost:3845/assets/c0d7d7f493681f8759bf3f3e82e316b9c21d9e85.png',
      status: 'done',
      progress: 1.0,
      createdAt: '09:54  •  19-05-2026',
      isLiked: true,
    ),
  ];

  @override
  Future<List<UserVideoModel>> getUserVideos() async {
    // Simulate slight local database fetch latency
    await Future.delayed(const Duration(milliseconds: 200));
    return List.from(_videos);
  }

  @override
  Future<bool> deleteUserVideo(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _videos.indexWhere((element) => element.id == id);
    if (index != -1) {
      _videos.removeAt(index);
      return true;
    }
    return false;
  }

  @override
  Future<void> updateVideoProgress(String id, double progress, String status) async {
    final index = _videos.indexWhere((element) => element.id == id);
    if (index != -1) {
      _videos[index] = _videos[index].copyWith(
        progress: progress,
        status: status,
      );
    }
  }

  @override
  Future<void> addUserVideo(UserVideoModel video) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _videos.insert(0, video);
  }
}

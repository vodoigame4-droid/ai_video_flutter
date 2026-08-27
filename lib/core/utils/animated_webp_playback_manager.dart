/// A global manager to regulate how many animated WebP players can run simultaneously.
/// This prevents CPU/GPU spikes and UI jank caused by multiple decoding WebPs in lists/grids.
class AnimatedWebpPlaybackManager {
  static final AnimatedWebpPlaybackManager _instance =
      AnimatedWebpPlaybackManager._internal();

  factory AnimatedWebpPlaybackManager() => _instance;

  AnimatedWebpPlaybackManager._internal();

  /// Maximum allowed concurrent active playing WebP animations on screen.
  int maxConcurrent = 3;

  final Map<Object, double> _cardVisibility = {};
  final Map<Object, void Function(bool canPlay)> _callbacks = {};

  /// Register or update a card's visibility fraction on screen.
  void updateVisibility({
    required Object key,
    required double visibleFraction,
    required void Function(bool canPlay) onStateChanged,
  }) {
    _callbacks[key] = onStateChanged;

    if (visibleFraction < 0.9) {
      _cardVisibility.remove(key);
    } else {
      _cardVisibility[key] = visibleFraction;
    }

    _reevaluate();
  }

  /// Unregister a card when disposed.
  void unregister(Object key) {
    _cardVisibility.remove(key);
    final callback = _callbacks.remove(key);
    callback?.call(false);
    _reevaluate();
  }

  void _reevaluate() {
    if (_callbacks.isEmpty) return;

    // Sort entries by visibleFraction descending
    final sorted = _cardVisibility.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Allow top `maxConcurrent` cards that have visibleFraction >= 0.90 to play
    final allowedKeys = sorted
        .take(maxConcurrent)
        .where((e) => e.value >= 0.9)
        .map((e) => e.key)
        .toSet();

    _callbacks.forEach((key, callback) {
      final shouldPlay = allowedKeys.contains(key);
      callback(shouldPlay);
    });
  }
}

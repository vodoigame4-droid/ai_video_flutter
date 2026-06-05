import 'package:flutter/material.dart';

/// A widget that defers the initialization/building of heavy content
/// until the page transition animation (ModalRoute) has finished.
/// This prevents frame drops (stutter/lag) during navigation.
class DeferInitWidget extends StatefulWidget {
  final Widget child;
  final Widget? placeholder;
  final Duration? delay;

  const DeferInitWidget({
    super.key,
    required this.child,
    this.placeholder,
    this.delay,
  });

  @override
  State<DeferInitWidget> createState() => _DeferInitWidgetState();
}

class _DeferInitWidgetState extends State<DeferInitWidget> {
  bool _shouldShow = false;

  @override
  void initState() {
    super.initState();
    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        if (mounted) {
          setState(() {
            _shouldShow = true;
          });
        }
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final route = ModalRoute.of(context);
        if (route != null && route.isCurrent) {
          if (route.animation != null) {
            void listener(AnimationStatus status) {
              if (status == AnimationStatus.completed) {
                route.animation!.removeStatusListener(listener);
                if (mounted) {
                  setState(() {
                    _shouldShow = true;
                  });
                }
              }
            }
            if (route.animation!.isCompleted) {
              setState(() {
                _shouldShow = true;
              });
            } else {
              route.animation!.addStatusListener(listener);
            }
          } else {
            setState(() {
              _shouldShow = true;
            });
          }
        } else {
          setState(() {
            _shouldShow = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_shouldShow) {
      return widget.child;
    }
    return widget.placeholder ?? const Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2BC5C5)), // var(--secondary-color) teal
        ),
      ),
    );
  }
}

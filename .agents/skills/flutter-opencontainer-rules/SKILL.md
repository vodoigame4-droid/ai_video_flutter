---
name: flutter-opencontainer-rules
description: Enforce best practices when implementing OpenContainer (Container Transform) animations in the Flutter project to keep UI code clean, maintain architecture boundaries, and prevent visual glitches. Use this when Codex needs to add or modify transitions between screens using the animations package.
---

# GoRouter & OpenContainer Integration Rules

The application uses **GoRouter (`^17.2.3`)** with `context.pop()` for back navigation on destination screens (like `CreateFromTemplatePage` and `ResultPage`). To prevent breaking the routing stack and avoid visual glitches, follow these rules.

---

## 1. The Core Conflict: GoRouter vs. Imperative Navigator

*   `OpenContainer` uses imperative `Navigator.of(context).push()` under the hood.
*   Because GoRouter is unaware of this push, calling `context.pop()` on the destination page will **not** close the container. Instead, it pops the route *underneath* the container on the GoRouter stack, breaking the navigation flow.

### Acceptable Solutions:
You must use either **Approach A** (GoRouter Native: Hero + Custom Transition) or **Approach B** (Synchronized OpenContainer wrapper).

---

## 2. Approach A (Recommended): Hero + Custom GoRouter Transition

This approach is the cleanest because it keeps GoRouter 100% in charge of the stack and preserves `context.pop()` without modification, while still achieving a smooth transition.

### Step 1: Use `Hero` on the Source Page
Wrap the thumbnail/card in a `Hero` widget with a unique tag.
```dart
Hero(
  tag: 'template-hero-${template.id}',
  child: VideoCard(imageUrl: template.thumbnailUrl, ...),
)
```

### Step 2: Use `Hero` on the Destination Page
Wrap the main preview image/video header of the destination page (e.g., `CreateFromTemplatePage`) in a `Hero` with the **same** tag.
```dart
Hero(
  tag: 'template-hero-${widget.templateId}',
  child: CachedNetworkImage(imageUrl: widget.imageUrl, ...),
)
```

### Step 3: Implement Fade/Scale Transition in `app_router.dart`
Instead of using `AppRoutePage.cupertino`, use a `CustomTransitionPage` utilizing transitions from the `animations` package (like `FadeThroughTransition` or `FadeScaleTransition`).
```dart
GoRoute(
  path: CreateFromTemplatePage.path,
  name: CreateFromTemplatePage.name,
  pageBuilder: (context, state) {
    // Extract parameters...
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: CreateFromTemplatePage(...),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  },
),
```

---

## 3. Approach B: Synchronized OpenContainer Wrapper

Use this approach **only** if you specifically need the exact Material "Container Transform" effect (where the card physically transforms into the page).

To prevent breaking GoRouter's back button, you **must** wrap the target page in a widget that overrides the default back action.

### Step 1: Implement the Safe Wrapper
Create a helper widget that wraps the target page.
```dart
// lib/core/widgets/app_open_container.dart
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AppOpenContainer extends StatelessWidget {
  final Widget closedChild;
  final Widget openChild;
  final BorderRadius closedBorderRadius;
  final Color? closedColor;
  final Color? openColor;

  const AppOpenContainer({
    super.key,
    required this.closedChild,
    required this.openChild,
    this.closedBorderRadius = const BorderRadius.all(Radius.circular(16)),
    this.closedColor,
    this.openColor,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: closedColor ?? Colors.transparent,
      openColor: openColor ?? Theme.of(context).scaffoldBackgroundColor,
      closedElevation: 0,
      openElevation: 0,
      closedShape: RoundedRectangleBorder(borderRadius: closedBorderRadius),
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: closedChild,
        );
      },
      openBuilder: (context, closeContainer) {
        // Intercept GoRouter pop and route it to local Navigator.pop
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            closeContainer(); // Safely closes the OpenContainer
          },
          child: openChild,
        );
      },
    );
  }
}
```

### Step 2: Ensure Target Screen Safely Pop-capable
Inside pages like `CreateFromTemplatePage` or `ResultPage`, use the following safe back action:
```dart
// Instead of raw context.pop(), check Navigator first
if (Navigator.of(context).canPop()) {
  Navigator.of(context).pop();
} else {
  context.pop();
}
```

---

## 4. Visual & Styling Enforcement (Anti-Glitch)

1.  **Border Radius Match:** The `closedShape` border radius of the `OpenContainer` wrapper must exactly match the `VideoCard`'s border radius (typically `16.0` or `12.0`) to avoid harsh visual clipping at the animation start.
2.  **Elevation:** Always set `closedElevation: 0` and `openElevation: 0` to prevent drop-shadow flicker during expansion.
3.  **No Logic in Builders:** Do not initialize BLoCs, trigger network requests, or update business state directly inside `openBuilder` or `closedBuilder`. Let the destination screen manage its own state via `initState()` or a dedicated `BlocProvider`.

import 'package:flutter/material.dart';

class FadePageRoute extends PageRoute {
  Animation fadeInPageTransition;

  FadePageRoute(
      {@required this.builder,
      RouteSettings settings,
      this.maintainState = true,
      bool fullscreenDialog = false})
      : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        assert(opaque),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder builder;
  @override
  final bool maintainState;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route ${settings.name} returned null.\n Route builders must never return null');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeInPageTransition(
      routeAnimation: animation,
      child: child,
    );
  }
}

class FadeInPageTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> _opacityAnimation;

  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
//  static final Animatable<double> _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn;

  FadeInPageTransition(
      {Key key,
      @required Animation<double> routeAnimation,
      @required this.child})
      : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: child,
    );
  }
}

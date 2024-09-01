import 'package:flutter/material.dart';

enum ResponsiveBreakpoint {
  mobile(0),
  tablet(600),
  desktop(1080);

  final double minWidth;
  const ResponsiveBreakpoint(this.minWidth);

  bool _isResponsiveBreakPoint(BuildContext context) {
    final device = _getDevice(context);
    return device == this;
  }

  ResponsiveBreakpoint _getDevice(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width > ResponsiveBreakpoint.desktop.minWidth) {
      return ResponsiveBreakpoint.desktop;
    }
    if (width > ResponsiveBreakpoint.tablet.minWidth) {
      return ResponsiveBreakpoint.tablet;
    }
    return ResponsiveBreakpoint.mobile;
  }
}

//Provider InheritedWidget
///Add [UiResponsiveProvider.builder] in appWidget.
class UiResponsiveProvider extends InheritedWidget {
  final ResponsiveBreakpoint device;
  final Size? size;
  const UiResponsiveProvider({
    required this.device,
    required super.child,
    this.size,
    super.key,
  });

  @override
  bool updateShouldNotify(UiResponsiveProvider oldWidget) => device != oldWidget.device;

  static Widget builder(BuildContext context, Widget? child) {
    return _BuildListener(child: child ?? Container());
  }

  bool get isMobile => device == ResponsiveBreakpoint.mobile;
  bool get isTablet => device == ResponsiveBreakpoint.tablet;
  bool get isDesktop => device == ResponsiveBreakpoint.desktop;
  double? get h => size?.height;
  double? get w => size?.width;

  static void _modifyDevice(BuildContext context, void Function(ResponsiveBreakpoint) deviceCallBack) {
    final provider = UiResponsiveProvider.of(context);
    ResponsiveBreakpoint? result;
    if (ResponsiveBreakpoint.desktop._isResponsiveBreakPoint(context)) result = ResponsiveBreakpoint.desktop;
    if (ResponsiveBreakpoint.tablet._isResponsiveBreakPoint(context)) result = ResponsiveBreakpoint.tablet;
    if (ResponsiveBreakpoint.mobile._isResponsiveBreakPoint(context)) result = ResponsiveBreakpoint.mobile;
    if (provider.device != result) {
      debugPrint("--Change responsive to -> ${result?.name}");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        deviceCallBack(result!);
      });
    }
  }

  static void _modifySize(BuildContext context, void Function(Size) sizeCallBack) {
    final provider = UiResponsiveProvider.of(context);
    final Size size = MediaQuery.sizeOf(context);
    if (provider.size != size) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sizeCallBack(size);
      });
    }
  }

  static UiResponsiveProvider of(BuildContext context) {
    final responsiveProvider = context.dependOnInheritedWidgetOfExactType<UiResponsiveProvider>();
    assert(responsiveProvider != null, "ResponsiveProvider not exist in BuildContext");
    return responsiveProvider!;
  }
}

//Listenner
class _BuildListener extends StatefulWidget {
  final Widget child;
  const _BuildListener({
    required this.child,
  });

  @override
  State<_BuildListener> createState() => _BuildListenerState();
}

class _BuildListenerState extends State<_BuildListener> {
  ResponsiveBreakpoint device = ResponsiveBreakpoint.desktop;
  Size? size;

  @override
  void initState() {
    super.initState();
  }

  void modifyDevice(BuildContext context) {
    UiResponsiveProvider._modifyDevice(context, (newDevice) => setState(() => device = newDevice));
    UiResponsiveProvider._modifySize(context, (newSize) => setState(() => size = newSize));
  }

  @override
  Widget build(BuildContext context) {
    return UiResponsiveProvider(
      device: device,
      size: size,
      child: Builder(builder: (context) {
        modifyDevice(context);
        return widget.child;
      }),
    );
  }
}

//extension

extension ResponsiveProviderContext on BuildContext {
  UiResponsiveProvider get responsive => UiResponsiveProvider.of(this);
}

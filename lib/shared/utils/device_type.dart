import 'package:flutter/widgets.dart';

enum DeviceType { phone, tablet }

class DeviceInfo{
  static DeviceType getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
  }

  static bool get isTablet => getDeviceType() == DeviceType.tablet;
  static bool get isPhone => getDeviceType() == DeviceType.phone;
}


import 'package:flutter/material.dart';

class CustomOffsetFabLocation extends FloatingActionButtonLocation {
  final FloatingActionButtonLocation baseLocation;
  final double? dxStart;
  final double? dxEnd;
  final double dy;

  const CustomOffsetFabLocation(
    this.baseLocation, {
      this.dxStart,
      this.dxEnd,
      this.dy = 0,
    });

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final baseOffset = baseLocation.getOffset(scaffoldGeometry);
    double dx = 0;

    if (baseLocation == FloatingActionButtonLocation.startDocked) {
      dx = dxStart ?? 0;
    } else if (baseLocation == FloatingActionButtonLocation.endDocked) {
      dx = dxEnd ?? 0;
    }

    return Offset(baseOffset.dx + dx, baseOffset.dy + dy);
  }

}

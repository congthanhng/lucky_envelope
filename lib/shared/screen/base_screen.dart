import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract base class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  static routeConfig({List<RouteBase>? routes}) {
    // TODO: implement routeConfig
    throw UnimplementedError();
  }
}

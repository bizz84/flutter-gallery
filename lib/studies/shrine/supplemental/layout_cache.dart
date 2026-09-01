// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class const LayoutCache({
    super.key,
    required final Map<String, List<List<int>>> layouts,
    required super.child,
  }) extends InheritedWidget {
  static Map<String, List<List<int>>> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LayoutCache>()!.layouts;
  }

  @override
  bool updateShouldNotify(LayoutCache oldWidget) => true;
}

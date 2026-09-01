// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gallery/demos/material/material_demo_types.dart';
import 'package:gallery/l10n/gallery_localizations.dart';

// BEGIN listDemo

class const ListDemo({super.key, required final ListDemoType type}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = GalleryLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(localizations.demoListsTitle),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'list_demo_list_view',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (int index = 1; index < 21; index++)
              ListTile(
                leading: ExcludeSemantics(
                  child: CircleAvatar(child: Text('$index')),
                ),
                title: Text(
                  localizations.demoBottomSheetItem(index),
                ),
                subtitle: type == ListDemoType.twoLine
                    ? Text(localizations.demoListsSecondary)
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}

// END

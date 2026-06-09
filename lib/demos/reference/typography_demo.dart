// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:gallery/l10n/gallery_localizations.dart';

// BEGIN typographyDemo

class const _TextStyleItem({
    required final String name,
    required final TextStyle style,
    required final String text,
  }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 72,
            child: Text(name, style: Theme.of(context).textTheme.bodySmall),
          ),
          Expanded(
            child: Text(text, style: style),
          ),
        ],
      ),
    );
  }
}

class const TypographyDemo({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final styleItems = [
      _TextStyleItem(
        name: 'Headline 1',
        style: textTheme.displayLarge!,
        text: 'Light 96sp',
      ),
      _TextStyleItem(
        name: 'Headline 2',
        style: textTheme.displayMedium!,
        text: 'Light 60sp',
      ),
      _TextStyleItem(
        name: 'Headline 3',
        style: textTheme.displaySmall!,
        text: 'Regular 48sp',
      ),
      _TextStyleItem(
        name: 'Headline 4',
        style: textTheme.headlineMedium!,
        text: 'Regular 34sp',
      ),
      _TextStyleItem(
        name: 'Headline 5',
        style: textTheme.headlineSmall!,
        text: 'Regular 24sp',
      ),
      _TextStyleItem(
        name: 'Headline 6',
        style: textTheme.titleLarge!,
        text: 'Medium 20sp',
      ),
      _TextStyleItem(
        name: 'Subtitle 1',
        style: textTheme.titleMedium!,
        text: 'Regular 16sp',
      ),
      _TextStyleItem(
        name: 'Subtitle 2',
        style: textTheme.titleSmall!,
        text: 'Medium 14sp',
      ),
      _TextStyleItem(
        name: 'Body Text 1',
        style: textTheme.bodyLarge!,
        text: 'Regular 16sp',
      ),
      _TextStyleItem(
        name: 'Body Text 2',
        style: textTheme.bodyMedium!,
        text: 'Regular 14sp',
      ),
      _TextStyleItem(
        name: 'Button',
        style: textTheme.labelLarge!,
        text: 'MEDIUM (ALL CAPS) 14sp',
      ),
      _TextStyleItem(
        name: 'Caption',
        style: textTheme.bodySmall!,
        text: 'Regular 12sp',
      ),
      _TextStyleItem(
        name: 'Overline',
        style: textTheme.labelSmall!,
        text: 'REGULAR (ALL CAPS) 10sp',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(GalleryLocalizations.of(context)!.demoTypographyTitle),
      ),
      body: Scrollbar(child: ListView(children: styleItems)),
    );
  }
}

// END

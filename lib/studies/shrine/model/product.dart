// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:gallery/l10n/gallery_localizations.dart';

class const Category({
  // A function taking a BuildContext as input and
  // returns the internationalized name of the category.
  required final String Function(BuildContext) name,
});

Category categoryAll = Category(
  name: (context) => GalleryLocalizations.of(context)!.shrineCategoryNameAll,
);

Category categoryAccessories = Category(
  name: (context) =>
      GalleryLocalizations.of(context)!.shrineCategoryNameAccessories,
);

Category categoryClothing = Category(
  name: (context) =>
      GalleryLocalizations.of(context)!.shrineCategoryNameClothing,
);

Category categoryHome = Category(
  name: (context) => GalleryLocalizations.of(context)!.shrineCategoryNameHome,
);

List<Category> categories = [
  categoryAll,
  categoryAccessories,
  categoryClothing,
  categoryHome,
];

class const Product({
  required final Category category,
  required final int id,
  required final bool isFeatured,
  // A function taking a BuildContext as input and
  // returns the internationalized name of the product.
  required final String Function(BuildContext) name,
  required final int price,
  final double assetAspectRatio = 1,
}) {
  String get assetName => '$id-0.jpg';

  String get assetPackage => 'shrine_images';
}

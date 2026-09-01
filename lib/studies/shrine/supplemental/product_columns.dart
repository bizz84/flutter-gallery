// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:gallery/studies/shrine/model/product.dart';
import 'package:gallery/studies/shrine/supplemental/product_card.dart';

class const TwoProductCardColumn({
  super.key,
  required final Product bottom,
  final Product? top,
  required final double imageAspectRatio,
}) extends StatelessWidget {
  static const double spacerHeight = 44;
  static const double horizontalPadding = 28;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: horizontalPadding,
              ),
              child: top != null
                  ? MobileProductCard(
                      imageAspectRatio: imageAspectRatio,
                      product: top!,
                    )
                  : const SizedBox(
                      height: spacerHeight,
                    ),
            ),
            const SizedBox(height: spacerHeight),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: horizontalPadding),
              child: MobileProductCard(
                imageAspectRatio: imageAspectRatio,
                product: bottom,
              ),
            ),
          ],
        );
      },
    );
  }
}

class const OneProductCardColumn({
  super.key,
  required final Product product,
  // Whether the product column should align to the bottom.
  required final bool reverse,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      reverse: reverse,
      children: [
        const SizedBox(
          height: 40,
        ),
        MobileProductCard(
          product: product,
        ),
      ],
    );
  }
}

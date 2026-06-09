// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/l10n/gallery_localizations.dart';
import 'package:gallery/layout/adaptive.dart';
import 'package:gallery/layout/image_placeholder.dart';
import 'package:gallery/layout/text_scale.dart';
import 'package:gallery/studies/rally/app.dart';
import 'package:gallery/studies/rally/colors.dart';

class const LoginPage({super.key}) extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with RestorationMixin {
  final RestorableTextEditingController _usernameController =
      RestorableTextEditingController();
  final RestorableTextEditingController _passwordController =
      RestorableTextEditingController();

  @override
  String get restorationId => 'login_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_usernameController, restorationId);
    registerForRestoration(_passwordController, restorationId);
  }

  @override
  Widget build(BuildContext context) {
    return ApplyTextOptions(
      child: Scaffold(
        body: SafeArea(
          child: _MainView(
            usernameController: _usernameController.value,
            passwordController: _passwordController.value,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class const _MainView({
  final TextEditingController? usernameController,
  final TextEditingController? passwordController,
}) extends StatelessWidget {
  void _login(BuildContext context) {
    Navigator.of(context).restorablePushNamed(RallyApp.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    List<Widget> listViewChildren;

    if (isDesktop) {
      final desktopMaxWidth = 400.0 + 100.0 * (cappedTextScale(context) - 1);
      listViewChildren = [
        _UsernameInput(
          maxWidth: desktopMaxWidth,
          usernameController: usernameController,
        ),
        const SizedBox(height: 12),
        _PasswordInput(
          maxWidth: desktopMaxWidth,
          passwordController: passwordController,
        ),
        _LoginButton(
          maxWidth: desktopMaxWidth,
          onTap: () {
            _login(context);
          },
        ),
      ];
    } else {
      listViewChildren = [
        const _SmallLogo(),
        _UsernameInput(
          usernameController: usernameController,
        ),
        const SizedBox(height: 12),
        _PasswordInput(
          passwordController: passwordController,
        ),
        _ThumbButton(
          onTap: () {
            _login(context);
          },
        ),
      ];
    }

    return Column(
      children: [
        if (isDesktop) const _TopBar(),
        Expanded(
          child: Align(
            alignment: isDesktop ? Alignment.center : Alignment.topCenter,
            child: ListView(
              restorationId: 'login_list_view',
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: listViewChildren,
            ),
          ),
        ),
      ],
    );
  }
}

class const _TopBar() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(width: 30);
    final localizations = GalleryLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExcludeSemantics(
                child: SizedBox(
                  height: 80,
                  child: FadeInImagePlaceholder(
                    image: const AssetImage(
                      'logo.png',
                      package: 'rally_assets',
                    ),
                    placeholder: LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          width: constraints.maxHeight,
                          height: constraints.maxHeight,
                        );
                      },
                    ),
                  ),
                ),
              ),
              spacing,
              Text(
                localizations.rallyLoginLoginToRally,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 35 / reducedTextScale(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations.rallyLoginNoAccount,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              spacing,
              _BorderButton(
                text: localizations.rallyLoginSignUp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class const _SmallLogo() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 64),
      child: SizedBox(
        height: 160,
        child: ExcludeSemantics(
          child: FadeInImagePlaceholder(
            image: AssetImage('logo.png', package: 'rally_assets'),
            placeholder: SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class const _UsernameInput({
  final double? maxWidth,
  final TextEditingController? usernameController,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          autofillHints: const [AutofillHints.username],
          textInputAction: TextInputAction.next,
          controller: usernameController,
          decoration: InputDecoration(
            labelText: GalleryLocalizations.of(context)!.rallyLoginUsername,
          ),
        ),
      ),
    );
  }
}

class const _PasswordInput({
  final double? maxWidth,
  final TextEditingController? passwordController,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: GalleryLocalizations.of(context)!.rallyLoginPassword,
          ),
          obscureText: true,
        ),
      ),
    );
  }
}

class const _ThumbButton({
  required final VoidCallback onTap,
}) extends StatefulWidget {
  @override
  _ThumbButtonState createState() => _ThumbButtonState();
}

class _ThumbButtonState extends State<_ThumbButton> {
  BoxDecoration? borderDecoration;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      label: GalleryLocalizations.of(context)!.rallyLoginLabelLogin,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Focus(
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent || event is KeyRepeatEvent) {
                if (event.logicalKey == LogicalKeyboardKey.enter ||
                    event.logicalKey == LogicalKeyboardKey.space) {
                  widget.onTap();
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            onFocusChange: (hasFocus) {
              if (hasFocus) {
                setState(() {
                  borderDecoration = BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 2,
                    ),
                  );
                });
              } else {
                setState(() {
                  borderDecoration = null;
                });
              }
            },
            child: Container(
              decoration: borderDecoration,
              height: 120,
              child: ExcludeSemantics(
                child: Image.asset(
                  'thumb.png',
                  package: 'rally_assets',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class const _LoginButton({
  required final VoidCallback onTap,
  final double? maxWidth,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: RallyColors.buttonColor,
            ),
            const SizedBox(width: 12),
            Text(GalleryLocalizations.of(context)!.rallyLoginRememberMe),
            const Expanded(child: SizedBox.shrink()),
            _FilledButton(
              text: GalleryLocalizations.of(context)!.rallyLoginButtonLogin,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class const _BorderButton({required final String text})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: RallyColors.buttonColor),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        Navigator.of(context).restorablePushNamed(RallyApp.homeRoute);
      },
      child: Text(text),
    );
  }
}

class const _FilledButton({
  required final String text,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: RallyColors.buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      child: Row(
        children: [
          const Icon(Icons.lock),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }
}

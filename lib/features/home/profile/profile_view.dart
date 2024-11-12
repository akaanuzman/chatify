import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/components/field/email_field.dart';
import 'package:chatify_app/products/constants/circle_avatar_radius_constants.dart';
import 'package:chatify_app/products/constants/opacity_constants.dart';
import 'package:chatify_app/products/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@RoutePage()

/// Profile view is a widget that displays the user's profile information
final class ProfileView extends StatefulWidget {
  /// Profile view constructor
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profile_title.tr()),
      ),
      body: const Column(
        children: [
          Expanded(
            child: _ProfileElements(),
          ),
          _SaveButton(),
        ],
      ),
    );
  }
}

/// Profile elements widget
/// This widget contains the user's profile information
/// such as username and email
/// It also contains the profile picture
final class _ProfileElements extends StatelessWidget {
  const _ProfileElements();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.padding.low,
      child: Column(
        children: [
          CircleAvatar(
            radius: CircleAvatarRadiusConstants.veryLow.value,
            child: const Text('A'),
          ),
          context.sized.emptySizedHeightBoxLow3x,
          const _UsernameField(),
          context.sized.emptySizedHeightBoxLow3x,
          const _EmailField(),
          context.sized.emptySizedHeightBoxLow3x,
        ],
      ),
    );
  }
}

/// Username field widget
final class _UsernameField extends StatelessWidget {
  const _UsernameField();

  @override
  Widget build(BuildContext context) {
    return ChatifyTextFormField(
      label: LocaleKeys.field_labels_username.tr(),
      hintText: LocaleKeys.field_hints_username.tr(),
      prefixIcon: const Icon(Icons.person),
      controller: TextEditingController(text: 'kaan'),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

/// Email field widget
final class _EmailField extends StatelessWidget {
  // ignore: unused_element
  const _EmailField({this.readOnly = false});
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: OpacityConstants.mediumHigh.value,
        child: EmailField(
          emailController: TextEditingController(text: 'uzmanakan@gmail.com'),
          readOnly: readOnly,
        ),
      ),
    );
  }
}

/// Save button widget
final class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.medium,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(LocaleKeys.buttons_save.tr()),
      ),
    );
  }
}

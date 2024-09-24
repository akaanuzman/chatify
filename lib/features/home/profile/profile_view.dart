import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/products/components/field/chatify_text_form_field.dart';
import 'package:chatify_app/products/components/field/email_field.dart';
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
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: context.padding.low,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Text('A'),
                  ),
                  context.sized.emptySizedHeightBoxLow3x,
                  ChatifyTextFormField(
                    label: LocaleKeys.field_labels_username.tr(),
                    hintText: LocaleKeys.field_hints_username.tr(),
                    prefixIcon: const Icon(Icons.person),
                    controller: TextEditingController(text: 'kaan'),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  context.sized.emptySizedHeightBoxLow3x,
                  IgnorePointer(
                    child: Opacity(
                      opacity: .5,
                      child: EmailField(
                        emailController:
                            TextEditingController(text: 'uzmanakan@gmail.com'),
                        readOnly: true,
                      ),
                    ),
                  ),
                  context.sized.emptySizedHeightBoxLow3x,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        label: const Text('Change Password'),
                        icon: const Icon(Icons.lock_clock),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        label: const Text('Reset Password'),
                        icon: const Icon(Icons.lock_reset_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: context.padding.medium,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}

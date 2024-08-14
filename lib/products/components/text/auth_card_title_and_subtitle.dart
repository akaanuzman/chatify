import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// The card title and subtitle widget.
/// It will show the title and subtitle of the card.
/// The title and subtitle are localized.
final class AuthCardTitleAndSubtitle extends StatelessWidget {
  /// The default constructor.
  const AuthCardTitleAndSubtitle({
    required this.title,
    required this.subtitle,
    super.key,
  });

  /// The title of the card.
  final String title;

  /// The subtitle of the card.
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.general.textTheme.bodyLarge,
        ),
        context.sized.emptySizedHeightBoxLow,
        Text(
          subtitle,
          style: context.general.textTheme.bodySmall,
        ),
      ],
    );
  }
}

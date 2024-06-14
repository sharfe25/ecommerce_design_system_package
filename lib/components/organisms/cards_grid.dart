import 'package:atomic_flutter_package/models/card_model.dart';
import 'package:flutter/material.dart';
import '../molecules/detail_card.dart';
import '../molecules/grid_skeleton.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A widget that displays a grid of products with a title.
///
/// The [CardsGrid] widget arranges the given list of products in a grid layout,
/// with each product displayed as a card. It also includes a title above the grid.
class CardsGrid extends StatelessWidget {
  /// The title to be displayed above the grid.
  final String title;

  /// The list of cards to be displayed in the grid.
  final List<CardModel> cards;

  /// The load indicator.
  final bool isLoading;

  /// Creates a [CardsGrid].
  ///
  /// The [title] and [cards] parameters are required.
  const CardsGrid(
      {Key? key,
      required this.title,
      required this.cards,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the title text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: AppTextStyles.subtitle,
            ),
          ),
          //Display the skeleton
          if (isLoading) const GridSkeleton(),
          // Display the grid of product cards
          if (!isLoading)
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cards.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return DetailCard(cardData: cards[index]);
              },
            ),
        ],
      ),
    );
  }
}

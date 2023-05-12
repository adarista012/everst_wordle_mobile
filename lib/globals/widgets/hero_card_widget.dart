import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/helpers/random_color.dart';
import 'package:wordle_mobile/models/hero_card.dart';

class HeroCardWidget extends StatelessWidget {
  final HeroCard card;
  const HeroCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: RandomColor().random(),
            width: 3.2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        width: width,
        height: 160,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.network(
                width: width,
                height: 160,
                card.thumbnailUrl!,
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width - 18,
                height: 160,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.name ?? 'Name not found',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        shadows: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1),
                            blurRadius: 16,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    const Text(
                      'About character',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0, 0.8),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (card.id != null) {
                  Get.toNamed('/detail', arguments: card);
                }
              },
              elevation: 0,
              minWidth: width,
              height: 160,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelphazero/characters/models/character.dart';
import 'package:marvelphazero/characters/screens/character_details_screen.dart';
import 'package:marvelphazero/helpers/custom_url_launch.dart';
import 'package:marvelphazero/widgets/custome_cach_images.dart';
import 'package:marvelphazero/widgets/rounded_button.dart';

class OneCharacterWidget extends StatelessWidget {
  final Character character;
  const OneCharacterWidget({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasWiki = false;
    // Some characters don't have wiki
    // So we don't show the button
    try {
      hasWiki = character.urls
              .indexWhere((element) => element.type.toLowerCase() == 'wiki') >=
          0;
    } catch (e) {}
    return InkWell(
      onTap: () {
        Get.to(() => CharacterDetailsScreen(
              character: character,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 250,
        width: double.infinity,
        child: Stack(
          children: [
            CustomCachedImage(
              url: character.thumbnail.path +
                  '.' +
                  character.thumbnail.extension,
              width: double.infinity,
              height: 250,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(.5),
                padding: const EdgeInsets.all(16),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character.id.toString(),
                            style: (const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                          const SizedBox(height: 4),
                          Flexible(
                            child: Text(
                              character.name,
                              style: (const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    hasWiki
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RoundedButton(
                                width: 100,
                                contentPadding: const EdgeInsets.all(0),
                                height: 42,
                                content: const Text(
                                  'Open Wiki',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  try {
                                    launchURL(character.urls
                                        .firstWhere(
                                            (element) => element.type == 'wiki')
                                        .url);
                                  } catch (e) {}
                                },
                              )
                            ],
                          )
                        : IgnorePointer(
                            ignoring: true,
                            child: RoundedButton(
                              width: 100,
                              backgroundColor: Colors.grey,
                              contentPadding: const EdgeInsets.all(0),
                              height: 42,
                              content: const Text(
                                'No Wiki',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

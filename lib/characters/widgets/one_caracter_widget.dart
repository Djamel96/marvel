import 'package:flutter/material.dart';
import 'package:marvelphazero/characters/models/character.dart';
import 'package:marvelphazero/helpers/custom_url_launch.dart';
import 'package:marvelphazero/widgets/custome_cach_images.dart';
import 'package:marvelphazero/widgets/rounded_button.dart';

class OneCharacterWidget extends StatelessWidget {
  final Character character;
  const OneCharacterWidget({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          CustomCachedImage(
            url: character.thumbnail.path + '.' + character.thumbnail.extension,
            width: double.infinity,
            height: 250,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(.5),
              padding: EdgeInsets.all(16),
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.id.toString(),
                        style: (const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        character.name,
                        style: (const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  Row(
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
                          launchURL(character.urls
                              .firstWhere((element) => element.type == 'wiki')
                              .url);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

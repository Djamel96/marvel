import 'package:flutter/material.dart';
import 'package:marvelphazero/characters/models/comic_data.dart';
import 'package:marvelphazero/helpers/custom_url_launch.dart';
import 'package:marvelphazero/helpers/text_helpers.dart';
import 'package:marvelphazero/widgets/rounded_button.dart';

class ComicitemWidget extends StatelessWidget {
  final Result comicsItem;
  const ComicitemWidget({
    Key? key,
    required this.comicsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      alignment: Alignment.center,
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color(0x190a1646),
              offset: Offset(0, 3),
              blurRadius: 7,
              spreadRadius: 0),
          BoxShadow(
              color: Color(0x0f0a1646),
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 0)
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comicsItem.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: List<Widget>.generate(
                  comicsItem.urls.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                        child: RoundedButton(
                          width: 90,
                          contentPadding: const EdgeInsets.all(0),
                          height: 42,
                          content: Text(
                            capitalize(comicsItem.urls[index].type),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            try {
                              launchURL(comicsItem.urls[index].url);
                            } catch (e) {}
                          },
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

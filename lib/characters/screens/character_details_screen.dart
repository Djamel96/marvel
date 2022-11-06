import 'package:flutter/material.dart';
import 'package:marvelphazero/characters/models/character.dart';
import 'package:marvelphazero/characters/widgets/comic_item_widget.dart';
import 'package:marvelphazero/them/colors.dart';
import 'package:marvelphazero/widgets/custom_safe_area.dart';
import 'package:marvelphazero/widgets/custome_cach_images.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 260.0,
              centerTitle: true,
              toolbarHeight: 50,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: Colors.white.withOpacity(.6),
                    child: Text(
                      widget.character.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.defaultTextColor,
                      ),
                    )),
                background: CustomCachedImage(
                  url: widget.character.thumbnail.path +
                      '.' +
                      widget.character.thumbnail.extension,
                  width: double.infinity,
                  height: 260,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 20.0 : 0),
                    child: ComicitemWidget(
                      comicsItem: widget.character.comics.items[index],
                    ),
                  );
                },
                childCount: widget.character.comics.items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marvelphazero/characters/models/character.dart';
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
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 250.0,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: Colors.white.withOpacity(.4),
                    child: Text(
                      widget.character.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.defaultTextColor,
                      ),
                    )),
                background: CustomCachedImage(
                  url: widget.character.thumbnail.path +
                      '.' +
                      widget.character.thumbnail.extension,
                  width: double.infinity,
                  height: 250,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

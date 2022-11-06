import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelphazero/characters/models/character.dart';
import 'package:marvelphazero/characters/models/character_provider.dart';
import 'package:marvelphazero/characters/models/comic_data.dart';
import 'package:marvelphazero/characters/services/get_caracter_comics.dart';
import 'package:marvelphazero/characters/widgets/comic_item_widget.dart';
import 'package:marvelphazero/them/colors.dart';
import 'package:marvelphazero/widgets/custom_safe_area.dart';
import 'package:marvelphazero/widgets/custome_cach_images.dart';
import 'package:marvelphazero/widgets/default_loading.dart';
import 'package:marvelphazero/widgets/error_occured_widget.dart';
import 'package:provider/provider.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  final ScrollController scrollController = ScrollController();
  late ComicData comicData;
  bool loading = true;
  bool error = false;
  bool loadingMore = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (mounted) {
        _firstLoad();
      }
    });
  }

  /// When user open the character details screen
  /// call [_firstLoad] to fetch the data

  _firstLoad() {
    setState(() {
      loading = true;
      error = false;
    });
    getCharacterComicList(
      character: widget.character,
      offset: 0,
    ).then((res) {
      if (mounted) {
        if (res.success) {
          setState(() {
            comicData = res.value;
            comicData.offset = comicData.count;
            loading = false;
          });
          _loadMoreOnScrolle();
        } else {
          setState(() {
            loading = false;
            error = true;
          });
        }
      }
    });
  }

  /// When user scrolle the screen to bottom
  /// we call [_loadMoreOnScrolle] to load more
  /// character comics by the pagination

  _loadMoreOnScrolle() {
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: false);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (!characterProvider.laodingMore && mounted) {
          getCharacterComicList(
            character: widget.character,
            offset: comicData.offset,
          ).then((res) {
            if (mounted) {
              setState(() {
                loadingMore = false;
              });
              if (res.success) {
                ComicData _comicDataRes = res.value;
                _setData(_comicDataRes);
              }
            }
          });
        }
      }
    });
  }

  _setData(ComicData _comicDataRes) {
    setState(() {
      comicData = ComicData(
        offset: _comicDataRes.offset + _comicDataRes.count,
        limit: _comicDataRes.limit,
        total: _comicDataRes.total,
        count: _comicDataRes.count,
        results: comicData.results + _comicDataRes.results,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        body: loading
            ? const Loading()
            : Container(
                child: error
                    ? ErrorOccuredWidget(
                        onRetry: () {
                          _firstLoad();
                        },
                        showAppbar: true,
                      )
                    : CustomScrollView(
                        controller: scrollController,
                        slivers: <Widget>[
                          SliverAppBar(
                            pinned: true,
                            expandedHeight: 260.0,
                            centerTitle: true,
                            toolbarHeight: 50,
                            automaticallyImplyLeading: false,
                            leading: Container(
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.6),
                                shape: BoxShape.circle,
                              ),
                              child: BackButton(
                                onPressed: () => Get.back(),
                              ),
                            ),
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
                          widget.character.comics.items.isNotEmpty
                              ? SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            top: index == 0 ? 20.0 : 0),
                                        child: ComicitemWidget(
                                          comicsItem: comicData.results[index],
                                        ),
                                      );
                                    },
                                    childCount: comicData.results.length,
                                  ),
                                )
                              : SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return const Padding(
                                        padding: EdgeInsets.only(top: 40),
                                        child: Center(
                                            child: Text(
                                          "No Comics available !",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )),
                                      );
                                    },
                                    childCount: 1,
                                  ),
                                ),
                        ],
                      ),
              ),
      ),
    );
  }
}

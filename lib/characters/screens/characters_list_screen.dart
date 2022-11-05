import 'package:flutter/material.dart';
import 'package:marvelphazero/characters/models/character_provider.dart';
import 'package:marvelphazero/characters/services/get_characters_list_service.dart';
import 'package:marvelphazero/characters/widgets/one_caracter_widget.dart';
import 'package:marvelphazero/widgets/default_loading.dart';
import 'package:provider/provider.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (mounted) {
        _firstLoad();
      }
    });
  }

  /// When user open the character screen the first time we
  /// call [_firstLoad] to fetch the data

  _firstLoad() {
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: true);
    getCharactersList(characterProvider, refresh: true).then((res) {
      if (mounted && res.success) {
        _loadMoreOnScrolle();
      }
    });
  }

  /// When user scrolle the screen to bottom
  /// we call [_loadMoreOnScrolle] to load more
  /// characters by the pagination

  _loadMoreOnScrolle() {
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: true);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getCharactersList(characterProvider, refresh: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: true);
    return Scaffold(
      body: characterProvider.loading
          ? const Loading()
          : ListView(
              controller: scrollController,
              children: List<Widget>.generate(
                  characterProvider.resultApi.results.length,
                  (index) => OneCharacterWidget(
                        character: characterProvider.resultApi.results[index],
                      )),
            ),
    );
  }
}

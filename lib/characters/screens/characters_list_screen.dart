import 'package:flutter/material.dart';
import 'package:marvelphazero/characters/models/character_provider.dart';
import 'package:marvelphazero/widgets/default_loading.dart';
import 'package:provider/provider.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  @override
  Widget build(BuildContext context) {
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: true);
    return Scaffold(
      body: characterProvider.loading ? const Loading() : ListView(),
    );
  }
}

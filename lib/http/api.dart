class Api {
  static const String root = 'https://gateway.marvel.com:443';
  static const String version = 'v1';
  static const String apiroot = '$root/$version/public';

  static const String characters = '$apiroot/characters';
}

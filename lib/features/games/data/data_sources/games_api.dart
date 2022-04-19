import 'package:riverpod/riverpod.dart';

final gamesApiDataSourceProvider = Provider.autoDispose<GameApiDataSource>(
  (ref) => const GameApiDataSource(),
);

class GameApiDataSource {
  const GameApiDataSource({
    this.baseUrl = 'https://www.freetogame.com/api',
    this.gamesEndpoint = '/games',
    this.contentType = 'application/json',
  });

  final String baseUrl;
  final String gamesEndpoint;
  final String contentType;
}

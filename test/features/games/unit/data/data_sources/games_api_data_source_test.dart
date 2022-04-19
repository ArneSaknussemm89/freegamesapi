import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';

import '../../../../../utils.dart';

const fakeBaseUrl = 'https://fake.freetogame.com/api';
const fakeGamesEndpoint = '/fake-games';
const fakeContentType = 'application/fake-json';

void main() {
  late MockGameApiDataSource mockedSource;

  setUp(() {
    mockedSource = MockGameApiDataSource();
    when(() => mockedSource.baseUrl).thenReturn(fakeBaseUrl);
    when(() => mockedSource.gamesEndpoint).thenReturn(fakeGamesEndpoint);
    when(() => mockedSource.contentType).thenReturn(fakeContentType);
  });

  test('games api source has correct URL', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final source = container.read(gamesApiDataSourceProvider);

    expect(source.baseUrl, 'https://www.freetogame.com/api');
    expect(source.gamesEndpoint, '/games');
    expect(source.contentType, 'application/json');
  });

  test('games api source can be overridden', () async {
    final container = ProviderContainer(
      overrides: [
        gamesApiDataSourceProvider.overrideWithProvider(Provider.autoDispose((ref) => mockedSource)),
      ],
    );
    addTearDown(container.dispose);

    final source = container.read(gamesApiDataSourceProvider);

    expect(source.baseUrl, fakeBaseUrl);
    expect(source.gamesEndpoint, fakeGamesEndpoint);
    expect(source.contentType, fakeContentType);
  });
}

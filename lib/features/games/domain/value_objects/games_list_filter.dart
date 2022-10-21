import 'package:freezed_annotation/freezed_annotation.dart';

part 'games_list_filter.g.dart';

@JsonEnum()
enum GamesListFilter {
  all,
  onlyFavorites,
}
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'code')
enum GamesListFilter {
  all('all'),
  onlyFavorites('favorites');

  const GamesListFilter(this.code);
  final String code;
}

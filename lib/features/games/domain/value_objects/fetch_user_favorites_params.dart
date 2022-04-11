import 'package:equatable/equatable.dart';

extension FetchUserFavoritesUseCaseParamsX on String {
  FetchUserFavoritesUseCaseParams get toFetchUserFavoritesUseCaseParams => FetchUserFavoritesUseCaseParams(this);
}

class FetchUserFavoritesUseCaseParams extends Equatable {
  const FetchUserFavoritesUseCaseParams(this.uid);

  final String uid;

  @override
  List<Object?> get props => [uid];
}

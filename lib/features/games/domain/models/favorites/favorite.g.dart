// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class FavoriteGameCollectionReference
    implements
        FavoriteGameQuery,
        FirestoreCollectionReference<FavoriteGame, FavoriteGameQuerySnapshot> {
  factory FavoriteGameCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$FavoriteGameCollectionReference;

  static FavoriteGame fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return FavoriteGame.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    FavoriteGame value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<FavoriteGame> get reference;

  @override
  FavoriteGameDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FavoriteGameDocumentReference> add(FavoriteGame value);
}

class _$FavoriteGameCollectionReference extends _$FavoriteGameQuery
    implements FavoriteGameCollectionReference {
  factory _$FavoriteGameCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$FavoriteGameCollectionReference._(
      firestore.collection('favorites').withConverter(
            fromFirestore: FavoriteGameCollectionReference.fromFirestore,
            toFirestore: FavoriteGameCollectionReference.toFirestore,
          ),
    );
  }

  _$FavoriteGameCollectionReference._(
    CollectionReference<FavoriteGame> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<FavoriteGame> get reference =>
      super.reference as CollectionReference<FavoriteGame>;

  @override
  FavoriteGameDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return FavoriteGameDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<FavoriteGameDocumentReference> add(FavoriteGame value) {
    return reference
        .add(value)
        .then((ref) => FavoriteGameDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$FavoriteGameCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class FavoriteGameDocumentReference extends FirestoreDocumentReference<
    FavoriteGame, FavoriteGameDocumentSnapshot> {
  factory FavoriteGameDocumentReference(
          DocumentReference<FavoriteGame> reference) =
      _$FavoriteGameDocumentReference;

  DocumentReference<FavoriteGame> get reference;

  /// A reference to the [FavoriteGameCollectionReference] containing this document.
  FavoriteGameCollectionReference get parent {
    return _$FavoriteGameCollectionReference(reference.firestore);
  }

  @override
  Stream<FavoriteGameDocumentSnapshot> snapshots();

  @override
  Future<FavoriteGameDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    int gameId,
    FieldValue gameIdFieldValue,
    String ownerId,
    FieldValue ownerIdFieldValue,
    DateTime savedOn,
    FieldValue savedOnFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    int gameId,
    FieldValue gameIdFieldValue,
    String ownerId,
    FieldValue ownerIdFieldValue,
    DateTime savedOn,
    FieldValue savedOnFieldValue,
  });
}

class _$FavoriteGameDocumentReference extends FirestoreDocumentReference<
    FavoriteGame,
    FavoriteGameDocumentSnapshot> implements FavoriteGameDocumentReference {
  _$FavoriteGameDocumentReference(this.reference);

  @override
  final DocumentReference<FavoriteGame> reference;

  /// A reference to the [FavoriteGameCollectionReference] containing this document.
  FavoriteGameCollectionReference get parent {
    return _$FavoriteGameCollectionReference(reference.firestore);
  }

  @override
  Stream<FavoriteGameDocumentSnapshot> snapshots() {
    return reference.snapshots().map(FavoriteGameDocumentSnapshot._);
  }

  @override
  Future<FavoriteGameDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(FavoriteGameDocumentSnapshot._);
  }

  @override
  Future<FavoriteGameDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(FavoriteGameDocumentSnapshot._);
  }

  Future<void> update({
    Object? gameId = _sentinel,
    FieldValue? gameIdFieldValue,
    Object? ownerId = _sentinel,
    FieldValue? ownerIdFieldValue,
    Object? savedOn = _sentinel,
    FieldValue? savedOnFieldValue,
  }) async {
    assert(
      gameId == _sentinel || gameIdFieldValue == null,
      "Cannot specify both gameId and gameIdFieldValue",
    );
    assert(
      ownerId == _sentinel || ownerIdFieldValue == null,
      "Cannot specify both ownerId and ownerIdFieldValue",
    );
    assert(
      savedOn == _sentinel || savedOnFieldValue == null,
      "Cannot specify both savedOn and savedOnFieldValue",
    );
    final json = {
      if (gameId != _sentinel)
        _$FavoriteGameFieldMap['gameId']!:
            _$FavoriteGamePerFieldToJson.gameId(gameId as int),
      if (gameIdFieldValue != null)
        _$FavoriteGameFieldMap['gameId']!: gameIdFieldValue,
      if (ownerId != _sentinel)
        _$FavoriteGameFieldMap['ownerId']!:
            _$FavoriteGamePerFieldToJson.ownerId(ownerId as String),
      if (ownerIdFieldValue != null)
        _$FavoriteGameFieldMap['ownerId']!: ownerIdFieldValue,
      if (savedOn != _sentinel)
        _$FavoriteGameFieldMap['savedOn']!:
            _$FavoriteGamePerFieldToJson.savedOn(savedOn as DateTime),
      if (savedOnFieldValue != null)
        _$FavoriteGameFieldMap['savedOn']!: savedOnFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? gameId = _sentinel,
    FieldValue? gameIdFieldValue,
    Object? ownerId = _sentinel,
    FieldValue? ownerIdFieldValue,
    Object? savedOn = _sentinel,
    FieldValue? savedOnFieldValue,
  }) {
    assert(
      gameId == _sentinel || gameIdFieldValue == null,
      "Cannot specify both gameId and gameIdFieldValue",
    );
    assert(
      ownerId == _sentinel || ownerIdFieldValue == null,
      "Cannot specify both ownerId and ownerIdFieldValue",
    );
    assert(
      savedOn == _sentinel || savedOnFieldValue == null,
      "Cannot specify both savedOn and savedOnFieldValue",
    );
    final json = {
      if (gameId != _sentinel)
        _$FavoriteGameFieldMap['gameId']!:
            _$FavoriteGamePerFieldToJson.gameId(gameId as int),
      if (gameIdFieldValue != null)
        _$FavoriteGameFieldMap['gameId']!: gameIdFieldValue,
      if (ownerId != _sentinel)
        _$FavoriteGameFieldMap['ownerId']!:
            _$FavoriteGamePerFieldToJson.ownerId(ownerId as String),
      if (ownerIdFieldValue != null)
        _$FavoriteGameFieldMap['ownerId']!: ownerIdFieldValue,
      if (savedOn != _sentinel)
        _$FavoriteGameFieldMap['savedOn']!:
            _$FavoriteGamePerFieldToJson.savedOn(savedOn as DateTime),
      if (savedOnFieldValue != null)
        _$FavoriteGameFieldMap['savedOn']!: savedOnFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteGameDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class FavoriteGameQuery
    implements QueryReference<FavoriteGame, FavoriteGameQuerySnapshot> {
  @override
  FavoriteGameQuery limit(int limit);

  @override
  FavoriteGameQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  FavoriteGameQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  FavoriteGameQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FavoriteGameQuery whereGameId({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  FavoriteGameQuery whereOwnerId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FavoriteGameQuery whereSavedOn({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  FavoriteGameQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });

  FavoriteGameQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });

  FavoriteGameQuery orderByGameId({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });

  FavoriteGameQuery orderByOwnerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });

  FavoriteGameQuery orderBySavedOn({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });
}

class _$FavoriteGameQuery
    extends QueryReference<FavoriteGame, FavoriteGameQuerySnapshot>
    implements FavoriteGameQuery {
  _$FavoriteGameQuery(
    this._collection, {
    required Query<FavoriteGame> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<FavoriteGameQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(FavoriteGameQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<FavoriteGameQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(FavoriteGameQuerySnapshot._fromQuerySnapshot);
  }

  @override
  FavoriteGameQuery limit(int limit) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FavoriteGameQuery limitToLast(int limit) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FavoriteGameQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FavoriteGameQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FavoriteGameQuery whereGameId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['gameId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FavoriteGamePerFieldToJson.gameId(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FavoriteGamePerFieldToJson.gameId(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$FavoriteGamePerFieldToJson.gameId(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FavoriteGamePerFieldToJson.gameId(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FavoriteGamePerFieldToJson.gameId(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FavoriteGamePerFieldToJson.gameId(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$FavoriteGamePerFieldToJson.gameId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FavoriteGamePerFieldToJson.gameId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FavoriteGameQuery whereOwnerId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['ownerId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FavoriteGamePerFieldToJson.ownerId(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FavoriteGamePerFieldToJson.ownerId(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$FavoriteGamePerFieldToJson.ownerId(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FavoriteGamePerFieldToJson
                .ownerId(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FavoriteGamePerFieldToJson.ownerId(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FavoriteGamePerFieldToJson
                .ownerId(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$FavoriteGamePerFieldToJson.ownerId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FavoriteGamePerFieldToJson.ownerId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FavoriteGameQuery whereSavedOn({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['savedOn']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FavoriteGamePerFieldToJson.savedOn(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FavoriteGamePerFieldToJson.savedOn(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$FavoriteGamePerFieldToJson.savedOn(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FavoriteGamePerFieldToJson
                .savedOn(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FavoriteGamePerFieldToJson.savedOn(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FavoriteGamePerFieldToJson
                .savedOn(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$FavoriteGamePerFieldToJson.savedOn(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FavoriteGamePerFieldToJson.savedOn(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FavoriteGameQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FavoriteGameQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FavoriteGameQuery orderByGameId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FavoriteGameFieldMap['gameId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FavoriteGameQuery orderByOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FavoriteGameFieldMap['ownerId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FavoriteGameQuery orderBySavedOn({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FavoriteGameFieldMap['savedOn']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$FavoriteGameQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class FavoriteGameDocumentSnapshot
    extends FirestoreDocumentSnapshot<FavoriteGame> {
  FavoriteGameDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<FavoriteGame> snapshot;

  @override
  FavoriteGameDocumentReference get reference {
    return FavoriteGameDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final FavoriteGame? data;
}

class FavoriteGameQuerySnapshot extends FirestoreQuerySnapshot<FavoriteGame,
    FavoriteGameQueryDocumentSnapshot> {
  FavoriteGameQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory FavoriteGameQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<FavoriteGame> snapshot,
  ) {
    final docs =
        snapshot.docs.map(FavoriteGameQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        FavoriteGameDocumentSnapshot._,
      );
    }).toList();

    return FavoriteGameQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<FavoriteGameDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    FavoriteGameDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<FavoriteGameDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<FavoriteGame> snapshot;

  @override
  final List<FavoriteGameQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FavoriteGameDocumentSnapshot>> docChanges;
}

class FavoriteGameQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<FavoriteGame>
    implements FavoriteGameDocumentSnapshot {
  FavoriteGameQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<FavoriteGame> snapshot;

  @override
  final FavoriteGame data;

  @override
  FavoriteGameDocumentReference get reference {
    return FavoriteGameDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteGame _$FavoriteGameFromJson(Map<String, dynamic> json) => FavoriteGame(
      gameId: (json['gameId'] as num).toInt(),
      ownerId: json['ownerId'] as String,
      savedOn: const FirestoreDateTimeConverter()
          .fromJson(json['savedOn'] as Timestamp),
    );

const _$FavoriteGameFieldMap = <String, String>{
  'gameId': 'gameId',
  'ownerId': 'ownerId',
  'savedOn': 'savedOn',
};

Map<String, dynamic> _$FavoriteGameToJson(FavoriteGame instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'ownerId': instance.ownerId,
      'savedOn': const FirestoreDateTimeConverter().toJson(instance.savedOn),
    };

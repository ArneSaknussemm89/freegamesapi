// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

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
    List<Object?> props,
    FieldValue propsFieldValue,
    bool? stringify,
    FieldValue stringifyFieldValue,
    int hashCode,
    FieldValue hashCodeFieldValue,
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
    List<Object?> props,
    FieldValue propsFieldValue,
    bool? stringify,
    FieldValue stringifyFieldValue,
    int hashCode,
    FieldValue hashCodeFieldValue,
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
    return reference.snapshots().map((snapshot) {
      return FavoriteGameDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<FavoriteGameDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return FavoriteGameDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<FavoriteGameDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then((snapshot) {
      return FavoriteGameDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  Future<void> update({
    Object? gameId = _sentinel,
    FieldValue? gameIdFieldValue,
    Object? ownerId = _sentinel,
    FieldValue? ownerIdFieldValue,
    Object? savedOn = _sentinel,
    FieldValue? savedOnFieldValue,
    Object? props = _sentinel,
    FieldValue? propsFieldValue,
    Object? stringify = _sentinel,
    FieldValue? stringifyFieldValue,
    Object? hashCode = _sentinel,
    FieldValue? hashCodeFieldValue,
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
    assert(
      props == _sentinel || propsFieldValue == null,
      "Cannot specify both props and propsFieldValue",
    );
    assert(
      stringify == _sentinel || stringifyFieldValue == null,
      "Cannot specify both stringify and stringifyFieldValue",
    );
    assert(
      hashCode == _sentinel || hashCodeFieldValue == null,
      "Cannot specify both hashCode and hashCodeFieldValue",
    );
    final json = {
      if (gameId != _sentinel) 'gameId': gameId as int,
      if (gameIdFieldValue != null) 'gameId': gameIdFieldValue,
      if (ownerId != _sentinel) 'ownerId': ownerId as String,
      if (ownerIdFieldValue != null) 'ownerId': ownerIdFieldValue,
      if (savedOn != _sentinel) 'savedOn': savedOn as DateTime,
      if (savedOnFieldValue != null) 'savedOn': savedOnFieldValue,
      if (props != _sentinel) 'props': props as List<Object?>,
      if (propsFieldValue != null) 'props': propsFieldValue,
      if (stringify != _sentinel) 'stringify': stringify as bool?,
      if (stringifyFieldValue != null) 'stringify': stringifyFieldValue,
      if (hashCode != _sentinel) 'hashCode': hashCode as int,
      if (hashCodeFieldValue != null) 'hashCode': hashCodeFieldValue,
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
    Object? props = _sentinel,
    FieldValue? propsFieldValue,
    Object? stringify = _sentinel,
    FieldValue? stringifyFieldValue,
    Object? hashCode = _sentinel,
    FieldValue? hashCodeFieldValue,
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
    assert(
      props == _sentinel || propsFieldValue == null,
      "Cannot specify both props and propsFieldValue",
    );
    assert(
      stringify == _sentinel || stringifyFieldValue == null,
      "Cannot specify both stringify and stringifyFieldValue",
    );
    assert(
      hashCode == _sentinel || hashCodeFieldValue == null,
      "Cannot specify both hashCode and hashCodeFieldValue",
    );
    final json = {
      if (gameId != _sentinel) 'gameId': gameId as int,
      if (gameIdFieldValue != null) 'gameId': gameIdFieldValue,
      if (ownerId != _sentinel) 'ownerId': ownerId as String,
      if (ownerIdFieldValue != null) 'ownerId': ownerIdFieldValue,
      if (savedOn != _sentinel) 'savedOn': savedOn as DateTime,
      if (savedOnFieldValue != null) 'savedOn': savedOnFieldValue,
      if (props != _sentinel) 'props': props as List<Object?>,
      if (propsFieldValue != null) 'props': propsFieldValue,
      if (stringify != _sentinel) 'stringify': stringify as bool?,
      if (stringifyFieldValue != null) 'stringify': stringifyFieldValue,
      if (hashCode != _sentinel) 'hashCode': hashCode as int,
      if (hashCodeFieldValue != null) 'hashCode': hashCodeFieldValue,
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

class FavoriteGameDocumentSnapshot
    extends FirestoreDocumentSnapshot<FavoriteGame> {
  FavoriteGameDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

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

abstract class FavoriteGameQuery
    implements QueryReference<FavoriteGame, FavoriteGameQuerySnapshot> {
  @override
  FavoriteGameQuery limit(int limit);

  @override
  FavoriteGameQuery limitToLast(int limit);

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
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });

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
    FieldPath fieldPath, {
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
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  FavoriteGameQuery whereGameId({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  FavoriteGameQuery whereOwnerId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  FavoriteGameQuery whereSavedOn({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  FavoriteGameQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
  });
  FavoriteGameQuery whereStringify({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  FavoriteGameQuery whereHashCode({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
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

  FavoriteGameQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });

  FavoriteGameQuery orderByStringify({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    FavoriteGameDocumentSnapshot? startAtDocument,
    FavoriteGameDocumentSnapshot? endAtDocument,
    FavoriteGameDocumentSnapshot? endBeforeDocument,
    FavoriteGameDocumentSnapshot? startAfterDocument,
  });

  FavoriteGameQuery orderByHashCode({
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

  FavoriteGameQuerySnapshot _decodeSnapshot(
    QuerySnapshot<FavoriteGame> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return FavoriteGameQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<FavoriteGameDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: FavoriteGameDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return FavoriteGameQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<FavoriteGameQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<FavoriteGameQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
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

  FavoriteGameQuery orderByFieldPath(
    FieldPath fieldPath, {
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

  FavoriteGameQuery whereFieldPath(
    FieldPath fieldPath, {
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
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  FavoriteGameQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  FavoriteGameQuery whereGameId({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['gameId']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  FavoriteGameQuery whereOwnerId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['ownerId']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  FavoriteGameQuery whereSavedOn({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['savedOn']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  FavoriteGameQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['props']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  FavoriteGameQuery whereStringify({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['stringify']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  FavoriteGameQuery whereHashCode({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$FavoriteGameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FavoriteGameFieldMap['hashCode']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

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

  FavoriteGameQuery orderByProps({
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
        .orderBy(_$FavoriteGameFieldMap['props']!, descending: descending);
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

  FavoriteGameQuery orderByStringify({
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
        .orderBy(_$FavoriteGameFieldMap['stringify']!, descending: descending);
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

  FavoriteGameQuery orderByHashCode({
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
        .orderBy(_$FavoriteGameFieldMap['hashCode']!, descending: descending);
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

class FavoriteGameQuerySnapshot extends FirestoreQuerySnapshot<FavoriteGame,
    FavoriteGameQueryDocumentSnapshot> {
  FavoriteGameQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<FavoriteGame> snapshot;

  @override
  final List<FavoriteGameQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FavoriteGameDocumentSnapshot>> docChanges;
}

class FavoriteGameQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<FavoriteGame>
    implements FavoriteGameDocumentSnapshot {
  FavoriteGameQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<FavoriteGame> snapshot;

  @override
  FavoriteGameDocumentReference get reference {
    return FavoriteGameDocumentReference(snapshot.reference);
  }

  @override
  final FavoriteGame data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteGame _$FavoriteGameFromJson(Map<String, dynamic> json) => FavoriteGame(
      gameId: json['gameId'] as int,
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

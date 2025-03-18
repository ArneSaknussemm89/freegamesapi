// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

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
abstract class AppUserCollectionReference
    implements
        AppUserQuery,
        FirestoreCollectionReference<AppUser, AppUserQuerySnapshot> {
  factory AppUserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AppUserCollectionReference;

  static AppUser fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return AppUser.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AppUser value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<AppUser> get reference;

  @override
  AppUserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AppUserDocumentReference> add(AppUser value);
}

class _$AppUserCollectionReference extends _$AppUserQuery
    implements AppUserCollectionReference {
  factory _$AppUserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AppUserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: AppUserCollectionReference.fromFirestore,
            toFirestore: AppUserCollectionReference.toFirestore,
          ),
    );
  }

  _$AppUserCollectionReference._(
    CollectionReference<AppUser> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<AppUser> get reference =>
      super.reference as CollectionReference<AppUser>;

  @override
  AppUserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return AppUserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AppUserDocumentReference> add(AppUser value) {
    return reference.add(value).then((ref) => AppUserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppUserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AppUserDocumentReference
    extends FirestoreDocumentReference<AppUser, AppUserDocumentSnapshot> {
  factory AppUserDocumentReference(DocumentReference<AppUser> reference) =
      _$AppUserDocumentReference;

  DocumentReference<AppUser> get reference;

  /// A reference to the [AppUserCollectionReference] containing this document.
  AppUserCollectionReference get parent {
    return _$AppUserCollectionReference(reference.firestore);
  }

  @override
  Stream<AppUserDocumentSnapshot> snapshots();

  @override
  Future<AppUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    AppUser model, {
    SetOptions? options,
    FieldValue uidFieldValue,
    FieldValue displayNameFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    AppUser model, {
    SetOptions? options,
    FieldValue uidFieldValue,
    FieldValue displayNameFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    AppUser model, {
    SetOptions? options,
    FieldValue uidFieldValue,
    FieldValue displayNameFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String uid,
    FieldValue uidFieldValue,
    String displayName,
    FieldValue displayNameFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String uid,
    FieldValue uidFieldValue,
    String displayName,
    FieldValue displayNameFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String uid,
    FieldValue uidFieldValue,
    String displayName,
    FieldValue displayNameFieldValue,
  });
}

class _$AppUserDocumentReference
    extends FirestoreDocumentReference<AppUser, AppUserDocumentSnapshot>
    implements AppUserDocumentReference {
  _$AppUserDocumentReference(this.reference);

  @override
  final DocumentReference<AppUser> reference;

  /// A reference to the [AppUserCollectionReference] containing this document.
  AppUserCollectionReference get parent {
    return _$AppUserCollectionReference(reference.firestore);
  }

  @override
  Stream<AppUserDocumentSnapshot> snapshots() {
    return reference.snapshots().map(AppUserDocumentSnapshot._);
  }

  @override
  Future<AppUserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(AppUserDocumentSnapshot._);
  }

  @override
  Future<AppUserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(AppUserDocumentSnapshot._);
  }

  Future<void> set(
    AppUser model, {
    SetOptions? options,
    FieldValue? uidFieldValue,
    FieldValue? displayNameFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (uidFieldValue != null) _$AppUserFieldMap['uid']!: uidFieldValue,
      if (displayNameFieldValue != null)
        _$AppUserFieldMap['displayName']!: displayNameFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    AppUser model, {
    SetOptions? options,
    FieldValue? uidFieldValue,
    FieldValue? displayNameFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (uidFieldValue != null) _$AppUserFieldMap['uid']!: uidFieldValue,
      if (displayNameFieldValue != null)
        _$AppUserFieldMap['displayName']!: displayNameFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    AppUser model, {
    SetOptions? options,
    FieldValue? uidFieldValue,
    FieldValue? displayNameFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (uidFieldValue != null) _$AppUserFieldMap['uid']!: uidFieldValue,
      if (displayNameFieldValue != null)
        _$AppUserFieldMap['displayName']!: displayNameFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    final json = {
      if (uid != _sentinel)
        _$AppUserFieldMap['uid']!: _$AppUserPerFieldToJson.uid(uid as String),
      if (uidFieldValue != null) _$AppUserFieldMap['uid']!: uidFieldValue,
      if (displayName != _sentinel)
        _$AppUserFieldMap['displayName']!:
            _$AppUserPerFieldToJson.displayName(displayName as String),
      if (displayNameFieldValue != null)
        _$AppUserFieldMap['displayName']!: displayNameFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    final json = {
      if (uid != _sentinel)
        _$AppUserFieldMap['uid']!: _$AppUserPerFieldToJson.uid(uid as String),
      if (uidFieldValue != null) _$AppUserFieldMap['uid']!: uidFieldValue,
      if (displayName != _sentinel)
        _$AppUserFieldMap['displayName']!:
            _$AppUserPerFieldToJson.displayName(displayName as String),
      if (displayNameFieldValue != null)
        _$AppUserFieldMap['displayName']!: displayNameFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    final json = {
      if (uid != _sentinel)
        _$AppUserFieldMap['uid']!: _$AppUserPerFieldToJson.uid(uid as String),
      if (uidFieldValue != null) _$AppUserFieldMap['uid']!: uidFieldValue,
      if (displayName != _sentinel)
        _$AppUserFieldMap['displayName']!:
            _$AppUserPerFieldToJson.displayName(displayName as String),
      if (displayNameFieldValue != null)
        _$AppUserFieldMap['displayName']!: displayNameFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is AppUserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class AppUserQuery
    implements QueryReference<AppUser, AppUserQuerySnapshot> {
  @override
  AppUserQuery limit(int limit);

  @override
  AppUserQuery limitToLast(int limit);

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
  AppUserQuery whereFieldPath(
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

  AppUserQuery whereDocumentId({
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

  AppUserQuery whereUid({
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

  AppUserQuery whereDisplayName({
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
  AppUserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });

  AppUserQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });

  AppUserQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });

  AppUserQuery orderByDisplayName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });
}

class _$AppUserQuery extends QueryReference<AppUser, AppUserQuerySnapshot>
    implements AppUserQuery {
  _$AppUserQuery(
    this._collection, {
    required Query<AppUser> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<AppUserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(AppUserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<AppUserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(AppUserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  AppUserQuery limit(int limit) {
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AppUserQuery limitToLast(int limit) {
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AppUserQuery whereFieldPath(
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
    return _$AppUserQuery(
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
  AppUserQuery whereDocumentId({
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
    return _$AppUserQuery(
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
  AppUserQuery whereUid({
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
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppUserFieldMap['uid']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AppUserPerFieldToJson.uid(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AppUserPerFieldToJson.uid(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$AppUserPerFieldToJson.uid(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AppUserPerFieldToJson.uid(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AppUserPerFieldToJson.uid(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AppUserPerFieldToJson.uid(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$AppUserPerFieldToJson.uid(e)),
        whereNotIn: whereNotIn?.map((e) => _$AppUserPerFieldToJson.uid(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AppUserQuery whereDisplayName({
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
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppUserFieldMap['displayName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AppUserPerFieldToJson.displayName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AppUserPerFieldToJson.displayName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$AppUserPerFieldToJson.displayName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AppUserPerFieldToJson.displayName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AppUserPerFieldToJson.displayName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AppUserPerFieldToJson
                .displayName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$AppUserPerFieldToJson.displayName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AppUserPerFieldToJson.displayName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AppUserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
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

    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AppUserQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
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

    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AppUserQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$AppUserFieldMap['uid']!,
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

    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AppUserQuery orderByDisplayName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AppUserFieldMap['displayName']!, descending: descending);
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

    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppUserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AppUserDocumentSnapshot extends FirestoreDocumentSnapshot<AppUser> {
  AppUserDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<AppUser> snapshot;

  @override
  AppUserDocumentReference get reference {
    return AppUserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AppUser? data;
}

class AppUserQuerySnapshot
    extends FirestoreQuerySnapshot<AppUser, AppUserQueryDocumentSnapshot> {
  AppUserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory AppUserQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<AppUser> snapshot,
  ) {
    final docs = snapshot.docs.map(AppUserQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        AppUserDocumentSnapshot._,
      );
    }).toList();

    return AppUserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<AppUserDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    AppUserDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<AppUserDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<AppUser> snapshot;

  @override
  final List<AppUserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AppUserDocumentSnapshot>> docChanges;
}

class AppUserQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<AppUser>
    implements AppUserDocumentSnapshot {
  AppUserQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<AppUser> snapshot;

  @override
  final AppUser data;

  @override
  AppUserDocumentReference get reference {
    return AppUserDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
    );

const _$AppUserFieldMap = <String, String>{
  'uid': 'uid',
  'displayName': 'displayName',
};

// ignore: unused_element
abstract class _$AppUserPerFieldToJson {
  // ignore: unused_element
  static Object? uid(String instance) => instance;
  // ignore: unused_element
  static Object? displayName(String instance) => instance;
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
    };

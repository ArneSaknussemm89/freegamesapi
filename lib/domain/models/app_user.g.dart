// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

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

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String uid,
    FieldValue uidFieldValue,
    String displayName,
    FieldValue displayNameFieldValue,
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
    String uid,
    FieldValue uidFieldValue,
    String displayName,
    FieldValue displayNameFieldValue,
    List<Object?> props,
    FieldValue propsFieldValue,
    bool? stringify,
    FieldValue stringifyFieldValue,
    int hashCode,
    FieldValue hashCodeFieldValue,
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
    return reference.snapshots().map((snapshot) {
      return AppUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AppUserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AppUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AppUserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then((snapshot) {
      return AppUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  Future<void> update({
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? props = _sentinel,
    FieldValue? propsFieldValue,
    Object? stringify = _sentinel,
    FieldValue? stringifyFieldValue,
    Object? hashCode = _sentinel,
    FieldValue? hashCodeFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
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
      if (uid != _sentinel) 'uid': uid as String,
      if (uidFieldValue != null) 'uid': uidFieldValue,
      if (displayName != _sentinel) 'displayName': displayName as String,
      if (displayNameFieldValue != null) 'displayName': displayNameFieldValue,
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
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? props = _sentinel,
    FieldValue? propsFieldValue,
    Object? stringify = _sentinel,
    FieldValue? stringifyFieldValue,
    Object? hashCode = _sentinel,
    FieldValue? hashCodeFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
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
      if (uid != _sentinel) 'uid': uid as String,
      if (uidFieldValue != null) 'uid': uidFieldValue,
      if (displayName != _sentinel) 'displayName': displayName as String,
      if (displayNameFieldValue != null) 'displayName': displayNameFieldValue,
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
    return other is AppUserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AppUserDocumentSnapshot extends FirestoreDocumentSnapshot<AppUser> {
  AppUserDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

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

abstract class AppUserQuery
    implements QueryReference<AppUser, AppUserQuerySnapshot> {
  @override
  AppUserQuery limit(int limit);

  @override
  AppUserQuery limitToLast(int limit);

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
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
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
  AppUserQuery whereFieldPath(
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

  AppUserQuery whereDocumentId({
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
  AppUserQuery whereUid({
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
  AppUserQuery whereDisplayName({
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
  AppUserQuery whereProps({
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
  AppUserQuery whereStringify({
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
  AppUserQuery whereHashCode({
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

  AppUserQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });

  AppUserQuery orderByStringify({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });

  AppUserQuery orderByHashCode({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
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

  AppUserQuerySnapshot _decodeSnapshot(
    QuerySnapshot<AppUser> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AppUserQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AppUserDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AppUserDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AppUserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AppUserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AppUserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
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

  AppUserQuery orderByFieldPath(
    FieldPath fieldPath, {
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

  AppUserQuery whereFieldPath(
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
    return _$AppUserQuery(
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

  AppUserQuery whereDocumentId({
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
    return _$AppUserQuery(
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

  AppUserQuery whereUid({
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
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppUserFieldMap['uid']!,
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

  AppUserQuery whereDisplayName({
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
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppUserFieldMap['displayName']!,
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

  AppUserQuery whereProps({
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
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppUserFieldMap['props']!,
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

  AppUserQuery whereStringify({
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
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppUserFieldMap['stringify']!,
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

  AppUserQuery whereHashCode({
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
    return _$AppUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AppUserFieldMap['hashCode']!,
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

  AppUserQuery orderByProps({
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
    final query = $referenceWithoutCursor.orderBy(_$AppUserFieldMap['props']!,
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

  AppUserQuery orderByStringify({
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
        .orderBy(_$AppUserFieldMap['stringify']!, descending: descending);
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

  AppUserQuery orderByHashCode({
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
        .orderBy(_$AppUserFieldMap['hashCode']!, descending: descending);
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

class AppUserQuerySnapshot
    extends FirestoreQuerySnapshot<AppUser, AppUserQueryDocumentSnapshot> {
  AppUserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<AppUser> snapshot;

  @override
  final List<AppUserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AppUserDocumentSnapshot>> docChanges;
}

class AppUserQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<AppUser>
    implements AppUserDocumentSnapshot {
  AppUserQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<AppUser> snapshot;

  @override
  AppUserDocumentReference get reference {
    return AppUserDocumentReference(snapshot.reference);
  }

  @override
  final AppUser data;
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

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
    };

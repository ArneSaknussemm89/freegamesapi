// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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
        FirestoreCollectionReference<AppUserQuerySnapshot> {
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
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<AppUser> get reference =>
      super.reference as CollectionReference<AppUser>;

  @override
  AppUserDocumentReference doc([String? id]) {
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
    extends FirestoreDocumentReference<AppUserDocumentSnapshot> {
  factory AppUserDocumentReference(DocumentReference<AppUser> reference) =
      _$AppUserDocumentReference;

  DocumentReference<AppUser> get reference;

  /// A reference to the [AppUserCollectionReference] containing this document.
  AppUserCollectionReference get parent {
    return _$AppUserCollectionReference(reference.firestore);
  }

  late final FavoriteGameCollectionReference favorites =
      _$FavoriteGameCollectionReference(
    reference,
  );

  @override
  Stream<AppUserDocumentSnapshot> snapshots();

  @override
  Future<AppUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String uid,
    String displayName,
    List<Object?> props,
  });

  Future<void> set(AppUser value);
}

class _$AppUserDocumentReference
    extends FirestoreDocumentReference<AppUserDocumentSnapshot>
    implements AppUserDocumentReference {
  _$AppUserDocumentReference(this.reference);

  @override
  final DocumentReference<AppUser> reference;

  /// A reference to the [AppUserCollectionReference] containing this document.
  AppUserCollectionReference get parent {
    return _$AppUserCollectionReference(reference.firestore);
  }

  late final FavoriteGameCollectionReference favorites =
      _$FavoriteGameCollectionReference(
    reference,
  );

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
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? uid = _sentinel,
    Object? displayName = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (uid != _sentinel) "uid": uid as String,
      if (displayName != _sentinel) "displayName": displayName as String,
      if (props != _sentinel) "props": props as List<Object?>,
    };

    return reference.update(json);
  }

  Future<void> set(AppUser value) {
    return reference.set(value);
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

class AppUserDocumentSnapshot extends FirestoreDocumentSnapshot {
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

abstract class AppUserQuery implements QueryReference<AppUserQuerySnapshot> {
  @override
  AppUserQuery limit(int limit);

  @override
  AppUserQuery limitToLast(int limit);

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
    List<Object?>? arrayContainsAny,
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
}

class _$AppUserQuery extends QueryReference<AppUserQuerySnapshot>
    implements AppUserQuery {
  _$AppUserQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<AppUser> reference;

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
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AppUserQuery limitToLast(int limit) {
    return _$AppUserQuery(
      reference.limitToLast(limit),
      _collection,
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
      reference.where(
        'uid',
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
      _collection,
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
      reference.where(
        'displayName',
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
      _collection,
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
    List<Object?>? arrayContainsAny,
  }) {
    return _$AppUserQuery(
      reference.where(
        'props',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
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
    var query = reference.orderBy('uid', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$AppUserQuery(query, _collection);
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
    var query = reference.orderBy('displayName', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$AppUserQuery(query, _collection);
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
    var query = reference.orderBy('props', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$AppUserQuery(query, _collection);
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
    extends FirestoreQuerySnapshot<AppUserQueryDocumentSnapshot> {
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

class AppUserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
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

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class FavoriteGameCollectionReference
    implements
        FavoriteGameQuery,
        FirestoreCollectionReference<FavoriteGameQuerySnapshot> {
  factory FavoriteGameCollectionReference(
    DocumentReference<AppUser> parent,
  ) = _$FavoriteGameCollectionReference;

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

  /// A reference to the containing [AppUserDocumentReference] if this is a subcollection.
  AppUserDocumentReference get parent;

  @override
  FavoriteGameDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FavoriteGameDocumentReference> add(FavoriteGame value);
}

class _$FavoriteGameCollectionReference extends _$FavoriteGameQuery
    implements FavoriteGameCollectionReference {
  factory _$FavoriteGameCollectionReference(
    DocumentReference<AppUser> parent,
  ) {
    return _$FavoriteGameCollectionReference._(
      AppUserDocumentReference(parent),
      parent.collection('favorites').withConverter(
            fromFirestore: FavoriteGameCollectionReference.fromFirestore,
            toFirestore: FavoriteGameCollectionReference.toFirestore,
          ),
    );
  }

  _$FavoriteGameCollectionReference._(
    this.parent,
    CollectionReference<FavoriteGame> reference,
  ) : super(reference, reference);

  @override
  final AppUserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<FavoriteGame> get reference =>
      super.reference as CollectionReference<FavoriteGame>;

  @override
  FavoriteGameDocumentReference doc([String? id]) {
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

abstract class FavoriteGameDocumentReference
    extends FirestoreDocumentReference<FavoriteGameDocumentSnapshot> {
  factory FavoriteGameDocumentReference(
          DocumentReference<FavoriteGame> reference) =
      _$FavoriteGameDocumentReference;

  DocumentReference<FavoriteGame> get reference;

  /// A reference to the [FavoriteGameCollectionReference] containing this document.
  FavoriteGameCollectionReference get parent {
    return _$FavoriteGameCollectionReference(
      reference.parent.parent!.withConverter<AppUser>(
        fromFirestore: AppUserCollectionReference.fromFirestore,
        toFirestore: AppUserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FavoriteGameDocumentSnapshot> snapshots();

  @override
  Future<FavoriteGameDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int gameId,
    List<Object?> props,
  });

  Future<void> set(FavoriteGame value);
}

class _$FavoriteGameDocumentReference
    extends FirestoreDocumentReference<FavoriteGameDocumentSnapshot>
    implements FavoriteGameDocumentReference {
  _$FavoriteGameDocumentReference(this.reference);

  @override
  final DocumentReference<FavoriteGame> reference;

  /// A reference to the [FavoriteGameCollectionReference] containing this document.
  FavoriteGameCollectionReference get parent {
    return _$FavoriteGameCollectionReference(
      reference.parent.parent!.withConverter<AppUser>(
        fromFirestore: AppUserCollectionReference.fromFirestore,
        toFirestore: AppUserCollectionReference.toFirestore,
      ),
    );
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
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? gameId = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (gameId != _sentinel) "gameId": gameId as int,
      if (props != _sentinel) "props": props as List<Object?>,
    };

    return reference.update(json);
  }

  Future<void> set(FavoriteGame value) {
    return reference.set(value);
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

class FavoriteGameDocumentSnapshot extends FirestoreDocumentSnapshot {
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
    implements QueryReference<FavoriteGameQuerySnapshot> {
  @override
  FavoriteGameQuery limit(int limit);

  @override
  FavoriteGameQuery limitToLast(int limit);

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
  FavoriteGameQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
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
}

class _$FavoriteGameQuery extends QueryReference<FavoriteGameQuerySnapshot>
    implements FavoriteGameQuery {
  _$FavoriteGameQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<FavoriteGame> reference;

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
      reference.limit(limit),
      _collection,
    );
  }

  @override
  FavoriteGameQuery limitToLast(int limit) {
    return _$FavoriteGameQuery(
      reference.limitToLast(limit),
      _collection,
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
      reference.where(
        'gameId',
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
      _collection,
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
    List<Object?>? arrayContainsAny,
  }) {
    return _$FavoriteGameQuery(
      reference.where(
        'props',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
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
    var query = reference.orderBy('gameId', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$FavoriteGameQuery(query, _collection);
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
    var query = reference.orderBy('props', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$FavoriteGameQuery(query, _collection);
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

class FavoriteGameQuerySnapshot
    extends FirestoreQuerySnapshot<FavoriteGameQueryDocumentSnapshot> {
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

class FavoriteGameQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
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

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
    };

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "rg" field.
  String? _rg;
  String get rg => _rg ?? '';
  bool hasRg() => _rg != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "superuser" field.
  String? _superuser;
  String get superuser => _superuser ?? '';
  bool hasSuperuser() => _superuser != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "type_user" field.
  String? _typeUser;
  String get typeUser => _typeUser ?? '';
  bool hasTypeUser() => _typeUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "adres" field.
  String? _adres;
  String get adres => _adres ?? '';
  bool hasAdres() => _adres != null;

  // "complement" field.
  String? _complement;
  String get complement => _complement ?? '';
  bool hasComplement() => _complement != null;

  // "ltd" field.
  LatLng? _ltd;
  LatLng? get ltd => _ltd;
  bool hasLtd() => _ltd != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _username = snapshotData['username'] as String?;
    _password = snapshotData['password'] as String?;
    _rg = snapshotData['rg'] as String?;
    _cpf = snapshotData['cpf'] as String?;
    _active = snapshotData['active'] as bool?;
    _bio = snapshotData['bio'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _gender = snapshotData['gender'] as String?;
    _superuser = snapshotData['superuser'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _typeUser = snapshotData['type_user'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _adres = snapshotData['adres'] as String?;
    _complement = snapshotData['complement'] as String?;
    _ltd = snapshotData['ltd'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? username,
  String? password,
  String? rg,
  String? cpf,
  bool? active,
  String? bio,
  String? city,
  String? state,
  String? firstName,
  String? lastName,
  String? gender,
  String? superuser,
  String? photoUrl,
  String? typeUser,
  DateTime? createdTime,
  String? phoneNumber,
  String? uid,
  String? displayName,
  String? adres,
  String? complement,
  LatLng? ltd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'username': username,
      'password': password,
      'rg': rg,
      'cpf': cpf,
      'active': active,
      'bio': bio,
      'city': city,
      'state': state,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'superuser': superuser,
      'photo_url': photoUrl,
      'type_user': typeUser,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'uid': uid,
      'display_name': displayName,
      'adres': adres,
      'complement': complement,
      'ltd': ltd,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.username == e2?.username &&
        e1?.password == e2?.password &&
        e1?.rg == e2?.rg &&
        e1?.cpf == e2?.cpf &&
        e1?.active == e2?.active &&
        e1?.bio == e2?.bio &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.gender == e2?.gender &&
        e1?.superuser == e2?.superuser &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.typeUser == e2?.typeUser &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName &&
        e1?.adres == e2?.adres &&
        e1?.complement == e2?.complement &&
        e1?.ltd == e2?.ltd;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.username,
        e?.password,
        e?.rg,
        e?.cpf,
        e?.active,
        e?.bio,
        e?.city,
        e?.state,
        e?.firstName,
        e?.lastName,
        e?.gender,
        e?.superuser,
        e?.photoUrl,
        e?.typeUser,
        e?.createdTime,
        e?.phoneNumber,
        e?.uid,
        e?.displayName,
        e?.adres,
        e?.complement,
        e?.ltd
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

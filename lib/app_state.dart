import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _tableHistoryLastId =
          await secureStorage.getInt('ff_tableHistoryLastId') ??
              _tableHistoryLastId;
    });
    await _safeInitAsync(() async {
      _tableHistory = (await secureStorage.getStringList('ff_tableHistory'))
              ?.map((x) {
                try {
                  return ItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _tableHistory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _tableHistoryLastId = 0;
  int get tableHistoryLastId => _tableHistoryLastId;
  set tableHistoryLastId(int value) {
    _tableHistoryLastId = value;
    secureStorage.setInt('ff_tableHistoryLastId', value);
  }

  void deleteTableHistoryLastId() {
    secureStorage.delete(key: 'ff_tableHistoryLastId');
  }

  List<ItemStruct> _tableHistory = [];
  List<ItemStruct> get tableHistory => _tableHistory;
  set tableHistory(List<ItemStruct> value) {
    _tableHistory = value;
    secureStorage.setStringList(
        'ff_tableHistory', value.map((x) => x.serialize()).toList());
  }

  void deleteTableHistory() {
    secureStorage.delete(key: 'ff_tableHistory');
  }

  void addToTableHistory(ItemStruct value) {
    _tableHistory.add(value);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void removeFromTableHistory(ItemStruct value) {
    _tableHistory.remove(value);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTableHistory(int index) {
    _tableHistory.removeAt(index);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void updateTableHistoryAtIndex(
    int index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    _tableHistory[index] = updateFn(_tableHistory[index]);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTableHistory(int index, ItemStruct value) {
    _tableHistory.insert(index, value);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  List<CardStruct> _cards = [];
  List<CardStruct> get cards => _cards;
  set cards(List<CardStruct> value) {
    _cards = value;
  }

  void addToCards(CardStruct value) {
    _cards.add(value);
  }

  void removeFromCards(CardStruct value) {
    _cards.remove(value);
  }

  void removeAtIndexFromCards(int index) {
    _cards.removeAt(index);
  }

  void updateCardsAtIndex(
    int index,
    CardStruct Function(CardStruct) updateFn,
  ) {
    _cards[index] = updateFn(_cards[index]);
  }

  void insertAtIndexInCards(int index, CardStruct value) {
    _cards.insert(index, value);
  }

  bool _isOptionExpanded = false;
  bool get isOptionExpanded => _isOptionExpanded;
  set isOptionExpanded(bool value) {
    _isOptionExpanded = value;
  }

  bool _loadRequests = false;
  bool get loadRequests => _loadRequests;
  set loadRequests(bool value) {
    _loadRequests = value;
  }

  bool _loadrequestTheraphist = false;
  bool get loadrequestTheraphist => _loadrequestTheraphist;
  set loadrequestTheraphist(bool value) {
    _loadrequestTheraphist = value;
  }

  String _gif = '';
  String get gif => _gif;
  set gif(String value) {
    _gif = value;
  }

  DocumentReference? _refTheraphist;
  DocumentReference? get refTheraphist => _refTheraphist;
  set refTheraphist(DocumentReference? value) {
    _refTheraphist = value;
  }

  bool _isOptionExpandedTheraphist = false;
  bool get isOptionExpandedTheraphist => _isOptionExpandedTheraphist;
  set isOptionExpandedTheraphist(bool value) {
    _isOptionExpandedTheraphist = value;
  }

  DocumentReference? _refCoworking;
  DocumentReference? get refCoworking => _refCoworking;
  set refCoworking(DocumentReference? value) {
    _refCoworking = value;
  }

  bool _coworkingUpdate = false;
  bool get coworkingUpdate => _coworkingUpdate;
  set coworkingUpdate(bool value) {
    _coworkingUpdate = value;
  }

  bool _createBank = false;
  bool get createBank => _createBank;
  set createBank(bool value) {
    _createBank = value;
  }

  bool _stateHistoryPatient = false;
  bool get stateHistoryPatient => _stateHistoryPatient;
  set stateHistoryPatient(bool value) {
    _stateHistoryPatient = value;
  }

  bool _stateHomePatient = false;
  bool get stateHomePatient => _stateHomePatient;
  set stateHomePatient(bool value) {
    _stateHomePatient = value;
  }

  bool _stateNotificationPatient = false;
  bool get stateNotificationPatient => _stateNotificationPatient;
  set stateNotificationPatient(bool value) {
    _stateNotificationPatient = value;
  }

  bool _stateHomeTheraphist = false;
  bool get stateHomeTheraphist => _stateHomeTheraphist;
  set stateHomeTheraphist(bool value) {
    _stateHomeTheraphist = value;
  }

  bool _stateNotificationTheraphit = false;
  bool get stateNotificationTheraphit => _stateNotificationTheraphit;
  set stateNotificationTheraphit(bool value) {
    _stateNotificationTheraphit = value;
  }

  bool _stateHistoryTheraphit = false;
  bool get stateHistoryTheraphit => _stateHistoryTheraphit;
  set stateHistoryTheraphit(bool value) {
    _stateHistoryTheraphit = value;
  }

  String _TermosLink = 'Termos e Condições';
  String get TermosLink => _TermosLink;
  set TermosLink(String value) {
    _TermosLink = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}

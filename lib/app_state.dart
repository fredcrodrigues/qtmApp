import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
    secureStorage = FlutterSecureStorage();
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
  set tableHistoryLastId(int _value) {
    _tableHistoryLastId = _value;
    secureStorage.setInt('ff_tableHistoryLastId', _value);
  }

  void deleteTableHistoryLastId() {
    secureStorage.delete(key: 'ff_tableHistoryLastId');
  }

  List<ItemStruct> _tableHistory = [];
  List<ItemStruct> get tableHistory => _tableHistory;
  set tableHistory(List<ItemStruct> _value) {
    _tableHistory = _value;
    secureStorage.setStringList(
        'ff_tableHistory', _value.map((x) => x.serialize()).toList());
  }

  void deleteTableHistory() {
    secureStorage.delete(key: 'ff_tableHistory');
  }

  void addToTableHistory(ItemStruct _value) {
    _tableHistory.add(_value);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void removeFromTableHistory(ItemStruct _value) {
    _tableHistory.remove(_value);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTableHistory(int _index) {
    _tableHistory.removeAt(_index);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void updateTableHistoryAtIndex(
    int _index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    _tableHistory[_index] = updateFn(_tableHistory[_index]);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTableHistory(int _index, ItemStruct _value) {
    _tableHistory.insert(_index, _value);
    secureStorage.setStringList(
        'ff_tableHistory', _tableHistory.map((x) => x.serialize()).toList());
  }

  List<CardStruct> _cards = [];
  List<CardStruct> get cards => _cards;
  set cards(List<CardStruct> _value) {
    _cards = _value;
  }

  void addToCards(CardStruct _value) {
    _cards.add(_value);
  }

  void removeFromCards(CardStruct _value) {
    _cards.remove(_value);
  }

  void removeAtIndexFromCards(int _index) {
    _cards.removeAt(_index);
  }

  void updateCardsAtIndex(
    int _index,
    CardStruct Function(CardStruct) updateFn,
  ) {
    _cards[_index] = updateFn(_cards[_index]);
  }

  void insertAtIndexInCards(int _index, CardStruct _value) {
    _cards.insert(_index, _value);
  }

  bool _isOptionExpanded = false;
  bool get isOptionExpanded => _isOptionExpanded;
  set isOptionExpanded(bool _value) {
    _isOptionExpanded = _value;
  }

  bool _loadRequests = false;
  bool get loadRequests => _loadRequests;
  set loadRequests(bool _value) {
    _loadRequests = _value;
  }

  bool _loadrequestTheraphist = false;
  bool get loadrequestTheraphist => _loadrequestTheraphist;
  set loadrequestTheraphist(bool _value) {
    _loadrequestTheraphist = _value;
  }

  String _gif = '';
  String get gif => _gif;
  set gif(String _value) {
    _gif = _value;
  }

  DocumentReference? _refTheraphist;
  DocumentReference? get refTheraphist => _refTheraphist;
  set refTheraphist(DocumentReference? _value) {
    _refTheraphist = _value;
  }

  bool _isOptionExpandedTheraphist = false;
  bool get isOptionExpandedTheraphist => _isOptionExpandedTheraphist;
  set isOptionExpandedTheraphist(bool _value) {
    _isOptionExpandedTheraphist = _value;
  }

  DocumentReference? _refCoworking;
  DocumentReference? get refCoworking => _refCoworking;
  set refCoworking(DocumentReference? _value) {
    _refCoworking = _value;
  }

  bool _coworkingUpdate = false;
  bool get coworkingUpdate => _coworkingUpdate;
  set coworkingUpdate(bool _value) {
    _coworkingUpdate = _value;
  }

  bool _createBank = false;
  bool get createBank => _createBank;
  set createBank(bool _value) {
    _createBank = _value;
  }

  bool _stateHistoryPatient = false;
  bool get stateHistoryPatient => _stateHistoryPatient;
  set stateHistoryPatient(bool _value) {
    _stateHistoryPatient = _value;
  }

  bool _stateHomePatient = false;
  bool get stateHomePatient => _stateHomePatient;
  set stateHomePatient(bool _value) {
    _stateHomePatient = _value;
  }

  bool _stateNotificationPatient = false;
  bool get stateNotificationPatient => _stateNotificationPatient;
  set stateNotificationPatient(bool _value) {
    _stateNotificationPatient = _value;
  }

  bool _stateHomeTheraphist = false;
  bool get stateHomeTheraphist => _stateHomeTheraphist;
  set stateHomeTheraphist(bool _value) {
    _stateHomeTheraphist = _value;
  }

  bool _stateNotificationTheraphit = false;
  bool get stateNotificationTheraphit => _stateNotificationTheraphit;
  set stateNotificationTheraphit(bool _value) {
    _stateNotificationTheraphit = _value;
  }

  bool _stateHistoryTheraphit = false;
  bool get stateHistoryTheraphit => _stateHistoryTheraphit;
  set stateHistoryTheraphit(bool _value) {
    _stateHistoryTheraphit = _value;
  }

  String _TermosLink = 'Termos e Condições';
  String get TermosLink => _TermosLink;
  set TermosLink(String _value) {
    _TermosLink = _value;
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}

import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _questionOne = await secureStorage.getInt('ff_questionOne') ?? _questionOne;
    _questionTwo = await secureStorage.getInt('ff_questionTwo') ?? _questionTwo;
    _questionThree =
        await secureStorage.getInt('ff_questionThree') ?? _questionThree;
    _questionFour =
        await secureStorage.getInt('ff_questionFour') ?? _questionFour;
    _questionFive =
        await secureStorage.getInt('ff_questionFive') ?? _questionFive;
    _totalScore = await secureStorage.getInt('ff_totalScore') ?? _totalScore;
    _actionDate = await secureStorage.read(key: 'ff_actionDate') != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (await secureStorage.getInt('ff_actionDate'))!)
        : _actionDate;
    _actionDateJournal =
        await secureStorage.read(key: 'ff_actionDateJournal') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (await secureStorage.getInt('ff_actionDateJournal'))!)
            : _actionDateJournal;
    _isAdmin = (await secureStorage.getString('ff_isAdmin'))?.ref ?? _isAdmin;
    _journalEntry =
        await secureStorage.getString('ff_journalEntry') ?? _journalEntry;
    _journalTitle =
        await secureStorage.getString('ff_journalTitle') ?? _journalTitle;
    _entryNumber = await secureStorage.getInt('ff_entryNumber') ?? _entryNumber;
    _positiveResult =
        await secureStorage.getString('ff_positiveResult') ?? _positiveResult;
    _neutralResult =
        await secureStorage.getString('ff_neutralResult') ?? _neutralResult;
    _negativeResult =
        await secureStorage.getString('ff_negativeResult') ?? _negativeResult;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _questionOne = 0;
  int get questionOne => _questionOne;
  set questionOne(int _value) {
    _questionOne = _value;
    secureStorage.setInt('ff_questionOne', _value);
  }

  void deleteQuestionOne() {
    secureStorage.delete(key: 'ff_questionOne');
  }

  int _questionTwo = 0;
  int get questionTwo => _questionTwo;
  set questionTwo(int _value) {
    _questionTwo = _value;
    secureStorage.setInt('ff_questionTwo', _value);
  }

  void deleteQuestionTwo() {
    secureStorage.delete(key: 'ff_questionTwo');
  }

  int _questionThree = 0;
  int get questionThree => _questionThree;
  set questionThree(int _value) {
    _questionThree = _value;
    secureStorage.setInt('ff_questionThree', _value);
  }

  void deleteQuestionThree() {
    secureStorage.delete(key: 'ff_questionThree');
  }

  int _questionFour = 0;
  int get questionFour => _questionFour;
  set questionFour(int _value) {
    _questionFour = _value;
    secureStorage.setInt('ff_questionFour', _value);
  }

  void deleteQuestionFour() {
    secureStorage.delete(key: 'ff_questionFour');
  }

  int _questionFive = 0;
  int get questionFive => _questionFive;
  set questionFive(int _value) {
    _questionFive = _value;
    secureStorage.setInt('ff_questionFive', _value);
  }

  void deleteQuestionFive() {
    secureStorage.delete(key: 'ff_questionFive');
  }

  int _totalScore = 0;
  int get totalScore => _totalScore;
  set totalScore(int _value) {
    _totalScore = _value;
    secureStorage.setInt('ff_totalScore', _value);
  }

  void deleteTotalScore() {
    secureStorage.delete(key: 'ff_totalScore');
  }

  DateTime? _actionDate;
  DateTime? get actionDate => _actionDate;
  set actionDate(DateTime? _value) {
    _actionDate = _value;
    _value != null
        ? secureStorage.setInt('ff_actionDate', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_actionDate');
  }

  void deleteActionDate() {
    secureStorage.delete(key: 'ff_actionDate');
  }

  DateTime? _actionDateJournal;
  DateTime? get actionDateJournal => _actionDateJournal;
  set actionDateJournal(DateTime? _value) {
    _actionDateJournal = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_actionDateJournal', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_actionDateJournal');
  }

  void deleteActionDateJournal() {
    secureStorage.delete(key: 'ff_actionDateJournal');
  }

  DocumentReference? _isAdmin;
  DocumentReference? get isAdmin => _isAdmin;
  set isAdmin(DocumentReference? _value) {
    _isAdmin = _value;
    _value != null
        ? secureStorage.setString('ff_isAdmin', _value.path)
        : secureStorage.remove('ff_isAdmin');
  }

  void deleteIsAdmin() {
    secureStorage.delete(key: 'ff_isAdmin');
  }

  String _journalEntry = '';
  String get journalEntry => _journalEntry;
  set journalEntry(String _value) {
    _journalEntry = _value;
    secureStorage.setString('ff_journalEntry', _value);
  }

  void deleteJournalEntry() {
    secureStorage.delete(key: 'ff_journalEntry');
  }

  String _journalTitle = '';
  String get journalTitle => _journalTitle;
  set journalTitle(String _value) {
    _journalTitle = _value;
    secureStorage.setString('ff_journalTitle', _value);
  }

  void deleteJournalTitle() {
    secureStorage.delete(key: 'ff_journalTitle');
  }

  int _entryNumber = 1;
  int get entryNumber => _entryNumber;
  set entryNumber(int _value) {
    _entryNumber = _value;
    secureStorage.setInt('ff_entryNumber', _value);
  }

  void deleteEntryNumber() {
    secureStorage.delete(key: 'ff_entryNumber');
  }

  String _positiveResult =
      'Focus on the good: Train yourself to focus on the positive aspects of your life. Instead of dwelling on the negatives, take some time each day to think about the things that make you happy and grateful.';
  String get positiveResult => _positiveResult;
  set positiveResult(String _value) {
    _positiveResult = _value;
    secureStorage.setString('ff_positiveResult', _value);
  }

  void deletePositiveResult() {
    secureStorage.delete(key: 'ff_positiveResult');
  }

  String _neutralResult =
      'Remember that a neutral sentiment is still a good result! It means that you have a balanced and objective outlook on the situation. Use this as an opportunity to reflect on your thoughts and feelings, and focus on maintaining a positive and optimistic mindset. Keep up the good work!';
  String get neutralResult => _neutralResult;
  set neutralResult(String _value) {
    _neutralResult = _value;
    secureStorage.setString('ff_neutralResult', _value);
  }

  void deleteNeutralResult() {
    secureStorage.delete(key: 'ff_neutralResult');
  }

  String _negativeResult =
      'I\'m sorry to hear that you had a negative experience. Remember that setbacks and challenges are a natural part of life, and they provide us with opportunities to grow and learn. Don\'t give up and keep pushing forward. You are capable of overcoming this and achieving your goals. Remember to take care of yourself, engage in self-care activities, and surround yourself with positive and supportive people.\n\nDon\'t hesitate to ask for help!';
  String get negativeResult => _negativeResult;
  set negativeResult(String _value) {
    _negativeResult = _value;
    secureStorage.setString('ff_negativeResult', _value);
  }

  void deleteNegativeResult() {
    secureStorage.delete(key: 'ff_negativeResult');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

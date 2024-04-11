import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _itemsinchart =
          await secureStorage.getInt('ff_itemsinchart') ?? _itemsinchart;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_statusintern') != null) {
        try {
          _statusintern = jsonDecode(
              await secureStorage.getString('ff_statusintern') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _skey = await secureStorage.getString('ff_skey') ?? _skey;
    });
    await _safeInitAsync(() async {
      _cookiesaved =
          await secureStorage.getBool('ff_cookiesaved') ?? _cookiesaved;
    });
    await _safeInitAsync(() async {
      _checkboxthirdparty =
          await secureStorage.getBool('ff_checkboxthirdparty') ??
              _checkboxthirdparty;
    });
    await _safeInitAsync(() async {
      _checkboxtrackingcookie =
          await secureStorage.getBool('ff_checkboxtrackingcookie') ??
              _checkboxtrackingcookie;
    });
    await _safeInitAsync(() async {
      _showresult = await secureStorage.getBool('ff_showresult') ?? _showresult;
    });
    await _safeInitAsync(() async {
      _paymentbutton =
          await secureStorage.getBool('ff_paymentbutton') ?? _paymentbutton;
    });
    await _safeInitAsync(() async {
      _answer = await secureStorage.getString('ff_answer') ?? _answer;
    });
    await _safeInitAsync(() async {
      _androidurl =
          await secureStorage.getString('ff_androidurl') ?? _androidurl;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _itemsinchart = 0;
  int get itemsinchart => _itemsinchart;
  set itemsinchart(int value) {
    _itemsinchart = value;
    secureStorage.setInt('ff_itemsinchart', value);
  }

  void deleteItemsinchart() {
    secureStorage.delete(key: 'ff_itemsinchart');
  }

  dynamic _statusintern = jsonDecode('{\"status\":\"complete\"}');
  dynamic get statusintern => _statusintern;
  set statusintern(dynamic value) {
    _statusintern = value;
    secureStorage.setString('ff_statusintern', jsonEncode(value));
  }

  void deleteStatusintern() {
    secureStorage.delete(key: 'ff_statusintern');
  }

  String _localuserid = '';
  String get localuserid => _localuserid;
  set localuserid(String value) {
    _localuserid = value;
  }

  String _localticketsnumber = '';
  String get localticketsnumber => _localticketsnumber;
  set localticketsnumber(String value) {
    _localticketsnumber = value;
  }

  String _localusername = '';
  String get localusername => _localusername;
  set localusername(String value) {
    _localusername = value;
  }

  int _localcompetionid = 0;
  int get localcompetionid => _localcompetionid;
  set localcompetionid(int value) {
    _localcompetionid = value;
  }

  String _skey =
      'pk_live_51OxrfsBhKuJTirSPDmHLkIWMJpLSHnK1mUyajg2boGO00wyZK5CyBEGTPRNLgHE9bZXgaXGlTs1q4KI3wX0roVPI00zYRbBRUh';
  String get skey => _skey;
  set skey(String value) {
    _skey = value;
    secureStorage.setString('ff_skey', value);
  }

  void deleteSkey() {
    secureStorage.delete(key: 'ff_skey');
  }

  bool _clickonce = false;
  bool get clickonce => _clickonce;
  set clickonce(bool value) {
    _clickonce = value;
  }

  bool _widgetanimation = false;
  bool get widgetanimation => _widgetanimation;
  set widgetanimation(bool value) {
    _widgetanimation = value;
  }

  bool _cookiesaved = false;
  bool get cookiesaved => _cookiesaved;
  set cookiesaved(bool value) {
    _cookiesaved = value;
    secureStorage.setBool('ff_cookiesaved', value);
  }

  void deleteCookiesaved() {
    secureStorage.delete(key: 'ff_cookiesaved');
  }

  bool _checkboxthirdparty = false;
  bool get checkboxthirdparty => _checkboxthirdparty;
  set checkboxthirdparty(bool value) {
    _checkboxthirdparty = value;
    secureStorage.setBool('ff_checkboxthirdparty', value);
  }

  void deleteCheckboxthirdparty() {
    secureStorage.delete(key: 'ff_checkboxthirdparty');
  }

  bool _checkboxtrackingcookie = false;
  bool get checkboxtrackingcookie => _checkboxtrackingcookie;
  set checkboxtrackingcookie(bool value) {
    _checkboxtrackingcookie = value;
    secureStorage.setBool('ff_checkboxtrackingcookie', value);
  }

  void deleteCheckboxtrackingcookie() {
    secureStorage.delete(key: 'ff_checkboxtrackingcookie');
  }

  bool _showresult = false;
  bool get showresult => _showresult;
  set showresult(bool value) {
    _showresult = value;
    secureStorage.setBool('ff_showresult', value);
  }

  void deleteShowresult() {
    secureStorage.delete(key: 'ff_showresult');
  }

  bool _paymentbutton = false;
  bool get paymentbutton => _paymentbutton;
  set paymentbutton(bool value) {
    _paymentbutton = value;
    secureStorage.setBool('ff_paymentbutton', value);
  }

  void deletePaymentbutton() {
    secureStorage.delete(key: 'ff_paymentbutton');
  }

  bool _showvideo = false;
  bool get showvideo => _showvideo;
  set showvideo(bool value) {
    _showvideo = value;
  }

  String _answer = '';
  String get answer => _answer;
  set answer(String value) {
    _answer = value;
    secureStorage.setString('ff_answer', value);
  }

  void deleteAnswer() {
    secureStorage.delete(key: 'ff_answer');
  }

  String _androidurl = '';
  String get androidurl => _androidurl;
  set androidurl(String value) {
    _androidurl = value;
    secureStorage.setString('ff_androidurl', value);
  }

  void deleteAndroidurl() {
    secureStorage.delete(key: 'ff_androidurl');
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

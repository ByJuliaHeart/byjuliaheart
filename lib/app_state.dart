import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _name = prefs.getString('ff_name') ?? _name;
    });
    _safeInit(() {
      _avatar = prefs.getString('ff_avatar') ?? _avatar;
    });
    _safeInit(() {
      _userRef = prefs.getString('ff_userRef') ?? _userRef;
    });
    _safeInit(() {
      _openMenu = prefs.getBool('ff_openMenu') ?? _openMenu;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    prefs.setString('ff_name', value);
  }

  String _avatar = '';
  String get avatar => _avatar;
  set avatar(String value) {
    _avatar = value;
    prefs.setString('ff_avatar', value);
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _cardRundo = '';
  String get cardRundo => _cardRundo;
  set cardRundo(String value) {
    _cardRundo = value;
  }

  String _cardConfirm = '';
  String get cardConfirm => _cardConfirm;
  set cardConfirm(String value) {
    _cardConfirm = value;
  }

  List<String> _cardsArray = [];
  List<String> get cardsArray => _cardsArray;
  set cardsArray(List<String> value) {
    _cardsArray = value;
  }

  void addToCardsArray(String value) {
    _cardsArray.add(value);
  }

  void removeFromCardsArray(String value) {
    _cardsArray.remove(value);
  }

  void removeAtIndexFromCardsArray(int index) {
    _cardsArray.removeAt(index);
  }

  void updateCardsArrayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _cardsArray[index] = updateFn(_cardsArray[index]);
  }

  void insertAtIndexInCardsArray(int index, String value) {
    _cardsArray.insert(index, value);
  }

  int _cubeNumber = 0;
  int get cubeNumber => _cubeNumber;
  set cubeNumber(int value) {
    _cubeNumber = value;
  }

  List<String> _roleUsers = [];
  List<String> get roleUsers => _roleUsers;
  set roleUsers(List<String> value) {
    _roleUsers = value;
  }

  void addToRoleUsers(String value) {
    _roleUsers.add(value);
  }

  void removeFromRoleUsers(String value) {
    _roleUsers.remove(value);
  }

  void removeAtIndexFromRoleUsers(int index) {
    _roleUsers.removeAt(index);
  }

  void updateRoleUsersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _roleUsers[index] = updateFn(_roleUsers[index]);
  }

  void insertAtIndexInRoleUsers(int index, String value) {
    _roleUsers.insert(index, value);
  }

  String _city = '';
  String get city => _city;
  set city(String value) {
    _city = value;
  }

  bool _gameDrop = false;
  bool get gameDrop => _gameDrop;
  set gameDrop(bool value) {
    _gameDrop = value;
  }

  bool _nameProfile = false;
  bool get nameProfile => _nameProfile;
  set nameProfile(bool value) {
    _nameProfile = value;
  }

  bool _lastNameProfile = false;
  bool get lastNameProfile => _lastNameProfile;
  set lastNameProfile(bool value) {
    _lastNameProfile = value;
  }

  bool _cityProfile = false;
  bool get cityProfile => _cityProfile;
  set cityProfile(bool value) {
    _cityProfile = value;
  }

  bool _phoneProfile = false;
  bool get phoneProfile => _phoneProfile;
  set phoneProfile(bool value) {
    _phoneProfile = value;
  }

  bool _agreementSwitch = true;
  bool get agreementSwitch => _agreementSwitch;
  set agreementSwitch(bool value) {
    _agreementSwitch = value;
  }

  String _userRef = '';
  String get userRef => _userRef;
  set userRef(String value) {
    _userRef = value;
    prefs.setString('ff_userRef', value);
  }

  bool _openMenu = true;
  bool get openMenu => _openMenu;
  set openMenu(bool value) {
    _openMenu = value;
    prefs.setBool('ff_openMenu', value);
  }

  final _userdataManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> userdata({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _userdataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserdataCache() => _userdataManager.clear();
  void clearUserdataCacheKey(String? uniqueKey) =>
      _userdataManager.clearRequest(uniqueKey);

  final _dateGameManager = FutureRequestManager<List<GameFieldRow>>();
  Future<List<GameFieldRow>> dateGame({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GameFieldRow>> Function() requestFn,
  }) =>
      _dateGameManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDateGameCache() => _dateGameManager.clear();
  void clearDateGameCacheKey(String? uniqueKey) =>
      _dateGameManager.clearRequest(uniqueKey);

  final _myregManager = FutureRequestManager<List<RegistrGameRow>>();
  Future<List<RegistrGameRow>> myreg({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<RegistrGameRow>> Function() requestFn,
  }) =>
      _myregManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyregCache() => _myregManager.clear();
  void clearMyregCacheKey(String? uniqueKey) =>
      _myregManager.clearRequest(uniqueKey);

  final _gameFieldManager = FutureRequestManager<List<GameFieldRow>>();
  Future<List<GameFieldRow>> gameField({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GameFieldRow>> Function() requestFn,
  }) =>
      _gameFieldManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGameFieldCache() => _gameFieldManager.clear();
  void clearGameFieldCacheKey(String? uniqueKey) =>
      _gameFieldManager.clearRequest(uniqueKey);
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

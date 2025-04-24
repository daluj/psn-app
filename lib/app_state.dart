import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userProject')) {
        try {
          final serializedData = prefs.getString('ff_userProject') ?? '{}';
          _userProject =
              ProjectStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userGroup')) {
        try {
          final serializedData = prefs.getString('ff_userGroup') ?? '{}';
          _userGroup =
              GroupStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ProjectStruct _userProject = ProjectStruct.fromSerializableMap(
      jsonDecode('{\"id\":\"-1\",\"name\":\"\"}'));
  ProjectStruct get userProject => _userProject;
  set userProject(ProjectStruct value) {
    _userProject = value;
    prefs.setString('ff_userProject', value.serialize());
  }

  void updateUserProjectStruct(Function(ProjectStruct) updateFn) {
    updateFn(_userProject);
    prefs.setString('ff_userProject', _userProject.serialize());
  }

  GroupStruct _userGroup = GroupStruct.fromSerializableMap(
      jsonDecode('{\"id\":\"-1\",\"name\":\"\"}'));
  GroupStruct get userGroup => _userGroup;
  set userGroup(GroupStruct value) {
    _userGroup = value;
    prefs.setString('ff_userGroup', value.serialize());
  }

  void updateUserGroupStruct(Function(GroupStruct) updateFn) {
    updateFn(_userGroup);
    prefs.setString('ff_userGroup', _userGroup.serialize());
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

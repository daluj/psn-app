// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? accessToken,
    String? firstName,
    List<int>? projects,
    String? username,
    String? role,
  })  : _accessToken = accessToken,
        _firstName = firstName,
        _projects = projects,
        _username = username,
        _role = role;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "projects" field.
  List<int>? _projects;
  List<int> get projects => _projects ?? const [];
  set projects(List<int>? val) => _projects = val;

  void updateProjects(Function(List<int>) updateFn) {
    updateFn(_projects ??= []);
  }

  bool hasProjects() => _projects != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        accessToken: data['access_token'] as String?,
        firstName: data['first_name'] as String?,
        projects: getDataList(data['projects']),
        username: data['username'] as String?,
        role: data['role'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'access_token': _accessToken,
        'first_name': _firstName,
        'projects': _projects,
        'username': _username,
        'role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'projects': serializeParam(
          _projects,
          ParamType.int,
          isList: true,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        projects: deserializeParam<int>(
          data['projects'],
          ParamType.int,
          true,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        accessToken == other.accessToken &&
        firstName == other.firstName &&
        listEquality.equals(projects, other.projects) &&
        username == other.username &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([accessToken, firstName, projects, username, role]);
}

UserStruct createUserStruct({
  String? accessToken,
  String? firstName,
  String? username,
  String? role,
}) =>
    UserStruct(
      accessToken: accessToken,
      firstName: firstName,
      username: username,
      role: role,
    );

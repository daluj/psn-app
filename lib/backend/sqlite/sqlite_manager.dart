import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'psn_d_b',
      'psn.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetBeneficiariesRow>> getBeneficiaries({
    String? name,
    int? projectId,
  }) =>
      performGetBeneficiaries(
        _database,
        name: name,
        projectId: projectId,
      );

  Future<List<GetStaffRow>> getStaff({
    String? name,
    String? projectId,
  }) =>
      performGetStaff(
        _database,
        name: name,
        projectId: projectId,
      );

  Future<List<GetGroupsRow>> getGroups({
    int? projectId,
  }) =>
      performGetGroups(
        _database,
        projectId: projectId,
      );

  Future<List<GetAttendanceRow>> getAttendance({
    String? attendanceDate,
    String? personType,
    String? personName,
    int? projectId,
  }) =>
      performGetAttendance(
        _database,
        attendanceDate: attendanceDate,
        personType: personType,
        personName: personName,
        projectId: projectId,
      );

  Future<List<GetProjectsRow>> getProjects() => performGetProjects(
        _database,
      );

  Future<List<GetGroupsPageRow>> getGroupsPage({
    int? projectId,
  }) =>
      performGetGroupsPage(
        _database,
        projectId: projectId,
      );

  Future<List<GetGroupMembersRow>> getGroupMembers({
    String? personType,
    String? personName,
    int? groupId,
  }) =>
      performGetGroupMembers(
        _database,
        personType: personType,
        personName: personName,
        groupId: groupId,
      );

  Future<List<GetProjectAttendanceRow>> getProjectAttendance({
    String? attendanceDate,
    String? personType,
    int? projectId,
  }) =>
      performGetProjectAttendance(
        _database,
        attendanceDate: attendanceDate,
        personType: personType,
        projectId: projectId,
      );

  Future<List<GetProjectsPageRow>> getProjectsPage() => performGetProjectsPage(
        _database,
      );

  Future<List<GetBeneficiaryRow>> getBeneficiary({
    int? beneficiaryId,
  }) =>
      performGetBeneficiary(
        _database,
        beneficiaryId: beneficiaryId,
      );

  Future<List<GetPersonAttendanceRow>> getPersonAttendance({
    int? personId,
    int? projectId,
    String? personType,
  }) =>
      performGetPersonAttendance(
        _database,
        personId: personId,
        projectId: projectId,
        personType: personType,
      );

  Future<List<GetGroupRow>> getGroup({
    int? projectId,
    int? groupId,
  }) =>
      performGetGroup(
        _database,
        projectId: projectId,
        groupId: groupId,
      );

  Future<List<GetProjectRow>> getProject({
    int? projectId,
  }) =>
      performGetProject(
        _database,
        projectId: projectId,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future newStaff({
    String? name,
    String? role,
    int? projectId,
    String? surname,
    String? nameKh,
    String? surnameKh,
    int? phoneNumber,
    String? salary,
    String? accountNumber,
  }) =>
      performNewStaff(
        _database,
        name: name,
        role: role,
        projectId: projectId,
        surname: surname,
        nameKh: nameKh,
        surnameKh: surnameKh,
        phoneNumber: phoneNumber,
        salary: salary,
        accountNumber: accountNumber,
      );

  Future updateAttendance({
    int? projectId,
  }) =>
      performUpdateAttendance(
        _database,
        projectId: projectId,
      );

  Future newBeneficiary({
    String? name,
    int? projectId,
    String? imgPath,
    String? surname,
  }) =>
      performNewBeneficiary(
        _database,
        name: name,
        projectId: projectId,
        imgPath: imgPath,
        surname: surname,
      );

  Future updateBeneficiary({
    int? groupId,
    int? beneficiaryId,
    String? name,
    String? surname,
    String? nameKh,
    String? surnameKh,
    int? pseNumber,
    String? dob,
    String? poo,
    String? type,
  }) =>
      performUpdateBeneficiary(
        _database,
        groupId: groupId,
        beneficiaryId: beneficiaryId,
        name: name,
        surname: surname,
        nameKh: nameKh,
        surnameKh: surnameKh,
        pseNumber: pseNumber,
        dob: dob,
        poo: poo,
        type: type,
      );

  Future newGroup({
    int? projectId,
    String? name,
  }) =>
      performNewGroup(
        _database,
        projectId: projectId,
        name: name,
      );

  Future newProject({
    String? projectCode,
    String? name,
    int? startDate,
    int? endDate,
  }) =>
      performNewProject(
        _database,
        projectCode: projectCode,
        name: name,
        startDate: startDate,
        endDate: endDate,
      );

  Future setAttendance({
    int? present,
    int? attendanceId,
  }) =>
      performSetAttendance(
        _database,
        present: present,
        attendanceId: attendanceId,
      );

  Future updateMemberAttendance({
    int? personId,
    String? attendanceDate,
    int? present,
    String? personType,
    int? projectId,
  }) =>
      performUpdateMemberAttendance(
        _database,
        personId: personId,
        attendanceDate: attendanceDate,
        present: present,
        personType: personType,
        projectId: projectId,
      );

  Future setMemberAttendance({
    int? personId,
    String? attendanceDate,
    int? present,
    String? personType,
    int? projectId,
  }) =>
      performSetMemberAttendance(
        _database,
        personId: personId,
        attendanceDate: attendanceDate,
        present: present,
        personType: personType,
        projectId: projectId,
      );

  Future deleteBeneficiary({
    int? beneficiaryId,
  }) =>
      performDeleteBeneficiary(
        _database,
        beneficiaryId: beneficiaryId,
      );

  Future deleteStaff({
    int? staffId,
  }) =>
      performDeleteStaff(
        _database,
        staffId: staffId,
      );

  /// END UPDATE QUERY CALLS
}

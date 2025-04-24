import 'package:sqflite/sqflite.dart';

/// BEGIN NEWSTAFF
Future performNewStaff(
  Database database, {
  String? name,
  String? role,
  int? projectId,
  String? surname,
  String? nameKh,
  String? surnameKh,
  int? phoneNumber,
  String? salary,
  String? accountNumber,
}) {
  final query = '''
INSERT INTO Staff (name, surname, role, project_id, name_kh, surname_kh,phone_number,salary,account_number)
VALUES ('${name}','${surname}', '${role}',${projectId}, '${nameKh}', '${surnameKh}',${phoneNumber},'${salary}','${accountNumber}');
''';
  return database.rawQuery(query);
}

/// END NEWSTAFF

/// BEGIN UPDATEATTENDANCE
Future performUpdateAttendance(
  Database database, {
  int? projectId,
}) {
  final query = '''
INSERT OR IGNORE INTO Attendance (person_id, person_type, project_id, date, present, created_at, synced)
SELECT staff_id, 'staff', ${projectId}
, strftime('%Y-%m-%d', 'now'), 0, strftime('%s', 'now'), 0 
FROM Staff 
WHERE project_id = ${projectId}

UNION ALL

SELECT beneficiary_id, 'beneficiary', ${projectId}
, strftime('%Y-%m-%d', 'now'), 0, strftime('%s', 'now'), 0 
FROM Beneficiaries 
WHERE project_id = ${projectId};
''';
  return database.rawQuery(query);
}

/// END UPDATEATTENDANCE

/// BEGIN NEWBENEFICIARY
Future performNewBeneficiary(
  Database database, {
  String? name,
  int? projectId,
  String? imgPath,
  String? surname,
}) {
  final query = '''
INSERT INTO Beneficiaries (name,surname,project_id,img_path)
VALUES ('${name}','${surname}',${projectId},'${imgPath}');
''';
  return database.rawQuery(query);
}

/// END NEWBENEFICIARY

/// BEGIN UPDATEBENEFICIARY
Future performUpdateBeneficiary(
  Database database, {
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
}) {
  final query = '''
UPDATE Beneficiaries
SET group_id = ${groupId},
name = '${name}',
surname = '${surname}',
name_kh = '${nameKh}',
surname_kh = '${surnameKh}',
pse_number =   ${pseNumber},
type = '${type}',
date_of_birth = '${dob}',
place_of_origin = '${poo}'
WHERE beneficiary_id = ${beneficiaryId}
''';
  return database.rawQuery(query);
}

/// END UPDATEBENEFICIARY

/// BEGIN NEWGROUP
Future performNewGroup(
  Database database, {
  int? projectId,
  String? name,
}) {
  final query = '''
INSERT INTO Groups (project_id, name)
VALUES (${projectId}, '${name}');
''';
  return database.rawQuery(query);
}

/// END NEWGROUP

/// BEGIN NEWPROJECT
Future performNewProject(
  Database database, {
  String? projectCode,
  String? name,
  int? startDate,
  int? endDate,
}) {
  final query = '''
INSERT INTO Projects (project_code, name, start_date, end_date)
VALUES ('${projectCode}', '${name}',${startDate},${endDate});
''';
  return database.rawQuery(query);
}

/// END NEWPROJECT

/// BEGIN SETATTENDANCE
Future performSetAttendance(
  Database database, {
  int? present,
  int? attendanceId,
}) {
  final query = '''
UPDATE Attendance
SET present = ${present}, updated_at = strftime('%s', 'now')
WHERE attendance_id = ${attendanceId};
''';
  return database.rawQuery(query);
}

/// END SETATTENDANCE

/// BEGIN UPDATEMEMBERATTENDANCE
Future performUpdateMemberAttendance(
  Database database, {
  int? personId,
  String? attendanceDate,
  int? present,
  String? personType,
  int? projectId,
}) {
  final query = '''
UPDATE Attendance
SET present = ${present}, updated_at = strftime('%s', 'now')
WHERE person_id = ${personId} 
AND person_type = '${personType}' 
AND date = '${attendanceDate}'
AND project_id = ${projectId};

INSERT OR IGNORE INTO Attendance (person_id, person_type, project_id, date, present, created_at, synced, updated_at)
VALUES (${personId}, '${personType}', ${projectId}, '${attendanceDate}', ${present}, strftime('%s', 'now'), 0, strftime('%s', 'now'));
''';
  return database.rawQuery(query);
}

/// END UPDATEMEMBERATTENDANCE

/// BEGIN SETMEMBERATTENDANCE
Future performSetMemberAttendance(
  Database database, {
  int? personId,
  String? attendanceDate,
  int? present,
  String? personType,
  int? projectId,
}) {
  final query = '''
INSERT OR IGNORE INTO Attendance (person_id, person_type, project_id, date, present, created_at, synced, updated_at)
VALUES (${personId}, '${personType}', ${projectId}, '${attendanceDate}', ${present}, strftime('%s', 'now'), 0, strftime('%s', 'now'));
''';
  return database.rawQuery(query);
}

/// END SETMEMBERATTENDANCE

/// BEGIN DELETEBENEFICIARY
Future performDeleteBeneficiary(
  Database database, {
  int? beneficiaryId,
}) {
  final query = '''
DELETE FROM Beneficiaries WHERE beneficiary_id = ${beneficiaryId};
''';
  return database.rawQuery(query);
}

/// END DELETEBENEFICIARY

/// BEGIN DELETESTAFF
Future performDeleteStaff(
  Database database, {
  int? staffId,
}) {
  final query = '''
DELETE FROM Staff WHERE staff_id = ${staffId};
''';
  return database.rawQuery(query);
}

/// END DELETESTAFF

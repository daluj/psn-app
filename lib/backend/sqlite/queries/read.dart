import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETBENEFICIARIES
Future<List<GetBeneficiariesRow>> performGetBeneficiaries(
  Database database, {
  String? name,
  int? projectId,
}) {
  final query = '''
SELECT b.beneficiary_id, b.name AS beneficiary_name,
       COALESCE(g.name, 'N/A') AS group_name, 
       COALESCE(p.name, 'N/A') AS project_name
,
       b.img_path
FROM Beneficiaries b
LEFT JOIN Projects p ON b.project_id = p.project_id
LEFT JOIN Groups g ON b.group_id = g.group_id AND g.project_id = p.project_id
WHERE ('${name}' = '' OR b.name LIKE '%' || '${name}' || '%')
AND p.project_id = ${projectId};
''';
  return _readQuery(database, query, (d) => GetBeneficiariesRow(d));
}

class GetBeneficiariesRow extends SqliteRow {
  GetBeneficiariesRow(Map<String, dynamic> data) : super(data);

  String get beneficiaryName => data['beneficiary_name'] as String;
  String get groupName => data['group_name'] as String;
  String get projectName => data['project_name'] as String;
  int get beneficiaryId => data['beneficiary_id'] as int;
  String get imgPath => data['img_path'] as String;
}

/// END GETBENEFICIARIES

/// BEGIN GETSTAFF
Future<List<GetStaffRow>> performGetStaff(
  Database database, {
  String? name,
  String? projectId,
}) {
  final query = '''
SELECT COALESCE(p.name, 'N/A') AS project_name, 
       s.staff_id, s.name AS staff_name, s.role
, 
       COALESCE(s.surname, '') AS surname,
       COALESCE(s.name_kh, '') AS name_kh,
       COALESCE(s.surname_kh, '') AS surname_kh,
       COALESCE(s.phone_number, 0) AS phone_number,
       COALESCE(s.rating, 0.0) AS rating,
       COALESCE(s.comments, '') AS comments,
       COALESCE(s.img_path, '') AS img_path
FROM Staff s
LEFT JOIN Projects p ON s.project_id = p.project_id
WHERE ('${name}' = '' OR s.name LIKE '%' || '${name}' || '%')
AND (${projectId} = '' OR p.project_id
= ${projectId});
''';
  return _readQuery(database, query, (d) => GetStaffRow(d));
}

class GetStaffRow extends SqliteRow {
  GetStaffRow(Map<String, dynamic> data) : super(data);

  String get staffName => data['staff_name'] as String;
  String get role => data['role'] as String;
  String get projectName => data['project_name'] as String;
  String get nameKh => data['name_kh'] as String;
  String get surnameKh => data['surname_kh'] as String;
  int get phoneNumber => data['phone_number'] as int;
  String get imgPath => data['img_path'] as String;
  double get rating => data['rating'] as double;
  String get comments => data['comments'] as String;
  int get staffId => data['staff_id'] as int;
  String get surname => data['surname'] as String;
}

/// END GETSTAFF

/// BEGIN GETGROUPS
Future<List<GetGroupsRow>> performGetGroups(
  Database database, {
  int? projectId,
}) {
  final query = '''
SELECT g.group_id, g.name AS group_name, p.project_id, p.name AS project_name
FROM Groups g
JOIN Projects p ON g.project_id = p.project_id
WHERE p.project_id = ${projectId};
''';
  return _readQuery(database, query, (d) => GetGroupsRow(d));
}

class GetGroupsRow extends SqliteRow {
  GetGroupsRow(Map<String, dynamic> data) : super(data);

  String get groupName => data['group_name'] as String;
  String get projectName => data['project_name'] as String;
  int get groupId => data['group_id'] as int;
  int get projectId => data['project_id'] as int;
}

/// END GETGROUPS

/// BEGIN GETATTENDANCE
Future<List<GetAttendanceRow>> performGetAttendance(
  Database database, {
  String? attendanceDate,
  String? personType,
  String? personName,
  int? projectId,
}) {
  final query = '''
SELECT 
    a.attendance_id, 
    a.person_id, 
    CASE 
        WHEN a.person_type = 'staff' THEN s.name 
        ELSE b.name 
    END AS person_name, 
    COALESCE(
        CASE 
            WHEN a.person_type = 'staff' THEN s.img_path 
            ELSE b.img_path 
        END, 
        ''
    ) AS img, 
    a.person_type, 
    a.date, 
    a.present, 
    p.project_id, 
    p.name AS project_name
FROM Attendance a
LEFT JOIN Staff s ON a.person_id = s.staff_id
LEFT JOIN Beneficiaries b ON a.person_id = b.beneficiary_id
LEFT JOIN Projects p ON (
    (a.person_type = 'beneficiary' AND b.project_id = p.project_id) OR 
    (a.person_type = 'staff' AND s.project_id = p.project_id)
)
WHERE a.date = '${attendanceDate}'
  AND ('${personType}' = 'all' OR a.person_type = '${personType}')
  AND ('${personName}' = '' OR 
       (a.person_type = 'staff' AND s.name LIKE '%' || '${personName}' || '%') OR 
       (a.person_type = 'beneficiary' AND b.name LIKE '%' || '${personName}' || '%'))
  AND p.project_id IS NOT NULL
  AND (${projectId} IS NULL OR p.project_id = ${projectId});
''';
  return _readQuery(database, query, (d) => GetAttendanceRow(d));
}

class GetAttendanceRow extends SqliteRow {
  GetAttendanceRow(Map<String, dynamic> data) : super(data);

  String get personName => data['person_name'] as String;
  String get personType => data['person_type'] as String;
  String get date => data['date'] as String;
  int get present => data['present'] as int;
  String get img => data['img'] as String;
  String get projectName => data['project_name'] as String;
  int get projectId => data['project_id'] as int;
}

/// END GETATTENDANCE

/// BEGIN GETPROJECTS
Future<List<GetProjectsRow>> performGetProjects(
  Database database,
) {
  final query = '''
SELECT project_id, name FROM Projects;
''';
  return _readQuery(database, query, (d) => GetProjectsRow(d));
}

class GetProjectsRow extends SqliteRow {
  GetProjectsRow(Map<String, dynamic> data) : super(data);

  int get projectId => data['project_id'] as int;
  String get name => data['name'] as String;
}

/// END GETPROJECTS

/// BEGIN GETGROUPSPAGE
Future<List<GetGroupsPageRow>> performGetGroupsPage(
  Database database, {
  int? projectId,
}) {
  final query = '''
SELECT g.group_id, g.name AS group_name, COUNT(b.beneficiary_id) AS num_beneficiaries
FROM Groups g
LEFT JOIN Beneficiaries b ON g.group_id = b.group_id
WHERE g.project_id = ${projectId}
GROUP BY g.group_id;
''';
  return _readQuery(database, query, (d) => GetGroupsPageRow(d));
}

class GetGroupsPageRow extends SqliteRow {
  GetGroupsPageRow(Map<String, dynamic> data) : super(data);

  String get groupName => data['group_name'] as String;
  int get numBeneficiaries => data['num_beneficiaries'] as int;
  int get groupId => data['group_id'] as int;
}

/// END GETGROUPSPAGE

/// BEGIN GETGROUPMEMBERS
Future<List<GetGroupMembersRow>> performGetGroupMembers(
  Database database, {
  String? personType,
  String? personName,
  int? groupId,
}) {
  final query = '''
SELECT b.beneficiary_id AS member_id, b.name AS member_name, 'beneficiary' AS member_type, g.group_id, g.name AS group_name
FROM Beneficiaries b
JOIN Groups g ON b.group_id = g.group_id
WHERE g.group_id = ${groupId}
AND ('${personType}' = 'all' OR 'beneficiary' = '${personType}')
AND ('${personName}' = '' OR b.name LIKE '%' || '${personName}' || '%')

UNION ALL

SELECT s.staff_id AS member_id, s.name AS member_name, 'staff' AS member_type, g.group_id, g.name AS group_name
FROM Staff s
JOIN Projects p ON s.project_id = p.project_id
JOIN Groups g ON p.project_id = g.project_id
WHERE g.group_id = ${groupId}
AND ('${personType}' = 'all' OR 'staff' = '${personType}')
AND ('${personName}' = '' OR s.name LIKE '%' || '${personName}' || '%');
''';
  return _readQuery(database, query, (d) => GetGroupMembersRow(d));
}

class GetGroupMembersRow extends SqliteRow {
  GetGroupMembersRow(Map<String, dynamic> data) : super(data);

  String get memberName => data['member_name'] as String;
  String get memberType => data['member_type'] as String;
}

/// END GETGROUPMEMBERS

/// BEGIN GETPROJECTATTENDANCE
Future<List<GetProjectAttendanceRow>> performGetProjectAttendance(
  Database database, {
  String? attendanceDate,
  String? personType,
  int? projectId,
}) {
  final query = '''
SELECT 
    a.attendance_id, 
    a.person_id, 
    CASE 
        WHEN a.person_type = 'staff' THEN s.name 
        ELSE b.name 
    END AS person_name, 
    COALESCE(
        CASE 
            WHEN a.person_type = 'staff' THEN s.img_path 
            ELSE b.img_path 
        END, 
        ''
    ) AS img, 
    a.person_type, 
    a.date, 
    a.present, 
    p.project_id, 
    p.name AS project_name
FROM Attendance a
LEFT JOIN Staff s ON a.person_id = s.staff_id
LEFT JOIN Beneficiaries b ON a.person_id = b.beneficiary_id
LEFT JOIN Groups g ON b.group_id = g.group_id
LEFT JOIN Projects p ON (
    (b.project_id = p.project_id) OR 
    (g.project_id = p.project_id) OR 
    (a.person_type = 'staff' AND s.project_id = p.project_id)
)
WHERE a.date = '${attendanceDate}'
  AND a.person_type = '${personType}'
  AND a.updated_at IS NULL
  AND p.project_id IS NOT NULL
  AND (${projectId} IS NULL OR p.project_id = ${projectId});
''';
  return _readQuery(database, query, (d) => GetProjectAttendanceRow(d));
}

class GetProjectAttendanceRow extends SqliteRow {
  GetProjectAttendanceRow(Map<String, dynamic> data) : super(data);

  String get personName => data['person_name'] as String;
  String get personType => data['person_type'] as String;
  String get date => data['date'] as String;
  int get attendanceId => data['attendance_id'] as int;
  String get img => data['img'] as String;
}

/// END GETPROJECTATTENDANCE

/// BEGIN GETPROJECTSPAGE
Future<List<GetProjectsPageRow>> performGetProjectsPage(
  Database database,
) {
  final query = '''
SELECT project_id, name FROM Projects;
''';
  return _readQuery(database, query, (d) => GetProjectsPageRow(d));
}

class GetProjectsPageRow extends SqliteRow {
  GetProjectsPageRow(Map<String, dynamic> data) : super(data);

  int get projectId => data['project_id'] as int;
  String get name => data['name'] as String;
}

/// END GETPROJECTSPAGE

/// BEGIN GETBENEFICIARY
Future<List<GetBeneficiaryRow>> performGetBeneficiary(
  Database database, {
  int? beneficiaryId,
}) {
  final query = '''
SELECT name, group_id,
  COALESCE(surname, '') AS surname, 
  COALESCE(name_kh, '') AS name_kh, 
  COALESCE(surname_kh, '') AS surname_kh, 
  COALESCE(pse_number, 0) AS pse_number, 
  COALESCE(type, '') AS type, 
  COALESCE(date_of_birth, 0) AS date_of_birth, 
  COALESCE(place_of_origin, '') AS place_of_origin
FROM Beneficiaries
WHERE beneficiary_id = ${beneficiaryId}
''';
  return _readQuery(database, query, (d) => GetBeneficiaryRow(d));
}

class GetBeneficiaryRow extends SqliteRow {
  GetBeneficiaryRow(Map<String, dynamic> data) : super(data);

  String get name => data['name'] as String;
  String get surname => data['surname'] as String;
  String get nameKh => data['name_kh'] as String;
  String get surnameKh => data['surname_kh'] as String;
  int get pseNumber => data['pse_number'] as int;
  String get type => data['type'] as String;
  int get dateOfBirth => data['date_of_birth'] as int;
  String get placeOfOrigin => data['place_of_origin'] as String;
  int? get groupId => data['group_id'] as int?;
}

/// END GETBENEFICIARY

/// BEGIN GETPERSONATTENDANCE
Future<List<GetPersonAttendanceRow>> performGetPersonAttendance(
  Database database, {
  int? personId,
  int? projectId,
  String? personType,
}) {
  final query = '''
SELECT
  a.attendance_id,
  a.person_id,
  a.person_type,
  a.project_id,
  p.name AS project_name,
  CASE
    WHEN a.person_type = 'staff' THEN s.name || ' ' || s.surname
    WHEN a.person_type = 'beneficiary' THEN b.name || ' ' || b.surname
    ELSE NULL
  END AS person_name,
  a.date
FROM Attendance a
JOIN Projects p ON a.project_id = p.project_id
LEFT JOIN Staff s ON a.person_type = 'staff' AND a.person_id = s.staff_id
LEFT JOIN Beneficiaries b ON a.person_type = 'beneficiary' AND a.person_id = b.beneficiary_id
WHERE a.present = 1
  AND a.project_id = ${projectId}
  AND a.person_id = ${personId}
  AND a.person_type = '${personType}';

''';
  return _readQuery(database, query, (d) => GetPersonAttendanceRow(d));
}

class GetPersonAttendanceRow extends SqliteRow {
  GetPersonAttendanceRow(Map<String, dynamic> data) : super(data);

  String get personType => data['person_type'] as String;
  String get projectName => data['project_name'] as String;
  String get personName => data['person_name'] as String;
  String get date => data['date'] as String;
}

/// END GETPERSONATTENDANCE

/// BEGIN GETGROUP
Future<List<GetGroupRow>> performGetGroup(
  Database database, {
  int? projectId,
  int? groupId,
}) {
  final query = '''
SELECT g.group_id, g.name AS group_name, p.project_id, p.name AS project_name
FROM Groups g
JOIN Projects p ON g.project_id = p.project_id
WHERE p.project_id = ${projectId}
AND g.group_id = ${groupId};
''';
  return _readQuery(database, query, (d) => GetGroupRow(d));
}

class GetGroupRow extends SqliteRow {
  GetGroupRow(Map<String, dynamic> data) : super(data);

  String get groupName => data['group_name'] as String;
  String get projectName => data['project_name'] as String;
  int get groupId => data['group_id'] as int;
  int get projectId => data['project_id'] as int;
}

/// END GETGROUP

/// BEGIN GETPROJECT
Future<List<GetProjectRow>> performGetProject(
  Database database, {
  int? projectId,
}) {
  final query = '''
SELECT project_id, name FROM Projects
WHERE project_id = ${projectId};
''';
  return _readQuery(database, query, (d) => GetProjectRow(d));
}

class GetProjectRow extends SqliteRow {
  GetProjectRow(Map<String, dynamic> data) : super(data);

  int get projectId => data['project_id'] as int;
  String get name => data['name'] as String;
}

/// END GETPROJECT

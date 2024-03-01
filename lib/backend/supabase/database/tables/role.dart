import '../database.dart';

class RoleTable extends SupabaseTable<RoleRow> {
  @override
  String get tableName => 'role';

  @override
  RoleRow createRow(Map<String, dynamic> data) => RoleRow(data);
}

class RoleRow extends SupabaseDataRow {
  RoleRow(super.data);

  @override
  SupabaseTable get table => RoleTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}

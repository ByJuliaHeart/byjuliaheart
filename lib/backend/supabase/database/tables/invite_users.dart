import '../database.dart';

class InviteUsersTable extends SupabaseTable<InviteUsersRow> {
  @override
  String get tableName => 'invite_users';

  @override
  InviteUsersRow createRow(Map<String, dynamic> data) => InviteUsersRow(data);
}

class InviteUsersRow extends SupabaseDataRow {
  InviteUsersRow(super.data);

  @override
  SupabaseTable get table => InviteUsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get referral => getField<String>('referral');
  set referral(String? value) => setField<String>('referral', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}

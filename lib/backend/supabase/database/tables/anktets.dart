import '../database.dart';

class AnktetsTable extends SupabaseTable<AnktetsRow> {
  @override
  String get tableName => 'anktets';

  @override
  AnktetsRow createRow(Map<String, dynamic> data) => AnktetsRow(data);
}

class AnktetsRow extends SupabaseDataRow {
  AnktetsRow(super.data);

  @override
  SupabaseTable get table => AnktetsTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get gameFeildId => getField<String>('gameFeild_id');
  set gameFeildId(String? value) => setField<String>('gameFeild_id', value);

  String? get quaery => getField<String>('quaery');
  set quaery(String? value) => setField<String>('quaery', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}

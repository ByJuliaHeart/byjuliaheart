import '../database.dart';

class CubeTable extends SupabaseTable<CubeRow> {
  @override
  String get tableName => 'cube';

  @override
  CubeRow createRow(Map<String, dynamic> data) => CubeRow(data);
}

class CubeRow extends SupabaseDataRow {
  CubeRow(super.data);

  @override
  SupabaseTable get table => CubeTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  int? get number => getField<int>('number');
  set number(int? value) => setField<int>('number', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}

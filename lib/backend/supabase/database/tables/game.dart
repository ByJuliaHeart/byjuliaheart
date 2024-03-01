import '../database.dart';

class GameTable extends SupabaseTable<GameRow> {
  @override
  String get tableName => 'game';

  @override
  GameRow createRow(Map<String, dynamic> data) => GameRow(data);
}

class GameRow extends SupabaseDataRow {
  GameRow(super.data);

  @override
  SupabaseTable get table => GameTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nameGame => getField<String>('nameGame');
  set nameGame(String? value) => setField<String>('nameGame', value);

  String? get discription => getField<String>('discription');
  set discription(String? value) => setField<String>('discription', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);
}

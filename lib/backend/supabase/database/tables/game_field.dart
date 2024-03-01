import '../database.dart';

class GameFieldTable extends SupabaseTable<GameFieldRow> {
  @override
  String get tableName => 'game_field';

  @override
  GameFieldRow createRow(Map<String, dynamic> data) => GameFieldRow(data);
}

class GameFieldRow extends SupabaseDataRow {
  GameFieldRow(super.data);

  @override
  SupabaseTable get table => GameFieldTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nameGame => getField<String>('nameGame');
  set nameGame(String? value) => setField<String>('nameGame', value);

  String? get idMemberResurse => getField<String>('idMemberResurse');
  set idMemberResurse(String? value) =>
      setField<String>('idMemberResurse', value);

  String? get discription => getField<String>('discription');
  set discription(String? value) => setField<String>('discription', value);

  DateTime? get dateGame => getField<DateTime>('dateGame');
  set dateGame(DateTime? value) => setField<DateTime>('dateGame', value);

  int? get unix => getField<int>('unix');
  set unix(int? value) => setField<int>('unix', value);

  String? get hhTime => getField<String>('hhTime');
  set hhTime(String? value) => setField<String>('hhTime', value);

  String? get mmTime => getField<String>('mmTime');
  set mmTime(String? value) => setField<String>('mmTime', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);

  String? get gameId => getField<String>('game_id');
  set gameId(String? value) => setField<String>('game_id', value);

  String? get idUserArray => getField<String>('id_user_array');
  set idUserArray(String? value) => setField<String>('id_user_array', value);

  List<String> get idMemberGame => getListField<String>('id_member_game');
  set idMemberGame(List<String>? value) =>
      setListField<String>('id_member_game', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);
}

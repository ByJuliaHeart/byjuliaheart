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

  bool? get buttomcardsaction => getField<bool>('buttomcardsaction');
  set buttomcardsaction(bool? value) =>
      setField<bool>('buttomcardsaction', value);

  dynamic get myCards => getField<dynamic>('my_cards');
  set myCards(dynamic value) => setField<dynamic>('my_cards', value);

  int? get unix => getField<int>('unix');
  set unix(int? value) => setField<int>('unix', value);

  int? get cubeNum => getField<int>('cube_num');
  set cubeNum(int? value) => setField<int>('cube_num', value);

  String? get revelations => getField<String>('revelations');
  set revelations(String? value) => setField<String>('revelations', value);

  String? get discoveries => getField<String>('discoveries');
  set discoveries(String? value) => setField<String>('discoveries', value);

  String? get actions => getField<String>('actions');
  set actions(String? value) => setField<String>('actions', value);

  String? get resources => getField<String>('resources');
  set resources(String? value) => setField<String>('resources', value);

  String? get contributions => getField<String>('contributions');
  set contributions(String? value) => setField<String>('contributions', value);

  String? get feedback => getField<String>('feedback');
  set feedback(String? value) => setField<String>('feedback', value);

  String? get obtained => getField<String>('obtained');
  set obtained(String? value) => setField<String>('obtained', value);

  String? get measures => getField<String>('measures');
  set measures(String? value) => setField<String>('measures', value);

  String? get response => getField<String>('response');
  set response(String? value) => setField<String>('response', value);

  String? get namegame => getField<String>('namegame');
  set namegame(String? value) => setField<String>('namegame', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String? get nameUser => getField<String>('name_user');
  set nameUser(String? value) => setField<String>('name_user', value);
}

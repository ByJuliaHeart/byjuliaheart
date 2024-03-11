import '../database.dart';

class RegistrGameTable extends SupabaseTable<RegistrGameRow> {
  @override
  String get tableName => 'registr_game';

  @override
  RegistrGameRow createRow(Map<String, dynamic> data) => RegistrGameRow(data);
}

class RegistrGameRow extends SupabaseDataRow {
  RegistrGameRow(super.data);

  @override
  SupabaseTable get table => RegistrGameTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nameGame => getField<String>('nameGame');
  set nameGame(String? value) => setField<String>('nameGame', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);

  String? get dateGame => getField<String>('dateGame');
  set dateGame(String? value) => setField<String>('dateGame', value);

  int? get unix => getField<int>('unix');
  set unix(int? value) => setField<int>('unix', value);

  String? get gameid => getField<String>('gameid');
  set gameid(String? value) => setField<String>('gameid', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get discription => getField<String>('discription');
  set discription(String? value) => setField<String>('discription', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);

  String? get gamefieldid => getField<String>('gamefieldid');
  set gamefieldid(String? value) => setField<String>('gamefieldid', value);
}

import '../database.dart';

class CardsLiveGameTable extends SupabaseTable<CardsLiveGameRow> {
  @override
  String get tableName => 'cards_live_game';

  @override
  CardsLiveGameRow createRow(Map<String, dynamic> data) =>
      CardsLiveGameRow(data);
}

class CardsLiveGameRow extends SupabaseDataRow {
  CardsLiveGameRow(super.data);

  @override
  SupabaseTable get table => CardsLiveGameTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get frontCard => getField<String>('front_card');
  set frontCard(String? value) => setField<String>('front_card', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get idBoxCards => getField<String>('id_box_cards');
  set idBoxCards(String? value) => setField<String>('id_box_cards', value);

  String? get backCards => getField<String>('back_cards');
  set backCards(String? value) => setField<String>('back_cards', value);

  String? get quaeryCards => getField<String>('quaery_cards');
  set quaeryCards(String? value) => setField<String>('quaery_cards', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  String? get idGameField => getField<String>('id_game_field');
  set idGameField(String? value) => setField<String>('id_game_field', value);

  int? get unix => getField<int>('unix');
  set unix(int? value) => setField<int>('unix', value);
}

import '../database.dart';

class CardsTable extends SupabaseTable<CardsRow> {
  @override
  String get tableName => 'cards';

  @override
  CardsRow createRow(Map<String, dynamic> data) => CardsRow(data);
}

class CardsRow extends SupabaseDataRow {
  CardsRow(super.data);

  @override
  SupabaseTable get table => CardsTable();

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
}

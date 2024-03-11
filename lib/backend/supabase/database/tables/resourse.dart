import '../database.dart';

class ResourseTable extends SupabaseTable<ResourseRow> {
  @override
  String get tableName => 'resourse';

  @override
  ResourseRow createRow(Map<String, dynamic> data) => ResourseRow(data);
}

class ResourseRow extends SupabaseDataRow {
  ResourseRow(super.data);

  @override
  SupabaseTable get table => ResourseTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get gameFieldId => getField<String>('game_field_id');
  set gameFieldId(String? value) => setField<String>('game_field_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get usergameid => getField<String>('usergameid');
  set usergameid(String? value) => setField<String>('usergameid', value);

  int? get unix => getField<int>('unix');
  set unix(int? value) => setField<int>('unix', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get myComments => getField<String>('my_comments');
  set myComments(String? value) => setField<String>('my_comments', value);

  String? get playerQueries => getField<String>('player_queries');
  set playerQueries(String? value) => setField<String>('player_queries', value);

  String? get myContribution => getField<String>('my_contribution');
  set myContribution(String? value) =>
      setField<String>('my_contribution', value);

  String? get playerContribution => getField<String>('player_contribution');
  set playerContribution(String? value) =>
      setField<String>('player_contribution', value);

  String? get highlightsForPlayer => getField<String>('highlights_for_player');
  set highlightsForPlayer(String? value) =>
      setField<String>('highlights_for_player', value);

  String? get feedbackTime => getField<String>('feedback_time');
  set feedbackTime(String? value) => setField<String>('feedback_time', value);

  int? get ratingbar => getField<int>('ratingbar');
  set ratingbar(int? value) => setField<int>('ratingbar', value);

  List<int> get ratings => getListField<int>('ratings');
  set ratings(List<int>? value) => setListField<int>('ratings', value);
}

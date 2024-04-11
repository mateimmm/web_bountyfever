import '../database.dart';

class SearchTable extends SupabaseTable<SearchRow> {
  @override
  String get tableName => 'search';

  @override
  SearchRow createRow(Map<String, dynamic> data) => SearchRow(data);
}

class SearchRow extends SupabaseDataRow {
  SearchRow(super.data);

  @override
  SupabaseTable get table => SearchTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get searchvalue => getField<String>('searchvalue');
  set searchvalue(String? value) => setField<String>('searchvalue', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitionid => getField<int>('competitionid');
  set competitionid(int? value) => setField<int>('competitionid', value);
}

import '../database.dart';

class GeneralTable extends SupabaseTable<GeneralRow> {
  @override
  String get tableName => 'general';

  @override
  GeneralRow createRow(Map<String, dynamic> data) => GeneralRow(data);
}

class GeneralRow extends SupabaseDataRow {
  GeneralRow(super.data);

  @override
  SupabaseTable get table => GeneralTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get homepicture => getField<String>('homepicture');
  set homepicture(String? value) => setField<String>('homepicture', value);

  String? get androidurl => getField<String>('androidurl');
  set androidurl(String? value) => setField<String>('androidurl', value);
}

import '../database.dart';

class ReciptsTable extends SupabaseTable<ReciptsRow> {
  @override
  String get tableName => 'recipts';

  @override
  ReciptsRow createRow(Map<String, dynamic> data) => ReciptsRow(data);
}

class ReciptsRow extends SupabaseDataRow {
  ReciptsRow(super.data);

  @override
  SupabaseTable get table => ReciptsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get recipturl => getField<String>('recipturl');
  set recipturl(String? value) => setField<String>('recipturl', value);

  String? get paymentid => getField<String>('paymentid');
  set paymentid(String? value) => setField<String>('paymentid', value);
}

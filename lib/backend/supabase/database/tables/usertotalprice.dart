import '../database.dart';

class UsertotalpriceTable extends SupabaseTable<UsertotalpriceRow> {
  @override
  String get tableName => 'usertotalprice';

  @override
  UsertotalpriceRow createRow(Map<String, dynamic> data) =>
      UsertotalpriceRow(data);
}

class UsertotalpriceRow extends SupabaseDataRow {
  UsertotalpriceRow(super.data);

  @override
  SupabaseTable get table => UsertotalpriceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get sumprice => getField<double>('sumprice');
  set sumprice(double? value) => setField<double>('sumprice', value);
}

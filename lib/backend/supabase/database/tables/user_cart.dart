import '../database.dart';

class UserCartTable extends SupabaseTable<UserCartRow> {
  @override
  String get tableName => 'user_cart';

  @override
  UserCartRow createRow(Map<String, dynamic> data) => UserCartRow(data);
}

class UserCartRow extends SupabaseDataRow {
  UserCartRow(super.data);

  @override
  SupabaseTable get table => UserCartTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  double get ticketsNumber => getField<double>('tickets_number')!;
  set ticketsNumber(double value) => setField<double>('tickets_number', value);

  double get totalprice => getField<double>('totalprice')!;
  set totalprice(double value) => setField<double>('totalprice', value);

  String? get answer => getField<String>('answer');
  set answer(String? value) => setField<String>('answer', value);
}

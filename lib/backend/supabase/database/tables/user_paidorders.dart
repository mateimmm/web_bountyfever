import '../database.dart';

class UserPaidordersTable extends SupabaseTable<UserPaidordersRow> {
  @override
  String get tableName => 'user_paidorders';

  @override
  UserPaidordersRow createRow(Map<String, dynamic> data) =>
      UserPaidordersRow(data);
}

class UserPaidordersRow extends SupabaseDataRow {
  UserPaidordersRow(super.data);

  @override
  SupabaseTable get table => UserPaidordersTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get competionName => getField<String>('competion_name');
  set competionName(String? value) => setField<String>('competion_name', value);

  bool? get competitionEnded => getField<bool>('competition_ended');
  set competitionEnded(bool? value) =>
      setField<bool>('competition_ended', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  String? get paidname => getField<String>('paidname');
  set paidname(String? value) => setField<String>('paidname', value);

  bool? get paidcomplete => getField<bool>('paidcomplete');
  set paidcomplete(bool? value) => setField<bool>('paidcomplete', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  double? get ticketsnumber => getField<double>('ticketsnumber');
  set ticketsnumber(double? value) => setField<double>('ticketsnumber', value);

  double? get competitionPrice => getField<double>('competition_price');
  set competitionPrice(double? value) =>
      setField<double>('competition_price', value);

  double? get totalspend => getField<double>('totalspend');
  set totalspend(double? value) => setField<double>('totalspend', value);
}

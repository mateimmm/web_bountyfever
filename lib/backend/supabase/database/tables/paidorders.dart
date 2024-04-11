import '../database.dart';

class PaidordersTable extends SupabaseTable<PaidordersRow> {
  @override
  String get tableName => 'paidorders';

  @override
  PaidordersRow createRow(Map<String, dynamic> data) => PaidordersRow(data);
}

class PaidordersRow extends SupabaseDataRow {
  PaidordersRow(super.data);

  @override
  SupabaseTable get table => PaidordersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get paidCompetitionid => getField<int>('paid_competitionid')!;
  set paidCompetitionid(int value) =>
      setField<int>('paid_competitionid', value);

  String? get paidUserid => getField<String>('paid_userid');
  set paidUserid(String? value) => setField<String>('paid_userid', value);

  bool? get paidcomplete => getField<bool>('paidcomplete');
  set paidcomplete(bool? value) => setField<bool>('paidcomplete', value);

  bool? get paidcancelled => getField<bool>('paidcancelled');
  set paidcancelled(bool? value) => setField<bool>('paidcancelled', value);

  double? get ticketsnumber => getField<double>('ticketsnumber');
  set ticketsnumber(double? value) => setField<double>('ticketsnumber', value);

  String? get paidname => getField<String>('paidname');
  set paidname(String? value) => setField<String>('paidname', value);

  String? get paymentid => getField<String>('paymentid');
  set paymentid(String? value) => setField<String>('paymentid', value);

  String? get paymentemail => getField<String>('paymentemail');
  set paymentemail(String? value) => setField<String>('paymentemail', value);

  String? get paymentadress => getField<String>('paymentadress');
  set paymentadress(String? value) => setField<String>('paymentadress', value);

  String? get paymentcountry => getField<String>('paymentcountry');
  set paymentcountry(String? value) =>
      setField<String>('paymentcountry', value);

  String? get answer => getField<String>('answer');
  set answer(String? value) => setField<String>('answer', value);
}

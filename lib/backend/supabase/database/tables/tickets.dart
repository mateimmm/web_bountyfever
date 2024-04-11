import '../database.dart';

class TicketsTable extends SupabaseTable<TicketsRow> {
  @override
  String get tableName => 'tickets';

  @override
  TicketsRow createRow(Map<String, dynamic> data) => TicketsRow(data);
}

class TicketsRow extends SupabaseDataRow {
  TicketsRow(super.data);

  @override
  SupabaseTable get table => TicketsTable();

  int get ticketId => getField<int>('ticket_id')!;
  set ticketId(int value) => setField<int>('ticket_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  int? get ticketsNumber => getField<int>('tickets_number');
  set ticketsNumber(int? value) => setField<int>('tickets_number', value);

  dynamic get ticketsRandom => getField<dynamic>('tickets_random');
  set ticketsRandom(dynamic value) =>
      setField<dynamic>('tickets_random', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  int? get orderid => getField<int>('orderid');
  set orderid(int? value) => setField<int>('orderid', value);

  double? get ticketsRandomNumeric =>
      getField<double>('tickets_random_numeric');
  set ticketsRandomNumeric(double? value) =>
      setField<double>('tickets_random_numeric', value);
}

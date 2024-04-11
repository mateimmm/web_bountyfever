import '../database.dart';

class TicketDuplicatesViewTable extends SupabaseTable<TicketDuplicatesViewRow> {
  @override
  String get tableName => 'ticket_duplicates_view';

  @override
  TicketDuplicatesViewRow createRow(Map<String, dynamic> data) =>
      TicketDuplicatesViewRow(data);
}

class TicketDuplicatesViewRow extends SupabaseDataRow {
  TicketDuplicatesViewRow(super.data);

  @override
  SupabaseTable get table => TicketDuplicatesViewTable();

  int? get ticketId => getField<int>('ticket_id');
  set ticketId(int? value) => setField<int>('ticket_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  int? get ticketsNumber => getField<int>('tickets_number');
  set ticketsNumber(int? value) => setField<int>('tickets_number', value);

  double? get ticketsRandom => getField<double>('tickets_random');
  set ticketsRandom(double? value) => setField<double>('tickets_random', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  int? get orderid => getField<int>('orderid');
  set orderid(int? value) => setField<int>('orderid', value);
}

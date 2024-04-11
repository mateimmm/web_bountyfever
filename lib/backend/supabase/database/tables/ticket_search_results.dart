import '../database.dart';

class TicketSearchResultsTable extends SupabaseTable<TicketSearchResultsRow> {
  @override
  String get tableName => 'ticket_search_results';

  @override
  TicketSearchResultsRow createRow(Map<String, dynamic> data) =>
      TicketSearchResultsRow(data);
}

class TicketSearchResultsRow extends SupabaseDataRow {
  TicketSearchResultsRow(super.data);

  @override
  SupabaseTable get table => TicketSearchResultsTable();

  int? get searchId => getField<int>('search_id');
  set searchId(int? value) => setField<int>('search_id', value);

  DateTime? get searchCreatedAt => getField<DateTime>('search_created_at');
  set searchCreatedAt(DateTime? value) =>
      setField<DateTime>('search_created_at', value);

  String? get searchvalue => getField<String>('searchvalue');
  set searchvalue(String? value) => setField<String>('searchvalue', value);

  String? get searchUserId => getField<String>('search_user_id');
  set searchUserId(String? value) => setField<String>('search_user_id', value);

  int? get searchCompetitionId => getField<int>('search_competition_id');
  set searchCompetitionId(int? value) =>
      setField<int>('search_competition_id', value);

  int? get ticketId => getField<int>('ticket_id');
  set ticketId(int? value) => setField<int>('ticket_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  int? get ticketsNumber => getField<int>('tickets_number');
  set ticketsNumber(int? value) => setField<int>('tickets_number', value);

  double? get ticketsRandom => getField<double>('tickets_random');
  set ticketsRandom(double? value) => setField<double>('tickets_random', value);

  String? get ticketUserId => getField<String>('ticket_user_id');
  set ticketUserId(String? value) => setField<String>('ticket_user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  int? get orderid => getField<int>('orderid');
  set orderid(int? value) => setField<int>('orderid', value);
}

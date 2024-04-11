import '../database.dart';

class UserCartTicketsViewTable extends SupabaseTable<UserCartTicketsViewRow> {
  @override
  String get tableName => 'user_cart_tickets_view';

  @override
  UserCartTicketsViewRow createRow(Map<String, dynamic> data) =>
      UserCartTicketsViewRow(data);
}

class UserCartTicketsViewRow extends SupabaseDataRow {
  UserCartTicketsViewRow(super.data);

  @override
  SupabaseTable get table => UserCartTicketsViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  int? get uniqueCompetitionCount => getField<int>('unique_competition_count');
  set uniqueCompetitionCount(int? value) =>
      setField<int>('unique_competition_count', value);

  double? get totalTickets => getField<double>('total_tickets');
  set totalTickets(double? value) => setField<double>('total_tickets', value);

  String? get userIds => getField<String>('user_ids');
  set userIds(String? value) => setField<String>('user_ids', value);
}

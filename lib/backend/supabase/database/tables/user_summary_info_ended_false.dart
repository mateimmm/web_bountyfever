import '../database.dart';

class UserSummaryInfoEndedFalseTable
    extends SupabaseTable<UserSummaryInfoEndedFalseRow> {
  @override
  String get tableName => 'user_summary_info_ended_false';

  @override
  UserSummaryInfoEndedFalseRow createRow(Map<String, dynamic> data) =>
      UserSummaryInfoEndedFalseRow(data);
}

class UserSummaryInfoEndedFalseRow extends SupabaseDataRow {
  UserSummaryInfoEndedFalseRow(super.data);

  @override
  SupabaseTable get table => UserSummaryInfoEndedFalseTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get totalTickets => getField<double>('total_tickets');
  set totalTickets(double? value) => setField<double>('total_tickets', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  int? get uniqueCompetitions => getField<int>('unique_competitions');
  set uniqueCompetitions(int? value) =>
      setField<int>('unique_competitions', value);
}

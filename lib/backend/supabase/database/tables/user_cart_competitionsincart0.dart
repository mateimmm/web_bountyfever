import '../database.dart';

class UserCartCompetitionsincart0Table
    extends SupabaseTable<UserCartCompetitionsincart0Row> {
  @override
  String get tableName => 'user_cart_competitionsincart0';

  @override
  UserCartCompetitionsincart0Row createRow(Map<String, dynamic> data) =>
      UserCartCompetitionsincart0Row(data);
}

class UserCartCompetitionsincart0Row extends SupabaseDataRow {
  UserCartCompetitionsincart0Row(super.data);

  @override
  SupabaseTable get table => UserCartCompetitionsincart0Table();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  double? get ticketsNumber => getField<double>('tickets_number');
  set ticketsNumber(double? value) => setField<double>('tickets_number', value);

  double? get totalTickets => getField<double>('total_tickets');
  set totalTickets(double? value) => setField<double>('total_tickets', value);

  int? get competitionNumber => getField<int>('competition_number');
  set competitionNumber(int? value) =>
      setField<int>('competition_number', value);

  int? get totalUniqueCompetitions =>
      getField<int>('total_unique_competitions');
  set totalUniqueCompetitions(int? value) =>
      setField<int>('total_unique_competitions', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);
}

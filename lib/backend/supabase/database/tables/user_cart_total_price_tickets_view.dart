import '../database.dart';

class UserCartTotalPriceTicketsViewTable
    extends SupabaseTable<UserCartTotalPriceTicketsViewRow> {
  @override
  String get tableName => 'user_cart_total_price_tickets_view';

  @override
  UserCartTotalPriceTicketsViewRow createRow(Map<String, dynamic> data) =>
      UserCartTotalPriceTicketsViewRow(data);
}

class UserCartTotalPriceTicketsViewRow extends SupabaseDataRow {
  UserCartTotalPriceTicketsViewRow(super.data);

  @override
  SupabaseTable get table => UserCartTotalPriceTicketsViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  double? get totalTickets => getField<double>('total_tickets');
  set totalTickets(double? value) => setField<double>('total_tickets', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);
}

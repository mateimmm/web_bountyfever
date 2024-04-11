import '../database.dart';

class UserCartTotalPriceTicketsView2Table
    extends SupabaseTable<UserCartTotalPriceTicketsView2Row> {
  @override
  String get tableName => 'user_cart_total_price_tickets_view2';

  @override
  UserCartTotalPriceTicketsView2Row createRow(Map<String, dynamic> data) =>
      UserCartTotalPriceTicketsView2Row(data);
}

class UserCartTotalPriceTicketsView2Row extends SupabaseDataRow {
  UserCartTotalPriceTicketsView2Row(super.data);

  @override
  SupabaseTable get table => UserCartTotalPriceTicketsView2Table();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  String? get competionName => getField<String>('competion_name');
  set competionName(String? value) => setField<String>('competion_name', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  double? get totalTickets => getField<double>('total_tickets');
  set totalTickets(double? value) => setField<double>('total_tickets', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);
}

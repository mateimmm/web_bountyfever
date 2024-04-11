import '../database.dart';

class UserOrdersTicketsTable extends SupabaseTable<UserOrdersTicketsRow> {
  @override
  String get tableName => 'user_orders_tickets';

  @override
  UserOrdersTicketsRow createRow(Map<String, dynamic> data) =>
      UserOrdersTicketsRow(data);
}

class UserOrdersTicketsRow extends SupabaseDataRow {
  UserOrdersTicketsRow(super.data);

  @override
  SupabaseTable get table => UserOrdersTicketsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get competionName => getField<String>('competion_name');
  set competionName(String? value) => setField<String>('competion_name', value);

  bool? get competitionEnded => getField<bool>('competition_ended');
  set competitionEnded(bool? value) =>
      setField<bool>('competition_ended', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  String? get ticketsRandom => getField<String>('tickets_random');
  set ticketsRandom(String? value) => setField<String>('tickets_random', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  double? get ticketsnumber => getField<double>('ticketsnumber');
  set ticketsnumber(double? value) => setField<double>('ticketsnumber', value);

  bool? get orderCompleted => getField<bool>('order_completed');
  set orderCompleted(bool? value) => setField<bool>('order_completed', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);
}

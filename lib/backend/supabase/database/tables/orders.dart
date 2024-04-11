import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(super.data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get competitionId => getField<int>('competition_id')!;
  set competitionId(int value) => setField<int>('competition_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get ticketsnumber => getField<double>('ticketsnumber');
  set ticketsnumber(double? value) => setField<double>('ticketsnumber', value);

  bool? get orderCompleted => getField<bool>('order_completed');
  set orderCompleted(bool? value) => setField<bool>('order_completed', value);

  bool? get orderCancelled => getField<bool>('order_cancelled');
  set orderCancelled(bool? value) => setField<bool>('order_cancelled', value);

  String? get ordersUserName => getField<String>('orders_user_name');
  set ordersUserName(String? value) =>
      setField<String>('orders_user_name', value);
}

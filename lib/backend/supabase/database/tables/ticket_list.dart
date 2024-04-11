import '../database.dart';

class TicketListTable extends SupabaseTable<TicketListRow> {
  @override
  String get tableName => 'ticket_list';

  @override
  TicketListRow createRow(Map<String, dynamic> data) => TicketListRow(data);
}

class TicketListRow extends SupabaseDataRow {
  TicketListRow(super.data);

  @override
  SupabaseTable get table => TicketListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double? get orderNumber => getField<double>('order_number');
  set orderNumber(double? value) => setField<double>('order_number', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  double? get ticketNumber => getField<double>('ticket_number');
  set ticketNumber(double? value) => setField<double>('ticket_number', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitiontId => getField<int>('competitiont_id');
  set competitiontId(int? value) => setField<int>('competitiont_id', value);
}

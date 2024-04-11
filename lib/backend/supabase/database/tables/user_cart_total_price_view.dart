import '../database.dart';

class UserCartTotalPriceViewTable
    extends SupabaseTable<UserCartTotalPriceViewRow> {
  @override
  String get tableName => 'user_cart_total_price_view';

  @override
  UserCartTotalPriceViewRow createRow(Map<String, dynamic> data) =>
      UserCartTotalPriceViewRow(data);
}

class UserCartTotalPriceViewRow extends SupabaseDataRow {
  UserCartTotalPriceViewRow(super.data);

  @override
  SupabaseTable get table => UserCartTotalPriceViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get competitionId => getField<int>('competition_id');
  set competitionId(int? value) => setField<int>('competition_id', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);
}

import '../database.dart';

class UserTotalSpentTable extends SupabaseTable<UserTotalSpentRow> {
  @override
  String get tableName => 'user_total_spent';

  @override
  UserTotalSpentRow createRow(Map<String, dynamic> data) =>
      UserTotalSpentRow(data);
}

class UserTotalSpentRow extends SupabaseDataRow {
  UserTotalSpentRow(super.data);

  @override
  SupabaseTable get table => UserTotalSpentTable();

  String? get paidUserid => getField<String>('paid_userid');
  set paidUserid(String? value) => setField<String>('paid_userid', value);

  double? get totalamountspent => getField<double>('totalamountspent');
  set totalamountspent(double? value) =>
      setField<double>('totalamountspent', value);
}

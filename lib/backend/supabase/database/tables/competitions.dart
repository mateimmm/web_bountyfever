import '../database.dart';

class CompetitionsTable extends SupabaseTable<CompetitionsRow> {
  @override
  String get tableName => 'competitions';

  @override
  CompetitionsRow createRow(Map<String, dynamic> data) => CompetitionsRow(data);
}

class CompetitionsRow extends SupabaseDataRow {
  CompetitionsRow(super.data);

  @override
  SupabaseTable get table => CompetitionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get competionName => getField<String>('competion_name');
  set competionName(String? value) => setField<String>('competion_name', value);

  String? get competionDetails => getField<String>('competion_details');
  set competionDetails(String? value) =>
      setField<String>('competion_details', value);

  double? get competitionPrice => getField<double>('competition_price');
  set competitionPrice(double? value) =>
      setField<double>('competition_price', value);

  DateTime? get competitionStart => getField<DateTime>('competition_start');
  set competitionStart(DateTime? value) =>
      setField<DateTime>('competition_start', value);

  DateTime? get competitionEnd => getField<DateTime>('competition_end');
  set competitionEnd(DateTime? value) =>
      setField<DateTime>('competition_end', value);

  double? get competitionMaxnumberticket =>
      getField<double>('competition_maxnumberticket');
  set competitionMaxnumberticket(double? value) =>
      setField<double>('competition_maxnumberticket', value);

  double? get competitionTicketssold =>
      getField<double>('competition_ticketssold');
  set competitionTicketssold(double? value) =>
      setField<double>('competition_ticketssold', value);

  bool? get competitionEnded => getField<bool>('competition_ended');
  set competitionEnded(bool? value) =>
      setField<bool>('competition_ended', value);

  String? get competitionWinner => getField<String>('competition_winner');
  set competitionWinner(String? value) =>
      setField<String>('competition_winner', value);

  double get competitionMaxticketsperuser =>
      getField<double>('competition_maxticketsperuser')!;
  set competitionMaxticketsperuser(double value) =>
      setField<double>('competition_maxticketsperuser', value);

  String? get competitionPictures => getField<String>('competition_pictures');
  set competitionPictures(String? value) =>
      setField<String>('competition_pictures', value);

  String? get stripeprice => getField<String>('stripeprice');
  set stripeprice(String? value) => setField<String>('stripeprice', value);

  String? get winningticket => getField<String>('winningticket');
  set winningticket(String? value) => setField<String>('winningticket', value);

  String? get competitionShortname => getField<String>('competition_shortname');
  set competitionShortname(String? value) =>
      setField<String>('competition_shortname', value);

  List<String> get morephoto => getListField<String>('morephoto');
  set morephoto(List<String>? value) =>
      setListField<String>('morephoto', value);
}

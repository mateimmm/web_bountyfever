// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchresultStruct extends BaseStruct {
  SearchresultStruct({
    String? ticketsRandom,
    String? username,
    int? orderid,
  })  : _ticketsRandom = ticketsRandom,
        _username = username,
        _orderid = orderid;

  // "tickets_random" field.
  String? _ticketsRandom;
  String get ticketsRandom => _ticketsRandom ?? '';
  set ticketsRandom(String? val) => _ticketsRandom = val;
  bool hasTicketsRandom() => _ticketsRandom != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "orderid" field.
  int? _orderid;
  int get orderid => _orderid ?? 0;
  set orderid(int? val) => _orderid = val;
  void incrementOrderid(int amount) => _orderid = orderid + amount;
  bool hasOrderid() => _orderid != null;

  static SearchresultStruct fromMap(Map<String, dynamic> data) =>
      SearchresultStruct(
        ticketsRandom: data['tickets_random'] as String?,
        username: data['username'] as String?,
        orderid: castToType<int>(data['orderid']),
      );

  static SearchresultStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchresultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tickets_random': _ticketsRandom,
        'username': _username,
        'orderid': _orderid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tickets_random': serializeParam(
          _ticketsRandom,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'orderid': serializeParam(
          _orderid,
          ParamType.int,
        ),
      }.withoutNulls;

  static SearchresultStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchresultStruct(
        ticketsRandom: deserializeParam(
          data['tickets_random'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        orderid: deserializeParam(
          data['orderid'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SearchresultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchresultStruct &&
        ticketsRandom == other.ticketsRandom &&
        username == other.username &&
        orderid == other.orderid;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([ticketsRandom, username, orderid]);
}

SearchresultStruct createSearchresultStruct({
  String? ticketsRandom,
  String? username,
  int? orderid,
}) =>
    SearchresultStruct(
      ticketsRandom: ticketsRandom,
      username: username,
      orderid: orderid,
    );

import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class StripepaymentlinkCall {
  static Future<ApiCallResponse> call({
    int? quantity,
    String? skey = '',
    String? price = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Stripepaymentlink',
      apiUrl: 'https://api.stripe.com/v1/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $skey',
      },
      params: {
        'line_items[0][price]': price,
        'line_items[0][quantity]': quantity,
        'success_url':
            "https://bountyfever.com/success?session_id={CHECKOUT_SESSION_ID}",
        'mode': "payment",
        'billing_address_collection': "required",
        'return_url': "https://bountyfever.com",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? paymenturl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static String? paymentid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? paymentstatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.payment_status''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetStripepaymentstatusCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? skey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getStripepaymentstatus',
      apiUrl: 'https://api.stripe.com/v1/checkout/sessions/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $skey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? apiname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer_details.name''',
      ));
  static String? apiemail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer_details.email''',
      ));
  static String? apicountry(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.customer_details.address.country''',
      ));
  static dynamic apicustomerdetails(dynamic response) => getJsonField(
        response,
        r'''$.customer_details''',
      );
  static dynamic apiadress(dynamic response) => getJsonField(
        response,
        r'''$.customer_details.address''',
      );
  static String? paymentid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}

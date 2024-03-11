import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RecourceCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'recource',
      apiUrl:
          'https://dsnwvvivuxpvrywcizfb.supabase.co/rest/v1/resourse?or=(user_id.ilike.%$userId%)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzbnd2dml2dXhwdnJ5d2NpemZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMjUzODksImV4cCI6MjAyNDYwMTM4OX0.Zu3OPweoMC2h7zU-ig3okaE7eNkUo1gIRrZMicUP0BM',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzbnd2dml2dXhwdnJ5d2NpemZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMjUzODksImV4cCI6MjAyNDYwMTM4OX0.Zu3OPweoMC2h7zU-ig3okaE7eNkUo1gIRrZMicUP0BM',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RoleUsersCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'roleUsers',
      apiUrl:
          'https://dsnwvvivuxpvrywcizfb.supabase.co/rest/v1/user_roles_view',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzbnd2dml2dXhwdnJ5d2NpemZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMjUzODksImV4cCI6MjAyNDYwMTM4OX0.Zu3OPweoMC2h7zU-ig3okaE7eNkUo1gIRrZMicUP0BM',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzbnd2dml2dXhwdnJ5d2NpemZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMjUzODksImV4cCI6MjAyNDYwMTM4OX0.Zu3OPweoMC2h7zU-ig3okaE7eNkUo1gIRrZMicUP0BM',
        'Range': '0-9',
      },
      params: {
        'user_id': userId,
        'select': "*",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? role(dynamic response) => getJsonField(
        response,
        r'''$[:].roles''',
        true,
      ) as List?;
}

class UsersCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'users',
      apiUrl: 'https://dsnwvvivuxpvrywcizfb.supabase.co/rest/v1/users',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzbnd2dml2dXhwdnJ5d2NpemZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMjUzODksImV4cCI6MjAyNDYwMTM4OX0.Zu3OPweoMC2h7zU-ig3okaE7eNkUo1gIRrZMicUP0BM',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzbnd2dml2dXhwdnJ5d2NpemZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMjUzODksImV4cCI6MjAyNDYwMTM4OX0.Zu3OPweoMC2h7zU-ig3okaE7eNkUo1gIRrZMicUP0BM',
        'Range': '0-9',
      },
      params: {
        'id': id,
        'select': "*",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$[:].city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

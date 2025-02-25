

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'constant_api.dart';

Future<Response> createUser({required Map body}) async {
  try {
    var url = Uri.http(ApiAll().url, ApiAll().createAccount);
    var response = await http.post(url, body: json.encode(body));
    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    return Response(error.toString(), 111);
  }
}

// ignore_for_file: strict_raw_type

import 'package:hacker_news/data/data-sources/network'
    '/api_request_representable.dart';
import 'package:hacker_news/data/data-sources/network'
    '/api_response.dart';

abstract class NetworkService{
  Duration? requestTimeOut;
  Future<APIResponse> request(APIRequestRepresentable apiRequestRepresentable);
  Future<APIResponse> post(APIRequestRepresentable apiRequestRepresentable);
  Future<APIResponse> get(APIRequestRepresentable apiRequestRepresentable);
  Future<APIResponse> patch(APIRequestRepresentable apiRequestRepresentable);
  Future<APIResponse> delete(APIRequestRepresentable apiRequestRepresentable);
}

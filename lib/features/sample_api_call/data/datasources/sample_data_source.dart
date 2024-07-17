import 'dart:convert';
import 'dart:developer';


import 'package:chandranflutter/config/appUrlConfig.dart';
import 'package:http/http.dart' as http;

import '../models/sample_model.dart';

abstract class SampleDataSource {
  Future<SampleModel> getSampleDetails(jsonRequestBody);
}

class SampleDataImplements implements SampleDataSource {
  @override
  Future<SampleModel> getSampleDetails(jsonRequesrBody) async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.baseUrl}${AppUrl.userPage}"));
      if (response.statusCode == 200) {
        return SampleModel.fromJson(json.decode(response.body));
      } else {
        throw "Error";
      }
    } catch (e) {
      throw "error";
    }
  }
}

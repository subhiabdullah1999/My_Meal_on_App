import 'dart:convert';

import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/functions/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String lingUrl, Map data, Map<String, String> head) async {
    try {
      if (await checkInterNet()) {
        var response =
            await http.post(Uri.parse(lingUrl), body: data, headers: head);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print("DDDDDDDDDDDDDDDDDDddddddd");

          return Right(responsebody);
        } else {
          print("Code____________________________");
          print(response.statusCode);
          print("Code____________________________");

          return const Left(StatusRequest.faliure);
        }
      } else {
        return const Left(StatusRequest.offlinefailuer);
      }
    } catch (_) {
      print(_.toString());
      return const Left(StatusRequest.servesfailuer);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
      String lingUrl, Map<String, String> data) async {
    try {
      if (await checkInterNet()) {
        var response = await http.get(Uri.parse(lingUrl), headers: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          String responsebody = response.body;
          Map responsebodyMap = jsonDecode(responsebody);

          return Right(responsebodyMap);
        } else {
          print(response.statusCode);

          return const Left(StatusRequest.servesfailuer);
        }
      } else {
        return const Left(StatusRequest.offlinefailuer);
      }
    } catch (_) {
      print("LLPLLLLLLLLLLLLLLlnjkkkkkkkkkkkkkkkk");
      print(_.toString());
      return const Left(StatusRequest.servesfailuer);
    }
  }

  Future<Either<StatusRequest, Map>> deletData(
      String lingUrl, Map data, Map<String, String> head) async {
    try {
      if (await checkInterNet()) {
        var response =
            await http.delete(Uri.parse(lingUrl), body: data, headers: head);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else {
          print(response.statusCode);

          return const Left(StatusRequest.servesfailuer);
        }
      } else {
        return const Left(StatusRequest.offlinefailuer);
      }
    } catch (_) {
      print(_.toString());
      return const Left(StatusRequest.servesfailuer);
    }
  }

  //
}

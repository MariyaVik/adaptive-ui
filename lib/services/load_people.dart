import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/person.dart';

class PeopleApi {
  Future<String> loadData() async {
    return await rootBundle.loadString('assets/data/people.json');
  }

  Future<List<Person>> loadPeople() async {
    return await loadData().then((p) {
      List<dynamic> pe = jsonDecode(p);
      List<Person> peo = pe.map((e) => Person.fromJson(e)).toList();
      return peo;
    });
  }
}

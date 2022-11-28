import 'dart:convert';
import 'package:first_app/model/people.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TestAPI extends StatefulWidget {
  const TestAPI({super.key});

  @override
  State<TestAPI> createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
  var listData = <Person>[];
  Future<List<Person>> fetchData() async {
    final respone =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    List<Person> datajsons = <Person>[];
    if (respone.statusCode == 200) {
      final dataJson = json.decode(respone.body);
      dataJson.map((e) {
        final temp = Person.formJson(e);
        datajsons.add(temp);
      }).toList();
      listData = datajsons;
    } else {
      throw Exception('Failed to get the Data');
    }
    return datajsons;
  }

  @override
  Widget build(BuildContext context) {
    fetchData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test API"),
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(top: 5, bottom: 5, right: 8, left: 8),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 32, bottom: 32, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${listData[index].title}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${listData[index].id}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text(
                    '${listData[index].body}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.timelapse,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      const Text(
                        '8:00 AM',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      const Text(
                        'Phnom Pen, Cambodia',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

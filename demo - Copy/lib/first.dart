// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables
//this is the final task
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var userInput;
  var sorted;

  var data;

  getApi(value) async {
    final response = await https.get(
        Uri.parse(
            'https://atlas.mappls.com/api/places/search/json?query=$value'),
        headers: {
          'Access-Control-Allow-Origin': "*",
          'Access-Control-Allow-Headers': '*',
          'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
          'cors': '*',
          HttpHeaders.authorizationHeader:
              "bearer 9fbf0f03-637b-4225-a123-68ab7b5b92c8",
        });

    data = await json.decode(response.body);
    print(data);
    sorted = data["suggestedLocations"][0]["eLoc"];
    print(sorted);
    return data;
    // print("wwwwwwww $data");
    // print(userInput)
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
          titleSpacing: 40.0,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  userInput = value;
                  print("userInput $userInput");
                  setState(() {
                    getApi(value);
                  });
                  print(value);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          userInput = Null;
                          print("pressed");
                        });
                        // query = "";
                      },
                    ),
                    hintText: 'Search here...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          FutureBuilder(
              // future: getApi("tata steel"),
              future: getApi(userInput),
              builder: (context, dynamic snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    ListTile(
                      // leading: Icon(Icons.api_rounded),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      // selectedTileColor: Colors.grey[300],
                      selected: true,
                      title: Text(
                          "${snapshot.data['suggestedLocations'][0]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][0]['placeAddress']}"),
                    ),
                    ListTile(
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20.0)),
                      // selectedTileColor: Colors.blue.shade200,
                      // selected: true,
                      title: Text(
                          "${snapshot.data['suggestedLocations'][1]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][1]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][2]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][2]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][3]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][3]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][4]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][4]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][5]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][5]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][6]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][6]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][7]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][7]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][8]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][8]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][9]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][9]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][10]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][10]['placeAddress']}"),
                    ),
                    ListTile(
                      title: Text(
                          "${snapshot.data['suggestedLocations'][11]['placeName']}"),
                      subtitle: Text(
                          "${snapshot.data['suggestedLocations'][11]['placeAddress']}"),
                    ),
                  ]);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ]),
      ),
    ));
  }
}


// dumka





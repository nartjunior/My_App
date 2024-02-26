import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';
import 'package:unsplash/model/imagemodel.dart';

class Nameot22 extends StatefulWidget {
  const Nameot22({Key? key}) : super(key: key);

  @override
  _Nameot22State createState() => _Nameot22State();
}

class _Nameot22State extends State<Nameot22>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<List<ImageModel>> getCollectionImages(
      String id, int page, int perPage) async {
    String apiKey = '2W3ZiKs2TDbykh2TO9qVjQlU6XH6QOFL84rtFSIr38Y';
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/collections/$id/photos?client_id=$apiKey&page=$page&per_page=$perPage'));
        print(response);
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      List<ImageModel> images =
      result.map((e) => ImageModel.fromJson(e)).toList();
      return images;
    } else {
      throw "Can't get images";

  }


  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';



void main() =>
    runApp(MaterialApp(
      home: Home(),
    ));

class YellowBird extends StatefulWidget {
  const YellowBird({ super.key });

  @override State<YellowBird> createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  var urlData;
  void getApiData() async {

    var url = Uri.parse(
        'https://api.unsplash.com/photos/?per_page=30&client_id=2W3ZiKs2TDbykh2TO9qVjQlU6XH6QOFL84rtFSIr38Y');
    final res = await http.get(url);
    setState(() {
      urlData = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http request'),
      ),
      body: Center(child: urlData==null?CircularProgressIndicator():GridView.builder(
          itemCount: 30,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 6,crossAxisCount: 2, crossAxisSpacing: 6), itemBuilder: (context,i){
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageView(
              url: urlData[i]['urls']['full'],
            )));
          },
          child: Hero(
            tag: 'full',
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(urlData[i]['urls']['full']),
                  fit: BoxFit.cover
                ),
              ),
            ),
          ),
        );
      }),),
    );
  }
}

class FullImageView extends StatelessWidget {
  var url;
  FullImageView({this.url});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'full',
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(url), fit: BoxFit.cover
            )
          ),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wedding App'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.asset('assets/Foto1.jpg'),
            ),
          ),
          Expanded(
            child: Container(
              child: Image.asset('assets/Foto2.jpg'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Text('Click'),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Page 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Move to previous page'),
        ),
      ),
    );
  }
}

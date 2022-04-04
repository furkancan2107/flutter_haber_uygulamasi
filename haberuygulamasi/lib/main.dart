
import 'package:flutter/material.dart';
import 'package:haberuygulamasi/data/News_Service.dart';
import 'package:haberuygulamasi/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Haber(),
    );
  }
}
class Haber extends StatefulWidget {
  @override
  _HaberState createState() => _HaberState();
}

class _HaberState extends State<Haber> {

  List<Articles>? articles = [];
  @override
  void initState() {
    // TODO: implement initState
    NewsService.getNews().then((value){
      setState(() {
        articles=value;

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text("Haberler",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          children: [

            ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(children: [
                      Image.network(articles![index].urlToImage.toString()),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(articles![index].title.toString()),
                        subtitle: Text(articles![index].author.toString()),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(articles![index].description.toString()),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(onPressed: (){
                            launch(articles![index].url);
                          }, child: Text("Habere Git")),
                        ],
                      ),
                    ],),
                  );
                }),
          ],
        )),
      );

  }
}


import 'package:flutter/material.dart';
import 'package:task_1_webops/services/post.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  dynamic posts=[
    Post(title: "Something great",description: "hi how are you",imgurl: "http//"),
    Post(title: "rocky",description: "greatest boxer of all time",imgurl: "http//")
  ];

  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("POSTS"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
          itemBuilder: (context,index){
            return Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children:<Widget>[
                    ListTile(
                    onTap: (){},
                    title: Text(
                        posts[index].title,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                        color: Colors.grey[800],
                      ),
                    ),
                    subtitle: Text(
                        "\n ${posts[index].description}",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                    Row(
                      children: [
                        FlatButton.icon(
                            onPressed: () async {
                              dynamic result=await Navigator.pushNamed(context, '/edit',arguments: {
                                "title":posts[index].title,
                                "body":posts[index].description,
                                "imgurl":posts[index].imgurl,
                              });
                              setState(() {
                                posts[index].title=result["title"];
                                posts[index].description=result["body"];
                              });
                            },
                            icon: Icon(Icons.edit),
                            label: Text("edit")
                        ),
                        SizedBox(width: 150.0),
                        FlatButton.icon(
                            onPressed: (){
                              setState(() {
                                posts.remove(posts[index]);
                              });
                            },
                            icon: Icon(Icons.delete),
                            label: Text("delete")
                        ),
                    ]),
                  ]
                ),
              ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result=await Navigator.pushNamed(context, "/add");
          setState(() {
            data=[Post(title:result["title"] ,description:result["body"] ,imgurl: "")];
            posts+=data;
          });
        },    //onpressed
        child: Text("new"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

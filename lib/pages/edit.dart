import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  dynamic title;
  dynamic body;
  dynamic data_to_edit;

  @override
  Widget build(BuildContext context) {
    final formkey=GlobalKey<FormState>();

    data_to_edit=ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Your Post"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                initialValue:data_to_edit["title"],
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value!.length==0){
                    return "Please enter title";
                  }else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    title=value;
                  });
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                initialValue: data_to_edit["body"],
                decoration: InputDecoration(
                  labelText: "Body",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value!.length==0){
                    return "Please enter Body";
                  }else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    body=value;
                  });
                },
              ),
              FlatButton.icon(
                onPressed: (){
                  final isValid=formkey.currentState!.validate();
                  formkey.currentState!.save();
                  Navigator.pop(context,{
                    "title":title,
                    "body":body,
                  });
                },
                icon: Icon(Icons.arrow_back_ios_sharp),
                label: Text("post"),
              ),
              //TextButton.icon(onPressed: onPressed, icon: icon, label: label)
            ],
          ),
        ),
      ),
    );
  }
}
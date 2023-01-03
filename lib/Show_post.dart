import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowPost extends StatefulWidget {
  const ShowPost({Key? key}) : super(key: key);

  @override
  State<ShowPost> createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  DatabaseReference ref=FirebaseDatabase.instance.ref("post");
  TextEditingController searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Show Post"),
      automaticallyImplyLeading: false,
      centerTitle: true,
      
      )
      
      ,
      body: Column(
        children: <Widget>[

          SizedBox(
            height: 10,
          ),
          TextField(
            controller: searchcontroller,
            decoration: InputDecoration(
              hintText: "search Data",
            ),
            onChanged: ((value) {

              setState(() {
                

              });
              
            }),
          ),
          Expanded(child: 
          
          FirebaseAnimatedList(
            query: ref,
            
            itemBuilder: (context,snapshot,animation,index){
              final data=snapshot.child('post').value.toString();

              if(searchcontroller.text.isEmpty){
              return ListTile(
                title: Text(snapshot.child('post').value.toString()),
              );

              }else if(data.toLowerCase().contains(searchcontroller.text.toLowerCase())){
                return ListTile(
                title: Text(snapshot.child('post').value.toString()),
              );
              }else{
                return SizedBox();
              }
            },
            
            )
          )

        ],
      ),
    );
    
  }
}
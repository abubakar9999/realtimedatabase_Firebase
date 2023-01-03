import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtimedatabase/Show_post.dart';
 

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController postcontroller=TextEditingController();

  DatabaseReference ref=FirebaseDatabase.instance.ref("post");
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Add Post"),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              maxLines: 4,
              controller: postcontroller,
              decoration: InputDecoration(
                
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(onPressed: (){

              ref.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
                'post':postcontroller.text,
                'id':DateTime.now().microsecondsSinceEpoch.toString()

              }).then((value) {
                SnackBar(content: Text("Data is Added"));
              }).onError((error, stackTrace) {
                SnackBar(content: Text("Somethig wrong"));

              });
              postcontroller.clear();

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPost()));

            }, child: Text("Add"))
          ],
        ),
      ),
    );
    
  }
}
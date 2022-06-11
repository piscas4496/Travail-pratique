import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteClient extends StatefulWidget {
  const DeleteClient({ Key? key }) : super(key: key);

  @override
  State<DeleteClient> createState() => _DeleteClientState();
}

class _DeleteClientState extends State<DeleteClient> {
   TextEditingController txtid = new TextEditingController();

  Future<void> deleteData() async
  {
   var url = "http://localhost:80/isig_2020/delete.php";
    final res=await http.post(Uri.parse(url),
    body:{
      "id":txtid.text
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Client"),
        backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            new TextField(
                controller: txtid,
                decoration : InputDecoration(
                  labelText: "Code",
                  hintText: "Entrer le code"
                )
              ),            
            new RaisedButton(
              onPressed: (){deleteData();},
              child: Text("Suprimer"),
              color: Colors.blue,
              ),
          ],
        )
    );
  }
}
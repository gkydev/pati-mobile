import "package:flutter/material.dart";
import "services/PetService.dart";

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x = new PetService();
    print("aaa");
    x.listAsync().then((value) => () {
          print("aa");
          value.data.forEach((element) {
            print("aaa");
            print(element.petAdditionInfo);
          });
        });
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text("text1"),
                  Text("Text2"),
                ],
              ),
            ),
          );
        },
        itemCount: 50,
      ),
    );
  }
}

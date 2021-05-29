import "package:flutter/material.dart";
import 'package:pati_mobile/widgets/petListItem.dart';
import '../services/PetService.dart';

class PetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x = PetService().listAsync();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Evcil Hayvanlar"),
      ),
      body: Container(
        child: FutureBuilder(
          future: x,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  for (var i = 0; i < snapshot.data.data.length; i++)
                    PetListItem(snapshot.data.data[i]),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

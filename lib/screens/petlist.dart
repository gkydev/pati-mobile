import "package:flutter/material.dart";
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
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: CircularProgressIndicator()));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 100, minHeight: 50),
                        child: Image.network(
                          snapshot.data.data[index].images[0],
                        )),
                    title: Text(snapshot.data.data[index].petName,
                        textAlign: TextAlign.center),
                    subtitle: Text(snapshot.data.data[index].petAdditionInfo,
                        textAlign: TextAlign.center),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/PetDetail', arguments: snapshot.data.data[index]
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

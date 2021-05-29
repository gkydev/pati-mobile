import 'package:flutter/material.dart';
import 'package:pati_mobile/models/PetDto.dart';

class PetListItem extends StatelessWidget {
  final PetDto petDto;

  PetListItem(this.petDto);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          shape: new RoundedRectangleBorder(
              side: new BorderSide(color: Colors.pink[50], width: 3.0),
              borderRadius: BorderRadius.circular(4.0)),
          child: InkWell(
            onTap: () {
              print("saadsadas");
              Navigator.pushNamed(context, '/PetDetail', arguments: petDto);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Image.network(petDto.images[0], fit: BoxFit.cover),
                      flex: 3,
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                petDto.petName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 20),
                              Text(
                                petDto.petAdditionInfo,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                petDto.speciesName,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.pink, fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                petDto.shelterName,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          )),
                      flex: 7,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

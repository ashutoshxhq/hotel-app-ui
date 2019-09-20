import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final image;
  final text;
  final sub;
  String rating;
  final id;

  HotelCard(this.image,this.text,this.sub,this.rating,this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 150,
        child: Stack(
          children: <Widget>[
            Card(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4)
                    ),
                    child:Container(height:80,child: Image.network(image, fit: BoxFit.cover,)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(text ,
                            style: TextStyle(
                              //fontFamily: "Quicksand",
                                fontSize: 15,
                                color: Colors.black87
                            ),
                          ),
                          Text(sub ,
                            style: TextStyle(
                              //fontFamily: "Quicksand",
                                fontSize: 8,
                                color: Colors.grey
                            ),
                          ),


                        ],
                      ),
                    )
                    ,
                  ),


                ],
              ),
            ),
            Positioned(
              left: 10,
              top: 4,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                          color: Theme.of(context).primaryColor

                      ),
                      // color: Colors.orange[300],
                      width: 30.0,
                      height: 30.0,
                      child: Text('${rating}.0', style:TextStyle(
                          color:Colors.white,
                          fontFamily: 'Quicksand',
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      )),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/tabs.dart';
class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(child: Icon(Icons.arrow_back),onTap: (){
            Provider.of<Tabs>(context).changeIndex(0);
          },),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(text: "BOOKED"),
              new Tab(text: "CANCELLED"),
            ],
          ),
          title: Text('Bookings',style: TextStyle(fontFamily: 'poppins-regular',fontWeight: FontWeight.w500),),
        ),
        body: TabBarView(
          children: <Widget>[
            Current(),
            Cancelled()
          ],
        ),
      ),
    );
  }

  Widget Current() {
    return ListView(
        children: <Widget>[
          itemCard('Hatke Hotel','assets/images/exploreOyoHotels1.jpeg',false),
          itemCard('Hatke Hotel','assets/images/exploreOyoHotels1.jpeg',false),
          
        ],
      );
  }
  Widget Cancelled(){
    return ListView(
        children: <Widget>[
          itemCard('Hatke Hotel','assets/images/exploreOyoHotels1.jpeg',false),
          itemCard('Hatke Hotel','assets/images/exploreOyoHotels1.jpeg',false),
          itemCard('Hatke Hotel','assets/images/exploreOyoHotels1.jpeg',false),
          itemCard('Hatke Hotel','assets/images/exploreOyoHotels1.jpeg',false),
          itemCard('Hatke Hotel','assets/images/exploreOyoHotels1.jpeg',false),
          
        ],
      );
  }
}


Widget itemCard(String title, String imgPath, bool isFavorite) {
  return Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
    child: Container(

      height: 120.0,
      width: double.infinity,
      //color: Colors.white,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 140.0,
            height: 160.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(

                    image: AssetImage(imgPath), fit: BoxFit.cover)),
          ),
          SizedBox(width: 4.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 175.0,
                    child: Text(
                      'Ratu Road, Ranchi',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 50.0,
                    child: Center(
                      child: Text(
                        'Rs 248',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 35.0),

                  Container(
                    child: FlatButton(
                      color: Colors.teal,
                      onPressed: (){},
                      textColor: Colors.white,
                      child: Text('DETAILS',style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
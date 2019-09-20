import 'package:flutter/material.dart';
import 'profile.dart';
import 'models/locations.dart';
import 'hotel.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _width;
  double _height;
  List<AreaLocationList> areaLocationList;
  @override
  void initState() {
    super.initState();
    areaLocationList = [
      new AreaLocationList('assets/images/nearby.png','Nearby'),
      new AreaLocationList('assets/images/nanital.jpg','Nainital'),
      new AreaLocationList('assets/images/delhi.jpeg','Delhi'),
      new AreaLocationList('assets/images/agra.jpeg','Agra'),
      new AreaLocationList('assets/images/goa.jpeg','Goa'),
      new AreaLocationList('assets/images/musoorie.jpeg','Musoorie'),
      new AreaLocationList('assets/images/banglore.jpeg','Banglore'),
      new AreaLocationList('assets/images/hyedrabaad.jpeg','Hyedrabaad'),
      new AreaLocationList('assets/images/kolkata.jpeg','Kolkata'),
      new AreaLocationList('assets/images/mumbai.jpeg','Mumbai'),
      new AreaLocationList('assets/images/noida.jpeg','Noida'),
      new AreaLocationList('assets/images/pune.jpeg','Pune'),
      new AreaLocationList('assets/images/mnali.jpeg','Mnali'),
    ];
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: GestureDetector(child: Icon(Icons.menu),onTap: () =>
                  Scaffold.of(context).openDrawer(),),
              actions: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0,5,0,0),
                      child: Icon(Icons.face)),
                ),
                SizedBox(width: 12,)
              ],
              expandedHeight: _height/5.5,
              floating: false,
              pinned: true,
              backgroundColor: Colors.teal,
              //#f02730
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                titlePadding: EdgeInsets.only(top: 30.0),
                title: Center(
                  child: Text(
                    "Hotel App",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins-regular',
                        fontSize: 22),
                  ),
                ),
              ),
              bottom: PreferredSize(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10,top:10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    width: _width,
                    //height: _height/15,
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.only(left: 15.0, top: 0.0,bottom: 0),
                          prefixIcon: Icon(Icons.search, size: 20,color: Colors.grey,),
                          hintText:"Search for Hotel, City or Location",hintStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,fontFamily: 'poppins-regular'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  preferredSize: Size(_width,_height/45)),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: _height/8,
                child: ListView.builder(
                    itemCount: areaLocationList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildLocationList(areaLocationList[index]);
                    }),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:EdgeInsets.fromLTRB(5,0,10,0),
                      child: Text('Recommended for you',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildHotel(),
                          _buildHotel(),
                          _buildHotel(),
                          _buildHotel(),
                          _buildHotel(),
                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      margin:EdgeInsets.symmetric(vertical: 0),
                      height: 180.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 2,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child:Image.asset('assets/images/Supersale.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      padding:EdgeInsets.fromLTRB(5,0,10,0),
                      child: Text('Experiences for you',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      height: _height*0.22,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildExperience(),
                          _buildExperience(),
                          _buildExperience(),
                          _buildExperience(),
                          _buildExperience(),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin:EdgeInsets.symmetric(vertical: 0),
                      height: 180.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 2,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child:Image.asset('assets/images/dailySale.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }


  Widget _buildHotel(){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleHotel()),
        );
      },
      child: Container(
        width:180,
        height:200,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4)
                ),
                child:Container(height:_height*0.15,width:_width,child: Image.asset('assets/images/exploreOyoHotels1.jpeg',fit: BoxFit.cover,)),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hotel XYZ',
                      style: TextStyle(
                          fontFamily: "poppins-regular",
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'Pune, Maharashtra',
                      style: TextStyle(
                        fontFamily: "poppins-regular",
                        fontSize: 14,
                        color: Colors.grey,
                        //fontWeight: FontWeight.w400
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildExperience(){
    return Container(
      width:180,
      height:_height*0.20,
      child: Card(
        child: ClipRRect(
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
          child:Container(height:_height*0.20,width:_width,child: Image.asset('assets/images/exploreOyoHotels1.jpeg',fit: BoxFit.cover,)),
        ),
      ),
    );
  }
  Widget _buildLocationList(AreaLocationList item) {
    return Container(
      color: Colors.white,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(70.0),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              item.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11,color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}

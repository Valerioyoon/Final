import 'package:day35/animation/FadeAnimation.dart';
import 'package:day35/pages/date_time.dart';
import 'package:flutter/material.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({ Key? key }) : super(key: key);

  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  // Rooms to clean
  List<dynamic> _rooms =[
    ['굴착공사', 'https://img.icons8.com/external-nawicon-outline-color-nawicon/2x/external-excavator-construction-nawicon-outline-color-nawicon.png', Colors.red, 0],
    ['공급전점검', 'https://img.icons8.com/color/48/2x/energy-meter.png', Colors.orange, 1],
    ['위험작업', 'https://img.icons8.com/external-itim2101-lineal-color-itim2101/2x/external-water-pump-plumber-tools-itim2101-lineal-color-itim2101.png', Colors.blue, 1],
    ['현장협의', 'https://img.icons8.com/external-itim2101-lineal-color-itim2101/2x/external-worker-project-management-itim2101-lineal-color-itim2101.png', Colors.purple, 0],
  ];

  List<int> _selectedRooms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: _selectedRooms.length > 0 ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DateAndTime()
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 2),
            Icon(Icons.arrow_forward_ios, size: 18,),
          ],
        ),
        backgroundColor: Colors.blue,
      ) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeAnimation(1, Padding(
                padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                child: Text(
                  '어떤 작업을 하실건가요?',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ))
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _rooms.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeAnimation((1.2 + index) / 4, room(_rooms[index], index));
            }
          ),
        ),
      )
    );
  }
  
  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedRooms.contains(index))
            _selectedRooms.remove(index);
          else
            _selectedRooms.add(index);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _selectedRooms.contains(index) ? room[2].shade50.withOpacity(0.5) : Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Image.network(room[1], width: 35, height: 35,),
                    SizedBox(width: 10.0,),
                    Text(room[0], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  ],
                ),
                Spacer(),
                _selectedRooms.contains(index) ? 
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.check, color: Colors.green, size: 20,)
                  ) : 
                  SizedBox()
              ],
            ),
            (_selectedRooms.contains(index) && room[3] >= 1) ?
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                ],
              ),
            ) : SizedBox()
          ],
        )
      ),
    );
  }
}
import 'package:day35/animation/FadeAnimation.dart';
import 'package:day35/pages/select_pdf.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({ Key? key }) : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  int _selectedDay = 2;
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';
  List<int> _selectedExteraCleaning = [];

  ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _days = [
    [1, '월'],
    [2, '화'],
    [3, '수'],
    [4, '목'],
    [5, '금'],
    [6, '토'],
    [7, '일'],
    [8, '월'],
    [9, '화'],
    [10, '수'],
    [11, '목'],
    [12, '금'],
    [13, '토'],
    [14, '일'],
    [15, '월'],
    [16, '화'],
    [17, '수'],
    [18, '목'],
    [19, '금'],
    [20, '토'],
    [21, '일'],
    [22, '월'],
    [23, '화'],
    [24, '수'],
    [25, '목'],
    [26, '금'],
    [27, '토'],
    [28, '일'],
    [29, '월'],
    [30, '화'],
    [31, '수']
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  final List<String> _repeat = [
    '작업 없음',
    '기밀/누출 검사',
    '관로퍼지',
    '스퀴즈/가스백 작업'
  ];

  final List<dynamic> _exteraCleaning = [
    ['보호시트', 'https://img.icons8.com/officel/16/2x/sticky-tape.png'],
    ['전위측정기', 'https://img.icons8.com/external-filled-outline-icons-pause-08/2x/external-meter-car-repair-filled-outline-icons-pause-08.png'],
    ['XP-311', 'https://img.icons8.com/office/16/2x/gas-station.png'],
    ['XP-314', 'https://img.icons8.com/external-xnimrodx-lineal-color-xnimrodx/2x/external-gas-station-town-xnimrodx-lineal-color-xnimrodx.png'],
    ['퍼지봉', 'https://img.icons8.com/external-itim2101-lineal-color-itim2101/2x/external-pipeline-plumber-tools-itim2101-lineal-color-itim2101-3.png'],
  ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SelectPdf(),
          //   ),
          // );
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeAnimation(1, Padding(
                padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                child: Text(
                  '날짜와 시간을 \n정해주세요',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              FadeAnimation(1, Row(
                children: [
                  Text("2022년 8월"),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {}, 
                    icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey.shade700,),
                  )
                ],
              )),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeAnimation((1 + index) / 6, GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _days[index][0];
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _selectedDay == _days[index][0] ? Colors.blue.shade100.withOpacity(0.5) : Colors.blue.withOpacity(0),
                          border: Border.all(
                            color: _selectedDay == _days[index][0] ? Colors.blue : Colors.white.withOpacity(0),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_days[index][0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text(_days[index][1], style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ));
                  }
                ),
              ),
              SizedBox(height: 10,),
              FadeAnimation(1.2, Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                ),
                child: ScrollablePositionedList.builder(
                  itemScrollController: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _hours.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedHour = _hours[index];
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _selectedHour == _hours[index] ? Colors.orange.shade100.withOpacity(0.5) : Colors.orange.withOpacity(0),
                          border: Border.all(
                            color: _selectedHour == _hours[index] ? Colors.orange : Colors.white.withOpacity(0),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_hours[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              )),
              SizedBox(height: 40,),
              FadeAnimation(1.2, Text("작업 종류", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
              SizedBox(height: 10,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _repeat.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedRepeat = index;
                        });
                      },
                      child: FadeAnimation((1.2 + index) / 4, Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selectedRepeat == index ? Colors.blue.shade400 : Colors.grey.shade100,
                        ),
                        margin: EdgeInsets.only(right: 20),
                        child: Center(child: Text(_repeat[index], 
                          style: TextStyle(fontSize: 18, color: _selectedRepeat == index ? Colors.white : Colors.grey.shade800),)
                        ),
                      )),
                    );
                  },
                )
              ),
              SizedBox(height: 40,),
              FadeAnimation(1.4, Text("작업 준비물", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
              SizedBox(height: 10,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _exteraCleaning.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedExteraCleaning.contains(index)) {
                            _selectedExteraCleaning.remove(index);
                          } else {
                            _selectedExteraCleaning.add(index);
                          }
                        });
                      },
                      child: FadeAnimation((1.4 + index) / 4, Container(
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selectedExteraCleaning.contains(index) ? Colors.blue.shade400 : Colors.transparent,
                        ),
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(_exteraCleaning[index][1], height: 40,),
                            SizedBox(height: 10,),
                            Text(_exteraCleaning[index][0], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: _selectedExteraCleaning.contains(index) ? Colors.white : Colors.grey.shade800),),
                          ],
                        )
                      ))
                    );
                  },  
                )
              ),
            ],
          ), 
        ),
      )
    );
  }
}
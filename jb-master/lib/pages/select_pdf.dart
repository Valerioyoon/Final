import 'package:day35/animation/FadeAnimation.dart';
import 'package:day35/models/service.dart';
import 'package:day35/pages/book_mark.dart';
import 'package:day35/pages/recent_pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pdf_search.dart';
import 'pdf_viewer.dart';

class SelectPdf extends StatefulWidget {
  final List<Service> serviceList;

  const SelectPdf({Key? key, required this.serviceList}) : super(key: key);

  @override
  _SelectPdfState createState() => _SelectPdfState();
}

class _SelectPdfState extends State<SelectPdf> {
  List<String> bookMarkList = [];
  List<String> recentList = [];

  final box = GetStorage();
  int selectedIndex = 0;

  @override
  void initState() {
    if (box.read("recentList") == null) {
    } else {
      box.read("recentList").forEach((e) => recentList.add(e));
    }

    recentList = List.from(recentList.reversed);

    if (box.read("bookMarkList") == null) {
    } else {
      box.read("bookMarkList").forEach((e) => bookMarkList.add(e));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => BookMark());
              },
              icon: Icon(
                Icons.bookmark,
                color: Colors.grey.shade700,
                size: 30,
              ),
            )
          ],
          leadingWidth: 200,
          leading: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.chevron_left,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => PdfSearch());
                },
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  FadeAnimation(
                      1,
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '최근 열어본 파일 목록',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                  FadeAnimation(
                      1.2,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0, 4),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: Get.width,
                                height: 80,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: recentList.length,
                                  separatorBuilder: (context, idx) {
                                    return const SizedBox(
                                      width: 20,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Icon(Icons.description , color: Colors.lightBlueAccent,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(recentList[recentList.length-index-1])
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  await Get.to(() => RecentPdf());
                                  recentList.clear();
                                  setState(() {
                                    if (box.read("recentList") == null) {
                                    } else {
                                      box.read("recentList").forEach((e) => recentList.add(e));
                                    }

                                    recentList = List.from(recentList.reversed);
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15.0)),
                                  child: Center(
                                      child: Text(
                                        '최근 파일 목록으로 이동',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '목록',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    children: List.generate(
                        widget.serviceList.length, (index) =>
                        serviceContainer(widget.serviceList[index].imageURL, widget.serviceList[index].name, index)

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.3,
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '관련 자료를 누르시면 이동합니다.',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    children: List.generate(widget.serviceList[selectedIndex].pdfPath.length,
                            (index) => newWorkerContainer(widget.serviceList[selectedIndex].imagePath[index], widget.serviceList[selectedIndex].pdfPath[index])),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ]
            )));
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 300),
        width: 104,
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            // color: Colors.blue.withOpacity(0),
            color: selectedIndex == index ? Colors.blueAccent : Colors.grey.shade300,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset("assets/icons/${image}", height: 25),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),maxLines: 2,
          )
        ]),
      ),
    );
  }

  newWorkerContainer(String image, String pdfPath) {
    void tapBookMark(String path) {
      if (bookMarkList.contains(path)) {
        setState(() {
          bookMarkList.remove(path);
        });

        box.write("bookMarkList", bookMarkList);
      } else {
        setState(() {
          bookMarkList.add(path);
        });
        box.write("bookMarkList", bookMarkList);
      }

      print("[QWER] book mark list : ${bookMarkList.toString()}");
    }

    return GestureDetector(
      onTap: () {
        if(recentList.contains(pdfPath)){
          recentList.remove(pdfPath);
        }
        setState(() {
          recentList.add(pdfPath);
        });
        Get.to(() => PdfViewer(pdfPath: pdfPath));
      },
      child: Container(
        width: Get.width / 2 - 50,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/${image}", height: 20),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  tapBookMark(pdfPath);
                },
                child: Icon(
                  Icons.favorite,
                  color: bookMarkList.contains(pdfPath) ? Colors.redAccent : Colors.grey,
                  size: 25,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(

            pdfPath,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }

  workerContainer(String name, String job, String image, double rating) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 3.5,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(15.0), child: Image.asset("assets/icons/${image}")),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  job,
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rating.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

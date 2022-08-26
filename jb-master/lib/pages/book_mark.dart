import 'package:day35/pages/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {

  List<String> bookMarkList = [];
  final box = GetStorage();

  @override
  void initState() {
    if(box.read("bookMarkList") == null){}
    else{
      box.read("bookMarkList").forEach((e)=>bookMarkList.add(e));
    }


    super.initState();
  }

  void tapBookMark(String path){

    setState(() {
      bookMarkList.remove(path);
    });
    box.write("bookMarkList", bookMarkList);

    print("[QWER] book mark list : ${bookMarkList.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
        ],
        title: Text("북마크 목록",style: TextStyle(color: Colors.black),),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: ListView.separated(
          itemCount: bookMarkList.length,
          separatorBuilder: (context , idx){
            return Container(
              height: 2,
              color: Colors.grey,
            );
          },
          itemBuilder: (context , index){
            return InkWell(
              onTap: (){
                Get.to(()=>PdfViewer(pdfPath: "${bookMarkList[index]}"));
              },
              child: SizedBox(
                width: Get.width,
                height: 50,
                child: Row(
                  children: [
                    const SizedBox(width: 30,),
                    Text(bookMarkList[index]),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        tapBookMark(bookMarkList[index]);
                      },
                      child: Icon(Icons.bookmark , color: Colors.amber,size: 40,),
                    ),
                    const SizedBox(width: 30,),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

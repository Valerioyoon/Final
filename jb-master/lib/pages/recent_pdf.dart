import 'package:day35/pages/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RecentPdf extends StatefulWidget {
  const RecentPdf({Key? key}) : super(key: key);

  @override
  State<RecentPdf> createState() => _RecentPdfState();
}

class _RecentPdfState extends State<RecentPdf> {

  List<String> bookMarkList = [];
  List<String> recentList = [];
  final box = GetStorage();

  @override
  void initState() {

    if(box.read("recentList") == null){
    }
    else{
      box.read("recentList").forEach((e)=>recentList.add(e));
    }

    recentList = List.from(recentList.reversed);

    if(box.read("bookMarkList") == null){}
    else{
      box.read("bookMarkList").forEach((e)=>bookMarkList.add(e));
    }


    super.initState();
  }

  void tapBookMark(String path){

    if(bookMarkList.contains(path)){
      setState(() {
        bookMarkList.remove(path);
      });

      box.write("bookMarkList", bookMarkList);
    }
    else{
      setState(() {
        bookMarkList.add(path);
      });
      box.write("bookMarkList", bookMarkList);
    }

    print("[QWER] book mark list : ${bookMarkList.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                recentList.clear();
              });
              box.write("recentList", recentList);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel_outlined,
                  color: Colors.grey.shade700,
                  size: 15,
                ),
                SizedBox(width: 3,),
                Text("모두 삭제",style: TextStyle(color: Colors.black),),
                SizedBox(width: 5,),
              ],
            ),
          )
        ],
        title: Text("최근 파일 목록",style: TextStyle(color: Colors.black),),
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
            itemCount: recentList.length,
            separatorBuilder: (context , idx){
              return Container(
                height: 2,
                color: Colors.grey,
              );
            },
            itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  Get.to(()=>PdfViewer(pdfPath: "${recentList[index]}"));
                },
                child: SizedBox(
                  width: Get.width,
                  height: 50,
                  child: Row(
                    children: [
                      const SizedBox(width: 30,),
                      Text(recentList[index]),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          tapBookMark(recentList[index]);
                        },
                        child: Icon(Icons.bookmark , color: bookMarkList.contains(recentList[index])? Colors.amber : Colors.black,size: 40,),
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

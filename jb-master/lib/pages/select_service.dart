import 'package:day35/animation/FadeAnimation.dart';
import 'package:day35/models/category.dart';
import 'package:day35/models/service.dart';
import 'package:day35/pages/book_mark.dart';
import 'package:day35/pages/pdf_search.dart';
import 'package:get/get.dart';
import 'package:simple_animations/multi_tween/default_animation_properties.dart';
import '../values/services.dart';
import 'select_pdf.dart';
import 'package:day35/pages/cleaning.dart';
import 'package:flutter/material.dart';

class SelectService extends StatefulWidget {
  const SelectService({ Key? key }) : super(key: key);

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(()=>BookMark());

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
              const SizedBox(width: 15,),
              InkWell(
                onTap: (){
                  Get.to(()=>PdfSearch());
                },
                child: Icon(Icons.search,size: 30,color: Colors.black,),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        // floatingActionButton: selectedService >= 0 ? FloatingActionButton(
        //   onPressed: () {
        //
        //     List<Service>? serviceList;
        //
        //
        //
        //     switch(selectedService){
        //       case 0:
        //         serviceList = category1Services;
        //         break;
        //       case 1:
        //         serviceList = category2Services;
        //         break;
        //       case 2:
        //         serviceList = category3Services;
        //         break;
        //       default:
        //         serviceList = category1Services;
        //     }
        //
        //     Get.to(()=>SelectPdf(serviceList: serviceList!));
        //   },
        //   child: Icon(Icons.arrow_forward_ios, size: 20,),
        //   backgroundColor: Colors.blue,
        // ) : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(1.2, Padding(
                    padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
                    child: Text(
                      '어떤 서비스가\n필요 하신가요?',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ))
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 25.0,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: selectPageCategories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FadeAnimation((1.0 + index) / 4, serviceContainer(selectPageCategories[index].imagePath, selectPageCategories[index].name, index));
                        }
                    ),
                  ),
                ]
            ),
          ),
        )
    );
  }

  serviceContainer(String image, String name, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0),primary: Colors.grey.shade100,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0))),
      onPressed: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
        List<Service>? serviceList;


        switch(selectedService){
          case 0 :
            serviceList = category1Services;
            break;
          case 1:
            serviceList = category2Services;
            break;
          case 2:
            serviceList = category2Services;
            break;
          default:
            serviceList = category2Services;
        }

        Get.to(()=>SelectPdf(serviceList: serviceList!));

      },
      child :
      Container(
        // duration: Duration(milliseconds: 300),
        // padding: EdgeInsets.all(50.0),
        // decoration: BoxDecoration(
        //   color: selectedService == index ? Colors.blue.shade50 : Colors.grey.shade100,
        //   border: Border.all(
        //     color: selectedService == index ? Colors.blue : Colors.blue.withOpacity(0),
        //     width: 2.0,
        //   ),
        //   borderRadius: BorderRadius.circular(20.0),
        // ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/icons/${image}", height: 65),
              SizedBox(height: 20, width: 190,),
              Text(name, style: TextStyle(fontSize: 20, color: Colors.black),)
            ]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MaterialApp(
    home: MyButtons(

    ),
  ));
}

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeButton to PDFviewer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                //Get.to(PdfViewer(pdfName: "pdfName"));
              },
              child: Text(
                  'PDF 보기',
              style: TextStyle(fontSize: 70.0),),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.black,
              ),
            )
          ]
        ),
      ),
    );
  }
}
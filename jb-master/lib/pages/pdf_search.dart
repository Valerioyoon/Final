import 'package:day35/pages/pdf_viewer.dart';
import 'package:day35/values/pdfs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdfSearch extends StatefulWidget {
  const PdfSearch({Key? key}) : super(key: key);

  @override
  State<PdfSearch> createState() => _PdfSearchState();
}

class _PdfSearchState extends State<PdfSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24,),
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
          Text("PDF SEARCH PAGE").paddingOnly(left: 30,top: 15),
          const SizedBox(height: 15,),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return pdfList.where((String option) {
                return option.contains(textEditingValue.text);});
            },
            onSelected: (String selection) {
              Get.to(()=>PdfViewer(pdfPath: selection));
            },
            fieldViewBuilder: (context, controller,focusNode, onSubmit) {
              return TextFormField(controller: controller,focusNode: focusNode).paddingOnly(left: 30,right: 30);
            },
          ),
        ],
      ),
    );
  }
}

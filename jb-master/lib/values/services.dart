import 'package:day35/models/service.dart';

import '../models/category.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<Category> startPageCategories = [
  Category('공급시설',  "1001.png",),
  Category('사용시설',  "1002.png",),
  Category('안전공급',  "1003.png",),
  Category('안전기술',  "1004.png",),
  Category('안전솔루션',  "1005.png",),
  Category('중앙Biz',  "1006.png",),
];

List<Category> selectPageCategories = [
  Category('도시가스사업법',  "law.png",),
  Category('KGS CODE',  "kgslogo.jpg",),
  Category('규정',  "jblogo.png",),
  Category('업무절차서',  "jblogo.png",),
  Category('설명서',  "jblogo.png",),
  Category('기타',  "safety.png",),
];

List<Service> category1Services = [
  Service(
      name: '가스도매사업 공급시설',
      imageURL: "structure.png",
      pdfPath: [
        '가스도매사업 제조소 및 공급소의 기준.PDF',
        '가스도매사업 제조소 및 공급소 밖의 배관의 기준.PDF',
        '가스도매사업 제조소 및 공급소 밖의 배관의 기준.PDF'
      ],
    imagePath: [
      "document.png",
      "document.png",
      "document.png"
    ]
  ),
  Service(
      name:'공통',
      imageURL: "general.png",
      pdfPath: [
        '도시가스 안전성평가 기준.PDF',
        '도시가스공급시설 시공감리 기준.PDF',
        '도시가스 안전관리수준평가 기준.PDF',
        '도시가스 배관보호 기준.PDF',
        '가스배관시설 건전성관리 수행계획서 기준.PDF'
      ],
    imagePath: [
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png"
    ]
  ),
  Service(
      name:'사용시설',
      imageURL:"kitchen.png",
      pdfPath:[
        '도시가스 사용시설의 기준.pdf',
        '압축도시가스용 자동차 연료장치의 기준.PDF',
        '자동차용 압축천연가스 완속충전설비의 기준.PDF',
        '액화도시가스용 자동차 연료장치의 기준.PDF'
      ],
    imagePath: [
      "document.png",
      "document.png",
      "document.png",
      "document.png"
    ]
  ),
  Service(
      name:'일반도시가스사업 공급시설',
      imageURL:"structure.png",
      pdfPath: [
        '일반도시가스사업 제조소 및 공급소의 기준.PDF',
        '나프타부생가스제조사업 제조소의 기준.PDF',
        '바이오가스제조사업 제조소의 기준.PDF',
        '합성천연가스 제조사업 제조소의 기준.PDF',
        '고정식 압축도시가스자동차 충전의 기준.PDF',
        '이동식 압축도시가스자동차 충전의 기준.pdf',
        '고정식 압축도시가스이동식충천차량 충전의 기준.PDF',
        '액화도시가스자동차 충전의 기준.PDF',
        '이동식 액화도시가스 야드 트랙터 충전의 기준.PDF',
        '일반도시가스사업 제조소 및 공급소 밖의 배관의 시설 기준.PDF',
        '일반도시가스사업 정압기의 기준.PDF'
      ],
    imagePath: [
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png"
    ]
  ),

];

List<Service> category2Services = [
  Service(
      name: '공급 및 기술',
      imageURL: "work.png",
      pdfPath: [
        '고압배관 시공 업무 절차서.pdf',
        '대용량계량기 업무절차서.pdf',
        '배관시공 및 공사관리 업무 절차서.pdf',
        '분기,절단 연결작업 업무 절차서.pdf',
        '소용량계량기 업무절차서.pdf',
        '수치지도관리 업무 절차서.pdf',
        '열량계량시스템(FMS) 업무절차서.pdf',
        '원격감시장치 업무절차서.pdf',
        '인허가 업무 절차서.pdf',
        '일위대가 작성 및 공사설계 업무 절차서.pdf',
        '전기방식 업무절차서.pdf',
        '정압기 업무절차서.pdf'
      ],
    imagePath: [
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png"
    ]
  ),
  Service(
      name: '공급시설',
      imageURL: "documentsfolder.png",
      pdfPath: [
        '가스공급시설 가스공급 업무절차서.pdf',
        '굴착공사관리 업무절차서.pdf'
      ],
    imagePath: [
      "document.png",
      "document.png"
    ]
  ),
  Service(
      name: '공통',
      imageURL:"documentsfolder.png",
      pdfPath: [
        '모니터요원 관리 업무절차서.pdf',
        '배관관리 업무절차서.pdf',
        '배관망해석 업무절차서.pdf',
        '밸브관리 업무절차서.pdf',
        '사고조사 업무절차서.pdf',
        '상황실운영 업무절차서.pdf',
        '안전교육훈련 업무절차서.pdf',
        '안전수칙 업무절차서.pdf',
        '지진발생시 비상대응 업무절차서.pdf'
      ],
    imagePath: [
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png"
    ]
  ),
  Service(
      name: '사용시설',
      imageURL: "documentsfolder.png",
      pdfPath: [
        '가스사용시설 가스공급 및 퍼지 업무절차서.pdf',
        '가스사용시설 가스공급중지 업무절차서.pdf',
        '가스사용시설 세대안전점검 업무절차서.pdf',
        '가스사용시설 시공관리 업무절차서.pdf',
        '사용자공급관 검사 업무절차서.pdf',
        '안전위해시설 관리 업무절차서.pdf',
        '특정가스사용시설 안전점검 업무절차서.pdf'
      ],
    imagePath: [
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png",
      "document.png"
    ]
  ),
  Service(
      name: '도시가스사업법',
      imageURL: "documentsfolder.png",
      pdfPath: [
        '도시가스사업법.pdf',
      ],
      imagePath: [
        "document.png"
      ]
  ),
];
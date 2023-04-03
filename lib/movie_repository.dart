import 'dart:convert';

import 'package:movie/movie_dto.dart';
import 'package:http/http.dart'as http;

class dailyBoxOfficeList{
  //싱글톤 - 해당 타입의 객체가 프로그램에서 1개
  //스태틱 변수 선언
  static dailyBoxOfficeList? _instance;

  //퍼플릭 생성자 제거
  //dart에서 private은 맨 앞에 언더바를 붙인다
  dailyBoxOfficeList._();

  static int count = 0;

  static dailyBoxOfficeList get instance => _instance ??= dailyBoxOfficeList._();

  Future<List<boxOfficeResult>?> getDTOList() async {
    String url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return boxOfficeResult.fromJsonList(jsonDecode(response.body));
    } else {
      return null;
    }
  }


}

void main(){
  dailyBoxOfficeList.instance;
  dailyBoxOfficeList.instance;
  dailyBoxOfficeList.instance;
  dailyBoxOfficeList.instance;
}
//list_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie/movie_repository.dart';
import 'package:http/http.dart' as http;
import 'package:movie/movie_dto.dart';




class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //더미 데이터
    // PostDTOTalble postDTOTalble = PostDTOTalble(userId: 0, id: 0, title: "테스트 제목");

    //실제 데이터
    final listState = useState<List<boxOfficeResult>?>(null);

    useEffect((){
      dailyBoxOfficeList.instance.getDTOList().then((value){
        listState.value = value;
      });
      String url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101";

      http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          listState.value = boxOfficeResult.fromJsonList(jsonDecode(response.body));
        }});
    },[]);


    return Scaffold(
      body: SafeArea(
        child: ListView(
          children:  listState.value?.map((e) => ListItem(boxOfficeResult: e)).toList() ?? [],),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final boxOfficeResult;

  ListItem({Key? key, required this.boxOfficeResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
              child: Column(
                children: [
                  Text("유저번호 : ${boxOfficeResult.rank}" ),
                  Divider(),
                  Text("글 번호 : ${boxOfficeResult.audiCnt} "),
                  Divider(),
                  Text("글 제목 : ${boxOfficeResult.movieNm}"),
                  Divider(),
                  Text("글 제목 : ${boxOfficeResult.openDt}"),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

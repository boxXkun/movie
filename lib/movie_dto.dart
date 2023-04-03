
// ignore: camel_case_types
class boxOfficeResult{
  int rank;
  int audiCnt;
  String movieNm;
  String openDt;

  boxOfficeResult({
    required this.rank,
    required this.audiCnt,
    required this.movieNm,
    required this.openDt});

  factory boxOfficeResult.fromJson(dynamic json) => boxOfficeResult(

    audiCnt: json["audiCnt"],
    rank: json["rank"],
    movieNm: json["movieNm"],
    openDt: json["openDt"]
  );
  static List<boxOfficeResult> fromJsonList(List jsonList){
    return jsonList.map((json) => boxOfficeResult.fromJson(json)).toList();
  }
}
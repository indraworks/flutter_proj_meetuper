/*
jadi gini sumber data kit adari json kan mau dimasukan ke list utk itu kit a
convert lewat parseJSON shingga jadi object list
nah yg ini kit ambuat clasnya  supaya 
yg diparse tadi beriterasi /dimaping  dan jasilnya di kmblikan 
return ke display ,dibua t supaya lebi readalbe kodenya
*/

class Post {
  final String title;
  final String body;
  final int id;
  Post({String title, String body, int id})
      : this.title = title,
        this.body = body,
        this.id = id;

  Post.fromJSON(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        body = parsedJson['body'],
        id = parsedJson['id'];
}

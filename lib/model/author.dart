class Author{
  String name;
  String url;
  String avatar;

  Author({this.name, this.url, this.avatar});


  factory Author.fromJson(Map<String, dynamic> json){
    return Author(
      name : json['name'],
      url : json['url'],
      avatar : json['avatar'],
    );
  }


}
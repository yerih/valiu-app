


class SocialNetworkModel {
  final String? name;
  final String? key;
  final String? username;
  final String? link;

  SocialNetworkModel({this.name, this.key, this.link, this.username});



  factory SocialNetworkModel.fromMap(Map<dynamic, dynamic> map) {
    return SocialNetworkModel(
      name: map['name']?.toString() ?? '',
      key: map['key']?.toString() ?? '',
      link: map['link']?.toString() ?? '',
      username: map['username']?.toString() ?? '',
    );
  }


  static List<SocialNetworkModel> listFromJson(List<dynamic>? json) {
    return json?.map((item) => SocialNetworkModel.fromMap(item as Map<dynamic, dynamic>)).toList() ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'key': key,
      'link': link,
      'username': username,
      };
  }

  @override
  String toString() {
    return 'SocialNetworkModel{name: $name, key: $key, link: $link, username: $username}';
  }

}






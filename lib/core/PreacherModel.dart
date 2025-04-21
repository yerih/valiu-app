

class PreacherModel {
  final String name;
  final String image;
  final String bio;
  final SocialNetworks socialNetworks;

  PreacherModel({required this.name, required this.image, required this.bio, required this.socialNetworks});

  factory PreacherModel.fromMap(Map<dynamic, dynamic> map) {
    return PreacherModel(
      name: map['name']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
      bio: map['bio']?.toString() ?? '',
      socialNetworks: map['social_networks'] != null ? SocialNetworks.fromJson(map['social_networks'] as Map<Object?, Object?>) : SocialNetworks(),
    );
  }

  static List<PreacherModel> listFromJson(List<dynamic>? json) {
    return json?.map((item) => PreacherModel.fromMap(item as Map<dynamic, dynamic>)).toList() ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'bio': bio,
      'social_networks': socialNetworks,
    };
  }

  @override
  String toString() => 'PreacherModel{name: $name, image: $image, bio: $bio, socialNetworks: $socialNetworks}';

}



class SocialNetworks {
  String? fb;
  String? x;
  String? ig;
  String? yt;
  String? web;

  SocialNetworks({
    this.fb,
    this.x,
    this.ig,
    this.yt,
    this.web,
  });

  factory SocialNetworks.fromJson(Map<Object?, Object?> json) {
    return SocialNetworks(
      fb: json['fb'] as String?,
      x: json['x'] as String?,
      ig: json['ig'] as String?,
      yt: json['yt'] as String?,
      web: json['web'] as String?,
    );
  }

  @override
  String toString() {
    return '{fb: $fb, x: $x, ig: $ig, yt: $yt, web: $web}';
  }
}



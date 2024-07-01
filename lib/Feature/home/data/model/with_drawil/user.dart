class User {
  int? id;
  String? name;
  String? image;
  String? phone;
  String? power;
  dynamic bio;
  String? lat;
  String? lng;
  int? blocked;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic lastActivity;
  dynamic deviceToken;
  int? blance;
  int? withdrawn;
  dynamic fcmToken;
  String? lang;

  User({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.power,
    this.bio,
    this.lat,
    this.lng,
    this.blocked,
    this.email,
    this.emailVerifiedAt,
    this.lastActivity,
    this.deviceToken,
    this.blance,
    this.withdrawn,
    this.fcmToken,
    this.lang,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        phone: json['phone'] as String?,
        power: json['power'] as String?,
        bio: json['bio'] as dynamic,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        blocked: json['blocked'] as int?,
        email: json['email'] as dynamic,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        lastActivity: json['last_activity'] as dynamic,
        deviceToken: json['device_token'] as dynamic,
        blance: json['blance'] as int?,
        withdrawn: json['withdrawn'] as int?,
        fcmToken: json['fcm_token'] as dynamic,
        lang: json['lang'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'phone': phone,
        'power': power,
        'bio': bio,
        'lat': lat,
        'lng': lng,
        'blocked': blocked,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'last_activity': lastActivity,
        'device_token': deviceToken,
        'blance': blance,
        'withdrawn': withdrawn,
        'fcm_token': fcmToken,
        'lang': lang,
      };
}

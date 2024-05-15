class User {
  int? id;
  String? name;
  String? image;
  String? phone;
  String? power;
  dynamic bio;
  dynamic lat;
  dynamic lng;
  int? blocked;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic lastActivity;
  dynamic deviceToken;

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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        phone: json['phone'] as String?,
        power: json['power'] as String?,
        bio: json['bio'] as dynamic,
        lat: json['lat'] as dynamic,
        lng: json['lng'] as dynamic,
        blocked: json['blocked'] as int?,
        email: json['email'] as dynamic,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        lastActivity: json['last_activity'] as dynamic,
        deviceToken: json['device_token'] as dynamic,
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
      };
}

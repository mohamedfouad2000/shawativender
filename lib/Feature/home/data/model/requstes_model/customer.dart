class Customer {
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

  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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

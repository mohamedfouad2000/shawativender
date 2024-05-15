class ContactDetails {
  String? ownerName;
  String? phone;

  ContactDetails({this.ownerName, this.phone});

  factory ContactDetails.fromJson(Map<String, dynamic> json) {
    return ContactDetails(
      ownerName: json['owner_name'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'owner_name': ownerName,
        'phone': phone,
      };
}

class Reqresin {
  int? id;
  String? email, firstName, lastName, avatar;

  Reqresin({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory Reqresin.fromJson(Map<String, dynamic> json) {
    return Reqresin(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

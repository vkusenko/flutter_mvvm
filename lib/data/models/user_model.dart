class User {
  final String id;
  final String email;

  // Add other relevant user details

  User({required this.id, required this.email});

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
      );
}

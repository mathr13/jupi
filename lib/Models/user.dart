class User {
  String userName;
  String password;

  User({
    this.userName,
    this.password,

  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    userName: json["userName"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "password": password
  };
}

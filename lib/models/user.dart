class User {
  int id;
  String name;
  String email;
  List<String> socialNetWork = [];
  String description;


  User();

  User withId(int id) {
    this.id = id;
    return this;
  }

  User withName(String name) {
    this.name = name;
    return this;
  }
}
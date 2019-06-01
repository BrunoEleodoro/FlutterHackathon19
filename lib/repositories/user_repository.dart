import 'package:flutter_hackathon/models/user.dart';
import 'package:flutter_hackathon/repositories/mocks.dart';

class UserRepository {

  List<User> getAll() {
    return userMock;
  }

  User getById(int id) {
    return userMock.firstWhere((user) => user.id == id);
  }

  User getByName(String name) {
    return userMock.firstWhere((user) => user.name == name);
  }
}
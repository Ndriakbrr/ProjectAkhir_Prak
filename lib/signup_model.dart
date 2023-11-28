import 'package:hive/hive.dart';
part 'signup_model.g.dart';

@HiveType(typeId: 0)
class SignupModel extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;

  SignupModel({
    required this.username,
    required this.password,
  });
}

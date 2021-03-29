import '../app_core/api/api.dart';
import '../app_core/data_models/user_model.dart';
import 'package:get/get.dart';

class UserListModel{
  final users=<UserModel>[];
  final isUsersLoaded=false.obs;
  final isErrorExist=false.obs;
}
import 'package:get/get.dart';
import '../app_core/data_models/user_model.dart';
import '../app_core/api/api.dart';
import '../model/user_list_model.dart';

class UserListViewModel extends GetxController{
  static UserListViewModel get to =>Get.find<UserListViewModel>();
  final _userListModel=UserListModel().obs;

  List<UserModel> get users=>_userListModel.value.users;
  bool get isUsersLoaded=>_userListModel.value.isUsersLoaded.value;
  bool get isErrorExist=>_userListModel.value.isErrorExist.value;

  navigateToOtherPage({String routeName, Object arguments})=>Get.toNamed(routeName, arguments: arguments);

  fetchUsers()async{
    final dynamic result=await Api().fetchUsers();
    if(result is List<Map<String, dynamic>>){
      result.forEach((element) {
        _userListModel.value.users.add(UserModel.fromJson(element));
      });
    }else{
      _userListModel.value.isErrorExist.value=true;
    }

    _userListModel.value.isUsersLoaded.value=true;
  }

  @override
  void onInit() async{
    await fetchUsers();
    update();
    super.onInit();
  }
}
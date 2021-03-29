import 'package:flutter/material.dart';
import 'components/user_list_view_components.dart';
import '../app_core/ui/ui.dart';
import 'package:get/get.dart';
import '../viewmodel/user_list_view_model.dart';


class UserListView extends Ui with UserListViewComponents{
  const UserListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>getPage(
      title: "Flutter MVVM Sample",
      body: GetX<UserListViewModel>(
        init: UserListViewModel(),
        builder: (viewModel)=>viewModel.isUsersLoaded?(
            viewModel.isErrorExist?getErrorScreen(errorTitle: "Kullanıcılar Yüklenemedi...", errorMessage: "İnternet bağlantınızı kontrol edin.")
                :
            getPageElementsWidget(
                pageElements: List<Widget>.generate(
                    viewModel.users.length,
                        (i) => getUserBox(user: viewModel.users[i],
                        onPressed: ()=>viewModel.navigateToOtherPage(routeName: 'userDetailView', arguments:  viewModel.users[i])
                    )
                )
            )
        ):getLoadingScreen(loadingMessage: "Kullanıcılar Yükleniyor\n..."),
      )
  );
}



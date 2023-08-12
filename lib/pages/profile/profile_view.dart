import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_vm.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => const Scaffold(),
    );
  }
}

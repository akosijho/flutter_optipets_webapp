import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

class ViewClient extends ViewModelWidget<AddNewViewModel> {
  const ViewClient({super.key});

  @override
  Widget build(BuildContext context, AddNewViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fieldLabel(label: 'Username:'),
            textField(maxWidth: 180, textEditingController: viewModel.petName),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fieldLabel(label: 'Password:'),
            textField(maxWidth: 184, textEditingController: viewModel.specie),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: () {
            viewModel.applicationViewModel.firebaseAuth
                .sendPasswordResetEmail(email: viewModel.user!.email!);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(MyColors.coverColor)),
          child: const Text('Save',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}

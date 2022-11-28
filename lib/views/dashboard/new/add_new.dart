import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/pet_section.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_client/view_client.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_state.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/widgets/widgets.dart';
import 'package:flutter_optipets_webapp/views/widgets/loader.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:stacked/stacked.dart';

class AddNew extends StatelessWidget {
  AddNew({Key? key, required this.viewState, this.user}) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();
  final ViewState viewState;
  final UserObject? user;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNewViewModel>.reactive(
      viewModelBuilder: () => AddNewViewModel(state: viewState, user: user),
      onModelReady: (model) => model.init(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return model.isBusy
            ? const Loader()
            : Form(
                key: formGlobalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  fieldLabel(label: 'Owner\'s Name:'),
                                  textField(
                                      label: 'First Name',
                                      enabled: model.enabled,
                                      textEditingController: model.firstName),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  fieldLabel(label: ''),
                                  textField(
                                      label: 'Middle Name',
                                      enabled: model.enabled,
                                      textEditingController:
                                          model.middleName),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  fieldLabel(label: ''),
                                  textField(
                                      label: 'Last Name',
                                      enabled: model.enabled,
                                      textEditingController: model.lastName),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  fieldLabel(label: 'Address:'),
                                  textField(
                                      label: 'Address',
                                      lines: 3,
                                      enabled: model.enabled,
                                      textEditingController: model.address),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  fieldLabel(label: 'Contact nos:'),
                                  textField(
                                      label: 'Contact nos',
                                      enabled: model.enabled,
                                      textEditingController: model.contacts),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  fieldLabel(label: 'Email:'),
                                  textField(
                                      label: 'Preferrably gmail',
                                      enabled: model.enabled,
                                      textEditingController: model.email),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              if (model.state == ViewState.newClient)
                                const PetSection(),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          if (model.state == ViewState.newClient)
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    model.clear();
                                    formGlobalKey.currentState!.reset();
                                  },
                                  child: const Text(
                                    'Clear',
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      switch (model.state) {
                                        case ViewState.newClient:
                                          model.addNew(
                                              model.firstName.text,
                                              model.middleName.text,
                                              model.lastName.text,
                                              model.address.text,
                                              model.contacts.text,
                                              model.email.text,
                                              model.petName.text,
                                              model.specie.text,
                                              model.breed.text,
                                              model.color.text,
                                              model.birthDay.text,
                                              model.sex!);
                                          break;
                                        case ViewState.viewClient:
                                          // TODO: Handle this case.
                                          break;
                                        case ViewState.newPet:
                                          // TODO: Handle this case.
                                          break;
                                      }
                                    } else {
                                      showSnackbar(
                                          title: 'Oops',
                                          message: 'Check for empty fields',
                                          maxWidth: 400);
                                    }
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(
                                              MyColors.coverColor)),
                                  child: model.isBusy
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text('Save',
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                ),
                              ],
                            ),
                          if (model.state == ViewState.viewClient)
                            ElevatedButton(
                              onPressed: () async {
                                await model.sendPasswordResetEmail(
                                    model.user!.email!);
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      MyColors.coverColor)),
                              child: const Text('Send Password Reset Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                        ],
                      ),
                      if (model.state == ViewState.viewClient)
                        const ViewClient()
                    ]),
              );
      },
    );
  }
}

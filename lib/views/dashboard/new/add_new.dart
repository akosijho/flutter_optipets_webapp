import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/clients_view.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/pet_section.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_client/client_pets.dart';
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
    bool hasData = true;
    return ViewModelBuilder<AddNewViewModel>.reactive(
      viewModelBuilder: () => AddNewViewModel(state: viewState, user: user),
      onModelReady: (model) => model.init(),
      disposeViewModel: false,
      builder: (context, model, child) {
        model.state = viewState;
        model.changeState();
        return model.isBusy
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Loader())
            : Form(
                key: formGlobalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment:
                            MediaQuery.of(context).size.width < 1366
                                ? MainAxisAlignment.spaceEvenly
                                : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //
                          if (model.state == ViewState.viewClient)
                            const ViewClient(),
                          const SizedBox(
                            width: 32,
                          ),
                          //

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.4), //color of shadow
                                  blurRadius: 8, // blur radius
                                  offset: const Offset(2, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        fieldLabel(
                                            label: model.state ==
                                                        ViewState.newClient ||
                                                    model.state ==
                                                        ViewState.newPet
                                                ? 'Owner\'s Name:'
                                                : 'Name:'),
                                        textField(
                                            label: 'First Name',
                                            enabled: model.enabled,
                                            textEditingController:
                                                model.firstName),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        fieldLabel(label: ''),
                                        textField(
                                            label: 'Last Name',
                                            enabled: model.enabled,
                                            textEditingController:
                                                model.lastName),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        fieldLabel(label: 'Address:'),
                                        textField(
                                            label: 'Address',
                                            lines: 3,
                                            enabled: model.enabled,
                                            textEditingController:
                                                model.address),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        fieldLabel(label: 'Contact nos:'),
                                        textField(
                                            label: 'Contact nos',
                                            enabled: model.enabled,
                                            textEditingController:
                                                model.contacts),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    if (model.state == ViewState.newClient ||
                                        model.state == ViewState.newPet)
                                      const PetSection(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                if (model.state == ViewState.newClient)
                                  actions(model.state, model),
                                if (model.state == ViewState.newStaff)
                                  actions(model.state, model),
                                if (model.state == ViewState.newPet)
                                  actions(model.state, model),
                                if (model.state == ViewState.viewClient)
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          model.homeViewModel.addNew(
                                              ViewState.newPet,
                                              user: model.user);
                                        },
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    MyColors.coverColor)),
                                        child: const Text('Add A Pet',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await model.sendPasswordResetEmail(
                                              model.user!.email!);
                                        },
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    MyColors.coverColor)),
                                        child: const Text(
                                            'Send Password Reset Email',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 16,
                    ),
                    // pets list of shown client
                    if (model.state == ViewState.viewClient)
                      Container(
                        width: 1366,
                        decoration: BoxDecoration(
                          color: hasData ? Colors.transparent : Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.4), //color of shadow
                              blurRadius: 8, // blur radius
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: StreamBuilder<List<PetObject>>(
                          stream: petRef
                              .where('owner', isEqualTo: model.user!.uid)
                              .snapshots()
                              .map((event) => event.docs
                                  .map((e) => PetObject.fromJson(e.data()))
                                  .toList()),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text(
                                'Something went wrong',
                              ));
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data!.isNotEmpty) {
                                hasData = true;
                                return PaginatedDataTable(
                                  sortColumnIndex: 0,
                                  headingRowHeight: 32,
                                  dataRowHeight: 24,
                                  showCheckboxColumn: false,
                                  showFirstLastButtons: true,
                                  columns: [
                                    DataColumn(
                                      label: ClientsView.header('Name'),
                                    ),
                                    DataColumn(
                                        label: ClientsView.header('Breed')),
                                    DataColumn(
                                        label: ClientsView.header('Weight')),
                                    DataColumn(
                                        label: ClientsView.header('Sex')),
                                    DataColumn(
                                        label: ClientsView.header('Birthday')),
                                    DataColumn(
                                        label: ClientsView.header('Added On')),
                                  ],
                                  source: ClientPets(pets: snapshot.data!),
                                  rowsPerPage: snapshot.data!.length <= 20 &&
                                          snapshot.data!.isNotEmpty
                                      ? snapshot.data!.length
                                      : snapshot.data!.isEmpty
                                          ? 1
                                          : 20,
                                );
                              } else {
                                hasData = false;
                                return const Align(
                                  child: Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: Text('Haven\'t added any pets yet.'),
                                  ),
                                );
                              }
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: const Center(child: Loader()));
                            }
                            return Container();
                          },
                        ),
                      )
                  ],
                ),
              );
      },
    );
  }

  Widget actions(ViewState state, AddNewViewModel model) {
    return Row(
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
            if (formGlobalKey.currentState!.validate()) {
              if (model.state == ViewState.newClient) {
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
                    model.weight.text,
                    model.birthDay.text,
                    model.sex!);
              }
              if (model.state == ViewState.newStaff) {
                model.newStaff(
                  model.firstName.text,
                  model.middleName.text,
                  model.lastName.text,
                  model.address.text,
                  model.contacts.text,
                  model.email.text,
                );
              }
              if (model.state == ViewState.newPet) {
                model.addPet(
                  model.user!,
                  model.petName.text,
                  model.specie.text,
                  model.breed.text,
                  model.color.text,
                  model.weight.text,
                  model.birthDay.text,
                  model.sex!,
                );
              }
            } else {
              showSnackbar(
                  title: 'Oops',
                  message: 'Check for empty fields',
                  maxWidth: 400);
            }
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(MyColors.coverColor)),
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
    );
  }
}

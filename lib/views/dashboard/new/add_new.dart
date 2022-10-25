import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:stacked/stacked.dart';

class AddNew extends StatelessWidget {
 AddNew({Key? key}) : super(key: key);

  final thisLabelStyle = const TextStyle(fontSize: 12);
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNewViewModel>.reactive(
      viewModelBuilder: () => AddNewViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return Form(
          key: formGlobalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                                  textEditingController: model.middleName),
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
                                  textEditingController: model.contacts),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      fieldLabel(
                                          label: 'Pet\'s Name:',
                                          fieldWidth: 80),
                                      textField(
                                          label: 'Pet\'s Name',
                                          maxWidth: 160,
                                          textEditingController: model.petName),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      fieldLabel(
                                          label: 'Specie:', fieldWidth: 48),
                                      textField(
                                          label: 'Specie',
                                          maxWidth: 200,
                                          textEditingController: model.specie),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      fieldLabel(
                                          label: 'Breed:', fieldWidth: 80),
                                      textField(
                                          label: 'Breed',
                                          maxWidth: 160,
                                          textEditingController: model.breed),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      fieldLabel(
                                          label: 'Color:', fieldWidth: 48),
                                      textField(
                                          label: 'Color',
                                          maxWidth: 200,
                                          textEditingController: model.color),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      fieldLabel(
                                          label: 'Birthday:', fieldWidth: 80),
                                      textField(
                                          label: 'mm/dd/yyyy',
                                          textEditingController: model.birthDay,
                                          maxWidth: 160,
                                          function: model.pickDate),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      fieldLabel(label: 'Sex:', fieldWidth: 48),
                                      Row(
                                        children: [
                                          Radio(
                                              groupValue: model.sex,
                                              value: 'Male',
                                              onChanged:
                                                  model.radioValueChanges),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'Male',
                                            style: thisLabelStyle,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              groupValue: model.sex,
                                              value: 'Female',
                                              onChanged:
                                                  model.radioValueChanges),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'Female',
                                            style: thisLabelStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Clear',
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              formGlobalKey
                                      .currentState!
                                      .validate()
                                  ? model.addNew(
                                      model.firstName.text,
                                      model.middleName.text,
                                      model.lastName.text,
                                      model.address.text,
                                      model.contacts.text,
                                      model.petName.text,
                                      model.specie.text,
                                      model.breed.text,
                                      model.color.text,
                                      model.birthDay.text,
                                      model.sex!)
                                  : showSnackbar(
                                      title: 'Oops',
                                      message: 'Check for empt fields',
                                      maxWidth: 400);
                            },
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
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
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }

  Widget fieldLabel({required String label, double fieldWidth = 104}) {
    return Container(
        width: fieldWidth,
        padding: const EdgeInsets.only(top: 4),
        child: Text(label, style: thisLabelStyle));
  }

  TextFormField textField(
      {required String label,
      bool? enabled,
      int lines = 1,
      TextEditingController? textEditingController,
      double maxWidth = 400,
      dynamic function}) {
    return TextFormField(
      controller: textEditingController,
      enabled: enabled,
      maxLines: lines,
      style: thisLabelStyle,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        // isCollapsed: true,
        hintText: label,
        constraints: BoxConstraints(maxWidth: maxWidth),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        errorStyle: const TextStyle(
          fontSize: 10,
        ),
      ),
      validator: (val) => val!.isEmpty ? 'Do not leave this empty' : null,
      onTap: function,
    );
  }
}

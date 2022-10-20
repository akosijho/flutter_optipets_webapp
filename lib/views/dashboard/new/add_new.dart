import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';
import 'package:stacked/stacked.dart';

class AddNew extends StatelessWidget {
  const AddNew({Key? key}) : super(key: key);

  final thisLabelStyle = const TextStyle(fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNewViewModel>.reactive(
      viewModelBuilder: () => AddNewViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return Form(
          key: model.applicationViewModel.formGlobalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        textField(label: 'Owner\'s Name'),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldLabel(label: 'Address:'),
                        textField(label: 'Address', lines: 3),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldLabel(label: 'Contact nos:'),
                        textField(label: 'Contact nos'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldLabel(
                                    label: 'Pet\'s Name:', fieldWidth: 80),
                                textField(label: 'Pet\'s Name', maxWidth: 160),
                              ],
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldLabel(label: 'Specie:', fieldWidth: 48),
                                textField(label: 'Specie', maxWidth: 200),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldLabel(label: 'Breed:', fieldWidth: 80),
                                textField(label: 'Breed', maxWidth: 160),
                              ],
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldLabel(label: 'Color:', fieldWidth: 48),
                                textField(label: 'Color', maxWidth: 200),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldLabel(label: 'Birthday:', fieldWidth: 80),
                                textField(
                                  label: 'mm/dd/yyyy',
                                  textEditingController: model.birthDay,
                                  maxWidth: 160,
                                  function: model.pickDate
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldLabel(label: 'Sex:', fieldWidth: 48),
                                Row(
                                  children: [
                                    Radio(
                                        groupValue: model.sex,
                                        value: 'Male',
                                        onChanged: model.radioValueChanges),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text('Male',
                                    style: thisLabelStyle,),
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
                                        onChanged: model.radioValueChanges),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text('Female',
                                    style: thisLabelStyle,),
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
              ],
            ),
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

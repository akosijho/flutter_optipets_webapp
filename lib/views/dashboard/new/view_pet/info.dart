import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_pet/view_pet_veiw_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class Info extends ViewModelWidget<ViewPetViewModel>{
  const Info({super.key});

  @override
  Widget build(BuildContext context, ViewPetViewModel viewModel) {
    return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.4), //color of shadow
                                      blurRadius: 8, // blur radius
                                      offset: const Offset(2, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                fieldLabel(
                                                    label: 'Owner\'s Name:'),
                                                textField(
                                                    label: 'First Name',
                                                    enabled: viewModel.enabled,
                                                    textEditingController:
                                                        viewModel.firstName),
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
                                                    enabled: viewModel.enabled,
                                                    textEditingController:
                                                        viewModel.middleName),
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
                                                    enabled: viewModel.enabled,
                                                    textEditingController:
                                                        viewModel.lastName),
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
                                                    enabled: viewModel.enabled,
                                                    textEditingController:
                                                        viewModel.address),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                fieldLabel(
                                                    label: 'Contact nos:'),
                                                textField(
                                                    label: 'Contact nos',
                                                    enabled: viewModel.enabled,
                                                    textEditingController:
                                                        viewModel.contacts),
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
                                                    enabled: viewModel.enabled,
                                                    textEditingController:
                                                        viewModel.email),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.end,
                                            //   children: [
                                            //     Align(
                                            //       alignment: Alignment.centerRight,
                                            //       child: ElevatedButton(
                                            //         onPressed: () {
                                            //           viewModel.homeViewModel.addNew(
                                            //               ViewState.newPet,
                                            //               user: viewModel.user);
                                            //         },
                                            //         style: const ButtonStyle(
                                            //             backgroundColor:
                                            //                 MaterialStatePropertyAll(
                                            //                     MyColors.coverColor)),
                                            //         child: const Text('Add A Pet',
                                            //             style: TextStyle(
                                            //               color: Colors.white,
                                            //             )),
                                            //       ),
                                            //     ),
                                            //     const SizedBox(
                                            //       width: 24,
                                            //     ),
                                            //     Align(
                                            //       alignment: Alignment.centerRight,
                                            //       child: ElevatedButton(
                                            //         onPressed: () async {
                                            //           await viewModel.firebaseAuth
                                            //               .sendPasswordResetEmail(
                                            //                   viewModel.user!.email!);
                                            //         },
                                            //         style: const ButtonStyle(
                                            //             backgroundColor:
                                            //                 MaterialStatePropertyAll(
                                            //                     MyColors.coverColor)),
                                            //         child: const Text(
                                            //             'Send Password Reset Email',
                                            //             style: TextStyle(
                                            //               color: Colors.white,
                                            //             )),
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        fieldLabel(
                                                            label:
                                                                'Pet\'s Name:',
                                                            fieldWidth: 80),
                                                        textField(
                                                            label:
                                                                'Pet\'s Name',
                                                            maxWidth: 160,
                                                            textEditingController:
                                                                viewModel.petName),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 16,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        fieldLabel(
                                                            label: 'Specie:',
                                                            fieldWidth: 48),
                                                        textField(
                                                            label: 'Specie',
                                                            maxWidth: 184,
                                                            textEditingController:
                                                                viewModel.specie),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        fieldLabel(
                                                            label: 'Breed:',
                                                            fieldWidth: 80),
                                                        textField(
                                                            label: 'Breed',
                                                            maxWidth: 160,
                                                            textEditingController:
                                                                viewModel.breed),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 16,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        fieldLabel(
                                                            label: 'Color:',
                                                            fieldWidth: 48),
                                                        textField(
                                                            label: 'Color',
                                                            maxWidth: 184,
                                                            textEditingController:
                                                                viewModel.color),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        fieldLabel(
                                                            label: 'Birthday:',
                                                            fieldWidth: 80),
                                                        textField(
                                                            label: DateFormat(
                                                                    'MMM dd, yyyy')
                                                                .format(
                                                                    DateTime
                                                                        .now()),
                                                            textEditingController:
                                                                viewModel.birthDay,
                                                            maxWidth: 160,
                                                            function:
                                                                viewModel.pickDate),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 16,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        fieldLabel(
                                                            label: 'Sex:',
                                                            fieldWidth: 48),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                groupValue:
                                                                    viewModel.sex,
                                                                value: 'Male',
                                                                onChanged: viewModel
                                                                    .radioValueChanges),
                                                            const SizedBox(
                                                              width: 2,
                                                            ),
                                                            const Text(
                                                              'Male',
                                                              style:
                                                                  thisLabelStyle,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 16,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                groupValue:
                                                                    viewModel.sex,
                                                                value: 'Female',
                                                                onChanged: viewModel
                                                                    .radioValueChanges),
                                                            const SizedBox(
                                                              width: 2,
                                                            ),
                                                            const Text(
                                                              'Female',
                                                              style:
                                                                  thisLabelStyle,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    fieldLabel(
                                                        label: 'Weight:',
                                                        fieldWidth: 80),
                                                    textField(
                                                        label: 'Weight in kg',
                                                        maxWidth: 160,
                                                        textEditingController:
                                                            viewModel.weight),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 24,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    fieldLabel(label: 'Notes:'),
                                                    textField(
                                                        lines: 5,
                                                        enabled: viewModel.enabled,
                                                        textEditingController:
                                                            viewModel.notes),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        // actions(viewModel),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              );
  }
  
}
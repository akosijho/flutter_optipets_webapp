import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_pet/view_pet_veiw_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/widgets/widgets.dart';
import 'package:flutter_optipets_webapp/views/widgets/loader.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';

class ViewPet extends StatelessWidget {
  ViewPet({super.key, this.pet});

  final formGlobalKey = GlobalKey<FormState>();

  final ScrollController scrollController = ScrollController();
  final ScrollController verticalcrollController = ScrollController();
  final PetObject? pet;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewPetViewModel>.reactive(
        viewModelBuilder: () => ViewPetViewModel(pet: pet),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          return model.isBusy
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Loader())
              : Form(
                  key: formGlobalKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: maxWidth,
                        height: maxHeight,
                        child: Row(
                            mainAxisAlignment:
                                MediaQuery.of(context).size.width < 1366
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // start pics
                              Column(
                                children: [
                                  // start client profile
                                  Container(
                                    width: 400,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(24)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.4), //color of shadow
                                          blurRadius: 8, // blur radius
                                          offset: const Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Container(
                                              height: 160,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.primaries[Random()
                                                    .nextInt(Colors
                                                        .primaries.length)],
                                              ),
                                              child: model.user!.displayImage ==
                                                      null
                                                  ? Center(
                                                      child: Text(
                                                          model.user!
                                                              .firstName![0],
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 120,
                                                            color: Colors.white,
                                                          )),
                                                    )
                                                  : ImageNetwork(
                                                      image: model
                                                          .user!.displayImage!,
                                                      imageCache:
                                                          CachedNetworkImageProvider(
                                                              model.userObject!
                                                                  .displayImage!),
                                                      height: 160,
                                                      width: 160,
                                                      duration: 1500,
                                                      curve: Curves.easeIn,
                                                      onPointer: true,
                                                      debugPrint: false,
                                                      fullScreen: false,
                                                      fitAndroidIos:
                                                          BoxFit.cover,
                                                      fitWeb: BoxFitWeb.cover,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70),
                                                      onError: Text(
                                                          model.user!
                                                              .firstName![0],
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                          )),
                                                    )),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                            'Pets:    ${model.user!.pets == null ? 'None' : model.user!.pets!.toString()}'),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                            'Registered On:   ${model.user!.createdAt!}'),
                                      ],
                                    ),
                                  ),
                                  // end client profile
                                  const SizedBox(height: 16),
                                  // start pet profile
                                  Container(
                                    width: 400,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(24)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.4), //color of shadow
                                          blurRadius: 8, // blur radius
                                          offset: const Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Container(
                                              height: 160,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.primaries[Random()
                                                    .nextInt(Colors
                                                        .primaries.length)],
                                              ),
                                              child: model.pet!.displayImage ==
                                                      null
                                                  ? Center(
                                                      child: Text(
                                                          model.pet!.name![0],
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 120,
                                                            color: Colors.white,
                                                          )),
                                                    )
                                                  : ImageNetwork(
                                                      image: model
                                                          .pet!.displayImage!,
                                                      imageCache:
                                                          CachedNetworkImageProvider(
                                                              model.pet!
                                                                  .displayImage!),
                                                      height: 160,
                                                      width: 160,
                                                      duration: 1500,
                                                      curve: Curves.easeIn,
                                                      onPointer: true,
                                                      debugPrint: false,
                                                      fullScreen: false,
                                                      fitAndroidIos:
                                                          BoxFit.cover,
                                                      fitWeb: BoxFitWeb.cover,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70),
                                                      onError: Text(
                                                          model.pet!.name![0],
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                          )),
                                                    )),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                            'Registered On:   ${model.pet!.createdAt!}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              // end pics
                              Container(
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
                                                fieldLabel(
                                                    label: 'Contact nos:'),
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
                                                    textEditingController:
                                                        model.email),
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
                                            //           model.homeViewModel.addNew(
                                            //               ViewState.newPet,
                                            //               user: model.user);
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
                                            //           await model.firebaseAuth
                                            //               .sendPasswordResetEmail(
                                            //                   model.user!.email!);
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
                                                                model.petName),
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
                                                                model.specie),
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
                                                                model.breed),
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
                                                                model.color),
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
                                                                model.birthDay,
                                                            maxWidth: 160,
                                                            function:
                                                                model.pickDate),
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
                                                                    model.sex,
                                                                value: 'Male',
                                                                onChanged: model
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
                                                                    model.sex,
                                                                value: 'Female',
                                                                onChanged: model
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
                                                            model.weight),
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
                                                        enabled: model.enabled,
                                                        textEditingController:
                                                            model.notes),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        // actions(model),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                );
        });
  }

  Widget actions(ViewPetViewModel model) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // model.clear();
            // formGlobalKey.currentState!.reset();
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

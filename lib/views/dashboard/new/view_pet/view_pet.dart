import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_pet/info.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_pet/pet_owner_profile.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_pet/view_pet_veiw_model.dart';
import 'package:flutter_optipets_webapp/views/widgets/loader.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
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
                            children: const [
                              // start pics
                              PetOwnerProfile(),
                              SizedBox(
                                width: 16,
                              ),
                              // end pics
                              Info(),
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

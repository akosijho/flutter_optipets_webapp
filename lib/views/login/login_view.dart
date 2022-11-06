import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/utils/input_validation_mixin.dart';
import 'package:flutter_optipets_webapp/views/login/login_view_model.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget with InputValidationMixin {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      disposeViewModel: false,
      builder: (BuildContext context, LoginViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white38,
          body: Center(
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              controller: model.scrollController,
              child: SingleChildScrollView(
                controller: model.scrollController,
                primary: false,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  scrollDirection: Axis.vertical,
                  child: Container(
                      width: 496,
                      height: 624,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(255, 154, 154, 151),
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.4), //color of shadow
                            // spreadRadius: 5, //spread radius
                            blurRadius: 4, // blur radius
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Form(
                          key: model.applicationViewModel.formGlobalKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/assets/images/app_icon.png',
                                  scale: 6),
                              Text(
                                'optipets | Management',
                                style: TextStyle(
                                  fontSize: Theme.of(getContext)
                                      .textTheme
                                      .headline3!
                                      .fontSize,
                                ),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              Text(
                                "Signin",
                                style: TextStyle(
                                  fontSize: Theme.of(getContext)
                                      .textTheme
                                      .bodyText2!
                                      .fontSize,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text('Username'),
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.person),
                                ),
                                onChanged: (val) => model.email = val,
                                validator: (val) => val!.isNotEmpty
                                    ? null
                                    : 'Enter a valid email address',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                obscureText: model.isObscure,
                                decoration: InputDecoration(
                                  label: const Text('Password'),
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      onPressed: () => model.isFieldObscure(),
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                      )),
                                ),
                                onChanged: (val) => model.password = val,
                                validator: (val) => isPasswordValid(val!)
                                    ? null
                                    : 'Password must contain least 6 characters',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xff00BBF0),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (model.applicationViewModel
                                              .formGlobalKey.currentState!
                                              .validate() &&
                                          isNotEmpty(model.email) &&
                                          isNotEmpty(model.password)) {
                                        model.signIn(
                                            model.email, model.password);
                                      } else {
                                        showSnackbar(
                                            title: 'Oops',
                                            message: 'Some fields are empty!',
                                            maxWidth: 480);
                                      }
                                    },
                                    child: model.isBusy
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .fontSize,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                          )),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

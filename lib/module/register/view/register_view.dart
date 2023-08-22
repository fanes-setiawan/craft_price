import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import '../../../utils/theme/my_colors.dart';
import '../../../utils/widget/text_form.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/card.png",
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(LoginView());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormText(
                hintText: "Name",
                obscureText: false,
                onPressed: (value) {
                  controller.name = value;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormText(
                hintText: "Email",
                obscureText: false,
                onPressed: (value) {
                  controller.email = value;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormText(
                hintText: "Password",
                obscureText: controller.obscureState,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.visibilitySt();
                  },
                  icon: Icon(
                    controller.obscureState
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
                onPressed: (value) {
                  controller.password = value;
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 72,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myGreen,
                  ),
                  onPressed: () {
                    controller.doRegEmail();
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}

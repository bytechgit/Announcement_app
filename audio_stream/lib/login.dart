import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
//  UserAuthentication ua = UserAuthentication();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showPassword = true;
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  get ua => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/backgroundLogin.png"),
              fit: BoxFit.cover),
        ),
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   'images/login.png',
                      //   height: 300,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('LOGIN',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 50, color: Colors.white)),
                        ),
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: usernamecontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Username',
                                  prefixIcon: Icon(Icons.people),
                                ),
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                        errorText: "Enter username"),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: TextFormField(
                                controller: passwordcontroller,
                                obscureText: showPassword,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () => {
                                            setState(
                                              () => {
                                                showPassword = !showPassword,
                                              },
                                            )
                                          },
                                      icon: const Icon(Icons.remove_red_eye)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Password",
                                  prefixIcon: const Icon(Icons.lock),
                                ),
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                        errorText: "Enter password"),
                                    MinLengthValidator(6,
                                        errorText:
                                            "Password must have at least 8 characters"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 2, 83, 154),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () async {
                            if (formkey.currentState?.validate() == true) {
                              // String result = await ua.Login(
                              //     username: usernamecontroller.text,
                              //     password: passwordcontroller.text);

                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text(result)));
                            }
                          },
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Login",
                                style: GoogleFonts.openSans(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class changeUser extends StatefulWidget {
  const changeUser({Key? key}) : super(key: key);

  @override
  State<changeUser> createState() => _changeUserState();
}

class _changeUserState extends State<changeUser> {
  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late TextEditingController tagcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text('Change user',
                  style: GoogleFonts.ubuntu(
                    fontSize: 35,
                  )),
            ),
          ),
          Image.asset(
            'images/addUser.png',
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Form(
                key: formkey,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                          decoration: InputDecoration(
                        labelText: "Username",
                        floatingLabelStyle:
                            TextStyle(color: Color.fromARGB(255, 2, 83, 154)),
                        prefixIcon: Icon(Icons.people),
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontSize: 17, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 83, 154)),
                        ), //label style
                      )),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextField(
                            decoration: InputDecoration(
                          labelText: "Password",
                          floatingLabelStyle:
                              TextStyle(color: Color.fromARGB(255, 2, 83, 154)),
                          prefixIcon: Icon(Icons.lock),
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          labelStyle:
                              TextStyle(fontSize: 17, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 2, 83, 154)),
                          ),
                        ))),
                  ],
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Color.fromARGB(255, 2, 83, 154),
                    label: const Text(
                      'nesto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Color.fromARGB(255, 2, 83, 154),
                    label: const Text(
                      'nesto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Color.fromARGB(255, 2, 83, 154),
                    label: const Text(
                      'nesto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Color.fromARGB(255, 2, 83, 154),
                    label: const Text(
                      'nesto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: Color.fromARGB(255, 2, 83, 154),
                    label: const Text(
                      'nesto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextField(
                controller: tagcontroller,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(
                  suffixIcon: tagcontroller.text.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 2, 83, 154),
                          ),
                          onPressed: () {
                            setState(() {});
                          }),

                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(15),
                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),

                  hintText: 'Add Tag',
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 2, 83, 154),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Change user',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
          ),
          Text(
            'or',
            style: GoogleFonts.ubuntu(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 2, 83, 154),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Delete user',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
          ),
        ]),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final lista = [
    'aaaaaa',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb'
  ];
  late TextEditingController tagcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('New user',
                      style: GoogleFonts.ubuntu(
                        fontSize: 35,
                      )),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'images/addUser.png',
                width: MediaQuery.of(context).size.width * 0.85,
              ),
            ),
            // Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Form(
                  key: formkey,
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                              decoration: InputDecoration(
                            labelText: "Username",
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 2, 83, 154)),
                            prefixIcon: Icon(Icons.people),
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            labelStyle:
                                TextStyle(fontSize: 17, color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 2, 83, 154)),
                            ), //label style
                          )),
                        ),
                      ),
                      SizedBox(
                          height: 50,
                          child: TextField(
                              decoration: InputDecoration(
                            labelText: "Password",
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 2, 83, 154)),
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
              child: Wrap(
                children: lista
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          backgroundColor:
                              const Color.fromARGB(255, 2, 83, 154),
                          labelStyle: const TextStyle(color: Colors.white),
                          deleteIcon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                          onDeleted: () {
                            setState(() {
                              lista.remove(e);
                            });
                          },
                          label: Text(
                            e,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: SizedBox(
                width: double.infinity,
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
                              setState(() {
                                lista.add(tagcontroller.text);
                                tagcontroller.text = '';
                              });
                            }),

                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.all(15),
                    // border: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                    ),

                    hintText: 'Add User',
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 2, 83, 154),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Add user',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}

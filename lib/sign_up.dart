import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confrim_password = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 240, 237, 237),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.blueGrey,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 240, 237, 237),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    height: screenSize.height * 0.3,
                    width: screenSize.width,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    child: Image.asset(
                      'assets/Logo_.png',
                      width: screenSize.width * 0.8,
                      height: screenSize.width * 0.3,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height * 0.8,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 202, 201, 200),
                          Color.fromARGB(255, 230, 226, 226)
                        ])),
                    margin: EdgeInsets.only(
                      right: 15,
                      left: 15,
                      // bottom: 150,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 97, 97, 97)),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(0),
                            margin:
                                EdgeInsets.only(right: 10, left: 10, top: 0),
                            child: TextField(
                              controller: name,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 97, 97)),
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: "Enter Your Name",
                                  suffixIcon: Icon(
                                    Icons.info,
                                    color: Colors.black,
                                  )),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Phone",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 97, 97, 97)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(right: 10, left: 10, top: 0),
                          child: TextField(
                            controller: phone,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97)),
                            textAlign: TextAlign.start,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: "Enter Your Phone No",
                                suffixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 97, 97, 97)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(right: 10, left: 10, top: 0),
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97)),
                            textAlign: TextAlign.start,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: "Enter Your Password",
                                suffixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Confirm Password",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 97, 97, 97)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(right: 10, left: 10, top: 0),
                          child: TextField(
                            controller: confrim_password,
                            obscureText: true,
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97)),
                            textAlign: TextAlign.start,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: "Enter Your Password",
                                suffixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "or continue with",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 45,
                  left: 45,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SocialLoginButton(
                              buttonType: SocialLoginButtonType.google,
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SocialLoginButton(
                              buttonType: SocialLoginButtonType.facebook,
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SocialLoginButton(
                              buttonType: SocialLoginButtonType.twitter,
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

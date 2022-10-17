import 'package:cat_ecommerce_app/global/constance/AppImages.dart';
import 'package:cat_ecommerce_app/modules/login/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../global/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    print('all height = $height');
    print('all width = $width');
    print(('widget height = ${height * 0.15}'));
    print(('widget width = ${width * 0.21}'));

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                width: width * 0.8,
                height: height * 0.23,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xff707070),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: width * 0.21, //80
                      height: height * 0.1, //78
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              AppImages.profile,
                            ),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0xff707070),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'User Name',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      'example@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 7.0,
                    ),
                    CustomButton(
                      buttonOnPressed: () {},
                      buttonText: 'Edit',
                      buttonWidth: width * 0.3,
                      icon: Icons.edit,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: width * 0.8, //302
                height: height * 0.2, //138
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Accounts',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.15, //114
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0xff707070),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Wrap(
                                  spacing: 10,
                                  children: const [
                                    Icon(
                                      Icons.phone,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        3,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        "01152655982",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  spacing: 10,
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        3,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        "Mansoura , Egypt ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  spacing: 10,
                                  children: const [
                                    Icon(
                                      Icons.email,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        3,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        "example@gmail.com",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: width * 0.8, //302
                height: height * 0.2, //138
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Properties',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.15, //114
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0xff707070),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Turn on/off all notifications',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Switch.adaptive(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Turn on/off light/dark mode',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Switch.adaptive(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButton(
                buttonOnPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                buttonText: 'LOG OUT',
                icon: Icons.logout,
                buttonWidth: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  var subscription;
  @override
  void initState() {
    super.initState();
    subscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

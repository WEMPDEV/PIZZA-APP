import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/components/my_button.dart';
import 'package:pizza_app/components/my_textfield.dart';
import 'package:pizza_app/services/auth/auth_service.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  Future<void> _login() async {
    /*
    * fill out login authentication here
   */
    // get instance of auth service
    final _authService = AuthService();
    // try sign in
    try{
      await _authService.signInWithEmailPassowrd(emailController.text, passwordController.text);
    } catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(e.toString()),
      ));
    }

    // forgot password
    void forgotPas(){
      showDialog(context: context, builder: (context)=>AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("User forgot password"),
      ));
    }

    // // navigator to home page
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context)=> HomePage()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(Icons.lock_open_rounded,
            size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25,),
            // message logo slogan
            Text('Food Delivery App',style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16
            ),),

            const SizedBox(height: 25,),

            // email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextfield(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
            ),

            const SizedBox(height: 25,),

            // passwor textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextfield(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
              ),
            ),
            
            const SizedBox(height: 25,),
            // sign in button
            MyButton(
                text: 'Sign In',onTap: (){
                  _login();
                  },
            ),
            const SizedBox(height: 25,),

            // not a memeber register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a memeber",style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register Now",style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

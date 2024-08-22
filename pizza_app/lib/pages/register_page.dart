import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/components/my_button.dart';
import 'package:pizza_app/components/my_textfield.dart';
import 'package:pizza_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  // register metthod
  void register()async{
    // get auth service
    final _authService = AuthService();
    // check if passwords page match => crete user
    if(passwordController.text == confirmpasswordController.text){
      // try create user
      try {
        await _authService.signUpWithEmailPassowrd(emailController.text, passwordController.text);
      } catch (e){
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            )
        );
      }
    }
    // if password don;t match=> show error
    else{
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Password don't match"),
          )
      );
    }
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
            Text("Let's Create an Account for you",style: TextStyle(
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

            // password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextfield(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
            ),

            const SizedBox(height: 25,),

            // confirm password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextfield(
                  controller: confirmpasswordController,
                  hintText: "Confirm Password",
                  obscureText: true),
            ),

            const SizedBox(height: 25,),
            // sign in button
            MyButton(
              text: 'Sign Up',onTap: (){
              register();
            },
            ),
            const SizedBox(height: 25,),

            // already have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?",style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login now",style: TextStyle(
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

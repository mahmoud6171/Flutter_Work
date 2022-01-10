import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projs/shared/component/components.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              defaultFormField(
                controller: emailController,
                label: 'Email',
                prefix: Icons.email,
                type: TextInputType.emailAddress,
                validate: (String value){
                  if(value.isEmpty)
                    {
                      return 'email must not be empty';
                    }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultFormField(
                controller: passwordController,
                label: 'Password',
                prefix: Icons.lock,
                suffix: isPassword? Icons.visibility_off:Icons.visibility,
                isPassword: isPassword,
                suffixFunction: (){
                  setState(() {
                    isPassword=!isPassword;
                  });
                },
                type: TextInputType.visiblePassword,
                validate: (String value){
                  if(value.isEmpty)
                  {
                    return 'password must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25.0,
              ),
             defaultButton(function: ()
             {
               if(formKey.currentState!.validate())
                 {
                   print(emailController.text);
                   print(passwordController.text);
                 }
             },
                 text: 'LOGIN',
             ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text(
                      'Don\'t have an email?'
                  ),
                  TextButton(onPressed: (){}, child: Text('Register now')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

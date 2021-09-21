import 'package:deviceselllingapp/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _name = "";
  bool changeButton = false;
  //Todo Global Key define to validate the TextFormFields
  final _formkey = GlobalKey<FormState>();
  //Todo throught this method we're validating the form
  moveToHome(BuildContext context)async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
              Text(
                "Welcome $_name",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.person, color: Colors.deepOrange)
                      ),
                      onChanged: (value){
                        _name = value;
                        setState(() {
                        });
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock, color: Colors.deepOrange)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password can't be empty";
                        }
                        else if(value.length < 6){
                          return "Password length should be greater than 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),

                    //Todo how to use Animated Container
                    InkWell(
                      onTap: ()=> moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: changeButton? 50 :150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: changeButton?BorderRadius.circular(50): BorderRadius.circular(12)
                        ),
                        child: changeButton? Icon(Icons.done_outline_rounded, color: Colors.white): Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ),

                    // Todo how to use Elevated Button
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     minimumSize: Size(150, 30),
                    //     primary: Colors.deepOrange,
                    //     // padding: EdgeInsets.symmetric(horizontal: 50),
                    //     shape: BeveledRectangleBorder(
                    //       borderRadius: BorderRadius.circular(13),
                    //     ),
                    //     textStyle: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   onPressed: (){
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    //   },
                    //   child: Text(
                    //       "Login"
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

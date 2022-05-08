import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:log_in/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    final _auth = FirebaseAuth.instance;
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Register",
                style: TextStyle(
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  fontSize: 24
                ),),
                SizedBox(height: 25,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    email = value;
                    print(email);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your Email',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    password = value;
                    print(password);
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                  hintText: 'Enter Password',
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async{
                    try{
                      final newUser = await _auth
                          .createUserWithEmailAndPassword(
                          email: email!, password: password!);
                      if(newUser !=null){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      }
                    }catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid data")),
                      );
                    }


                  },
                  child: Text("Register"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black,),
                  elevation: MaterialStateProperty.all(4.0),
                   shape: MaterialStateProperty.all<
                     RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(14.0)
                     ),
                   ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 35.0)
                  )
                ),),
                TextButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Already Registerd !! Login",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

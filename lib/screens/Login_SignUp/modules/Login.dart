import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/utils/showdialogue.dart';
import '../../../components/button.dart';
import '../../../components/input.dart';
import '../../../utils/myColors.dart';
import '../../../providers/login_SignUpProvider.dart';
import './SignUp.dart';
import 'package:zing_fitnes_trainer/utils/validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final color = MyColors();

  @override
  Widget build(BuildContext context) {
    var formdata = Provider.of<LoginSignUpProvider>(context);
    return Form(
      autovalidate: formdata.readAutovalidate,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //
          //this row contains two flatbuttons and a text widget
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ButtonTheme(
                minWidth: 5,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Text('Login',
                      style: TextStyle(
                          color: color.deepBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 15,
                    0,
                    MediaQuery.of(context).size.width / 15,
                    0),
                child: Text('or', style: TextStyle(color: color.white)),
              ),

//here we are using provider to switch to Signup upon clicking signUp
              Consumer<LoginSignUpProvider>(
                  builder: (context, data, child) => ButtonTheme(
                        minWidth: 5,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: color.deepBlue, fontSize: 22)),
                          onPressed: () {
                            data.changeCode = Column(
                              children: <Widget>[
                                SignUp(),
                                Padding(padding: EdgeInsets.all(2)
                                    // padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/500),
                                    )
                              ],
                            );
                          },
                        ),
                      ))
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //
              //this is the first child of the inner column and it holds the white texts
              //
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        MediaQuery.of(context).size.height / 90,
                        0,
                        MediaQuery.of(context).size.height / 150),
                    child: Text(
                      "Make",
                      style: TextStyle(
                          color: color.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Your self fit",
                    style: TextStyle(
                        color: color.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(8),
              ),

              Consumer<LoginSignUpProvider>(
                builder: (context, mydata, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Input_field(
                      onChanged: (value) {
                        mydata.setEmail = value;
                      },
                      hide: false,
                      validator: (value) {
                        return Validator().emailValidator(value);
                      },
                      icon: Icons.email,
                      hintText: 'Email id',
                    ),
                    Padding(
                      padding: EdgeInsets.all(7),
                    ),
                    Input_field(
                      onChanged: (value) {
                        mydata.setpasssword = value;
                      },
                      hide: true,
                      icon: Icons.lock_outline,
                      hintText: 'Password',
                      validator: (value) {
                        return Validator().passwordValidator(value);
                      },
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(3),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: color.white),
                      ))
                ],
              ),

              Padding(
                padding: EdgeInsets.all(3),
              ),

              Consumer<LoginSignUpProvider>(
                builder: (context, data, child) => Button(
                    text: 'LOGIN',
                    onClick: () {
                      validateForm(data);
                    }),
              )
              //
              //this is the second child of the inner column and it contains two inputfields
              //
            ],
          )
        ],
      ),
    );
  }

  validateForm(LoginSignUpProvider data) {
    if (_formKey.currentState.validate()) {
      showDialog(
          context: context,
          builder: (context) => InfoDialogue(
                title: "Login Info",
                values: {
                  "Email Id": data.readEmail,
                  "Password": data.readloginPass
                },
              ));
    } else {
      data.setAutovalidate = true;
    }
  }
}

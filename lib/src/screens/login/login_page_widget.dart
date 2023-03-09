
import 'package:flutter/material.dart';
import 'package:redrust/src/shared/dto/auth_dto.dart';
import 'package:redrust/src/shared/models/auth_model.dart';
import 'package:redrust/src/shared/models/user_model.dart';
import 'package:redrust/src/shared/repository/auth_repository.dart';

class LoginPage extends StatefulWidget {
  final AuthModel auth;
  const LoginPage({Key? key, required this.auth }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthRepository repository = AuthRepository();
  UserModel user = UserModel();
  GlobalKey<ScaffoldState> key = GlobalKey();

  bool isFormValid = false;
  bool isLoading = false;

  void validate(){
    setState(() {
      isFormValid = user.isValid();
    });
  }

  Future<bool> login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    try{
      AuthDto authDto = await repository.login(user);
      
      widget.auth.accessToken = authDto.accessToken;
      widget.auth.isLogged = true;

      setState(() {
        isLoading = false;
      });

      return true;
    }catch(err){
      setState(() {
        isLoading = false;
      });

      debugPrint(err.toString());
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLoading) ...[
              const Center(
                child: CircularProgressIndicator(),
              )
            ] else ...[

              const Text("Username"),
              TextFormField(
                validator: user.validateUsername,
                onChanged: (value){
                  user.username = value;
                  validate();
                },
              ),
              const Text("Password"),
              TextFormField(
                obscureText: true,
                validator: user.validatePassword,
                onChanged: (value){
                  user.password = value;
                  validate();
                },
              ),
              const SizedBox(height: 16),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (!isFormValid) return;
                      
                      if (await login(context)){
                        Navigator.pushReplacementNamed(context, "/home");
                      }
                    },
                    child: const Text("Login"),
                  );
                }
              )
            ]
          ],
        ),
      ),
    );
  }
}

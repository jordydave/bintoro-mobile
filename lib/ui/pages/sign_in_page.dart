part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.red[900], Colors.red[800], Colors.red[400]])),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        child: FadeAnimation(
                            1,
                            Text("Welcome Back,\nExplorer",
                                style: whiteTextFont.copyWith(fontSize: 20)))),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FadeAnimation(
                      1,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset("assets/logo.png",
                                height: 50, width: 50),
                          ),
                          SizedBox(height: 60),
                          TextField(
                            onChanged: (text) {
                              setState(() {
                                isEmailValid = EmailValidator.validate(text);
                              });
                            },
                            cursorColor: Colors.red,
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Email Addres",
                                hintText: "Email Addres"),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            onChanged: (text) {
                              setState(() {
                                isPasswordValid = text.length >= 6;
                              });
                            },
                            cursorColor: Colors.red,
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Password",
                                hintText: "Password"),
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Text("Forgot Password ? ",
                                  style: greyTextFont.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              Text("Get Now",
                                  style: redTextFont.copyWith(fontSize: 12))
                            ],
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 40, bottom: 30),
                            child: isSigningIn
                                ? SpinKitFadingCircle(color: mainColor)
                                : RaisedButton(
                                    color: isEmailValid && isPasswordValid
                                        ? mainColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color: isEmailValid && isPasswordValid
                                            ? Colors.white
                                            : Color(0xFFBEBEBE),
                                      ),
                                    ),
                                    onPressed: isEmailValid && isPasswordValid
                                        ? () async {
                                            setState(() {
                                              isSigningIn = true;
                                            });
                                            SignInSignUpResult result =
                                                await AuthServices.signIn(
                                                    emailController.text,
                                                    passwordController.text);
                                            if (result.user == null) {
                                              setState(() {
                                                isSigningIn = false;
                                              });
                                              Flushbar(
                                                  duration:
                                                      Duration(seconds: 5),
                                                  flushbarPosition:
                                                      FlushbarPosition.BOTTOM,
                                                  backgroundColor: mainColor,
                                                  message: result.message)
                                                ..show(context);
                                            }
                                          }
                                        : null),
                          ),
                          Row(
                            children: [
                              Text("Start Fresh Now ?",
                                  style: greyTextFont.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                "Sign Up",
                                style: redTextFont.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(height: 90),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

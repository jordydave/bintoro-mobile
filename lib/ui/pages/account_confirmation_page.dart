part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;
  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigingUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToPreferencePage(widget.registrationData));
          return;
        },
        child: Scaffold(
            body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          color: Colors.white,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 90, top: 20),
                      height: 56,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToSplashPage());
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                          Center(
                            child: Text("Confirm\nNew Account",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center),
                          )
                        ],
                      )),
                  Text("Welcome",
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w300)),
                  Text(
                    "${widget.registrationData.name}",
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 110),
                  (isSigingUp)
                      ? SpinKitFadingCircle(color: Color(0xFF3E9D9D), size: 45)
                      : SizedBox(
                          height: 45,
                          width: 250,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Color(0xFF3E9D9D),
                            child: Text("Create My Account",
                                style: whiteTextFont.copyWith(fontSize: 16)),
                            onPressed: () async {
                              setState(() {
                                isSigingUp = true;
                              });
                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registrationData.email,
                                      widget.registrationData.password,
                                      widget.registrationData.name,
                                      widget.registrationData.noHp,
                                      widget.registrationData.alamat);
                              if (result.user == null) {
                                setState(() {
                                  isSigingUp = false;
                                });
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: result.message,
                                )..show(context);
                              }
                            },
                          ),
                        ),
                ],
              )
            ],
          ),
        )));
  }
}

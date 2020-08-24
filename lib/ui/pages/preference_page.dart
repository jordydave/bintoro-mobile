part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationData registrationData;
  PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  TextEditingController alamatController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    alamatController.text = widget.registrationData.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          widget.registrationData.password = "";
          context
              .bloc<PageBloc>()
              .add(GoToRegistrationPage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 56,
                      margin: EdgeInsets.only(top: 20, bottom: 4),
                      child: GestureDetector(
                          onTap: () {
                            widget.registrationData.password = "";
                            context.bloc<PageBloc>().add(
                                GoToRegistrationPage(widget.registrationData));
                          },
                          child: Icon(Icons.arrow_back)),
                    ),
                    Text("Select your address\nFavorite style",
                        style: blackTextFont.copyWith(fontSize: 20)),
                    SizedBox(height: 16),
                    TextField(
                        controller: alamatController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Address",
                            hintText: "Address")),
                    SizedBox(height: 16),
                    Center(
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: mainColor,
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                          widget.registrationData.name = alamatController.text;
                          context.bloc<PageBloc>().add(
                              GoToAccountConfirmationPage(
                                  widget.registrationData));
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

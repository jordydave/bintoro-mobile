part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile", style: whiteTextFont),
        ),
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                if (userState is UserLoaded) {
                  User user = userState.user;
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name,
                            style: blackTextFont.copyWith(fontSize: 21)),
                        SizedBox(height: 8),
                        Text(user.email,
                            style: blackTextFont.copyWith(fontSize: 18)),
                        SizedBox(height: 8),
                        Text(user.noHp,
                            style: blackTextFont.copyWith(fontSize: 16)),
                        SizedBox(height: 8)
                      ],
                    ),
                  );
                } else
                  return SizedBox();
              }),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(defaultMargin, 8, 0, 8),
                            child: Icon(Icons.business, size: 34),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 9, defaultMargin, 8),
                            child: Text(
                              "Daftar Properti",
                              style: blackTextFont.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 8, defaultMargin, 8),
                        child: Icon(Icons.arrow_forward_ios, size: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(defaultMargin, 8, 0, 8),
                            child: Icon(Icons.info_outline, size: 34),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 9, defaultMargin, 8),
                            child: Text(
                              "Ketentuan Layanan",
                              style: blackTextFont.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 8, defaultMargin, 8),
                        child: Icon(Icons.arrow_forward_ios, size: 14),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(defaultMargin, 8, 0, 14),
                        child: Text("Beri penilaian di Play Store",
                            style: greyTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 9, defaultMargin, 14),
                        child: Text("Version 1.0.0",
                            style: greyTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: mainColor,
                  child: Text("Keluar",
                      style:
                          whiteTextFont.copyWith(fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    await AuthServices.signOut();
                    context.bloc<UserBloc>().add(SignOut());
                  },
                ),
              ),
            )
          ],
        ));
  }
}

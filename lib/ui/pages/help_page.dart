part of 'pages.dart';

class HelpPage extends StatelessWidget {
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(defaultMargin, 18, 0, 18),
                          child: Icon(Icons.chat_bubble_outline, size: 34),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 9, defaultMargin, 8),
                          child: Text(
                            "Kirim Pesam",
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
                          margin: EdgeInsets.fromLTRB(defaultMargin, 18, 0, 18),
                          child: Icon(Icons.question_answer, size: 34),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 9, defaultMargin, 8),
                          child: Text(
                            "FAQ",
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
                          margin: EdgeInsets.fromLTRB(defaultMargin, 18, 0, 18),
                          child: Icon(Icons.call, size: 34),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 9, defaultMargin, 8),
                          child: Text(
                            "Telepon",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

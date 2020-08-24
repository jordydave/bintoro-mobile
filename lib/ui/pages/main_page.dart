part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: accent1),
        SafeArea(child: Container(color: Color(0xFFF6F7F9))),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: [
            ServicePage(),
            Center(child: Text("Pesanan")),
            HelpPage(),
            ProfilePage()
          ],
        ),
        createCustomBottomNavBar(),
      ],
    ));
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: bottomNavBarIndex,
              onTap: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 0)
                          ? "assets/ic_home.png"
                          : "assets/ic_grey_home.png"),
                    ),
                    title: Text(
                      "Beranda",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    )),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 1)
                          ? "assets/ic_order.png"
                          : "assets/ic_grey_order.png"),
                    ),
                    title: Text(
                      "Pesanan",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    )),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 2)
                          ? "assets/ic_help.png"
                          : "assets/ic_grey_help.png"),
                    ),
                    title: Text(
                      "Bantuan",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    )),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 3)
                          ? "assets/ic_person.png"
                          : "assets/ic_grey_person.png"),
                    ),
                    title: Text(
                      "Akun",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    )),
              ]),
        ),
      );
}

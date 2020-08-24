part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xFFc0392b);
Color accent1 = Color(0xFFc23616);
Color concrete = Color(0xFFADADAD);
Color yellowAcc = Color(0xFFFBD460);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle redTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: concrete, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumberFont = GoogleFonts.openSans().copyWith(color: yellowAcc);

part of 'pages.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                height: 250,
                decoration: BoxDecoration(color: Colors.red[900]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  defaultMargin, 30, defaultMargin, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Panggil Tukang Sekarang !",
                      style: whiteTextFont.copyWith(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("pilih layanan sesuai dengan kebutuhan Anda",
                      textAlign: TextAlign.start,
                      style: whiteTextFont.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 100, 25, 0),
              child: Container(
                width: double.infinity,
                height: 125,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0.0, 3.0),
                          blurRadius: 15)
                    ]),
                child: BlocBuilder<ServicesBloc, ServicesState>(
                  builder: (_, serviceState) {
                    if (serviceState is ServicesLoaded) {
                      List<Services> services =
                          serviceState.services.sublist(0, 3);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: services.length,
                        itemBuilder: (_, i) => Container(
                          margin: EdgeInsets.all(5),
                          child: ServiceCard(services[i], onTap: () {
                              // context
                              //   .bloc<PageBloc>()
                              //   .add(GoToServiceDetailPage(serviceDetail[i]));
                          }),
                        ),
                      );
                    } else {
                      return SpinKitFadingCircle(
                        color: mainColor,
                        size: 50,
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
        AutoSlider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 8),
              child: Text(
                "News",
                style: blackTextFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 8, defaultMargin, 8),
              child: Icon(Icons.arrow_forward_ios, size: 14),
            ),
          ],
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (_, newsState) {
              if (newsState is NewsLoaded) {
                List<News> news = newsState.news;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: news.length,
                  itemBuilder: (_, i) => Container(
                    margin: EdgeInsets.all(5),
                    child: NewsCard(news[i]),
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 8),
              child: Text(
                "Tips & Trick",
                style: blackTextFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 8, defaultMargin, 8),
              child: Icon(Icons.arrow_forward_ios, size: 14),
            ),
          ],
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<TrickBloc, TrickState>(builder: (_, trickState) {
            if (trickState is TrickLoaded) {
              List<Trick> tricks = trickState.trick;

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tricks.length,
                  itemBuilder: (_, i) => Container(
                        margin: EdgeInsets.all(5),
                        child: TrickCard(tricks[i]),
                      ));
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),
        SizedBox(height: 90)
      ],
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 360.0 - 200);
    path.quadraticBezierTo(size.width / 2, 240, size.width, 360.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

part of 'pages.dart';

class SelectServicePage extends StatelessWidget {
  final ServiceDetail serviceDetail;
  SelectServicePage(this.serviceDetail);
  @override
  Widget build(BuildContext context) {
    //ServiceDetail serviceDetail;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
          future: JasaServices.getDetailService(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              //serviceDetail = snapshot.data;
              return Column(
                children: [],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}

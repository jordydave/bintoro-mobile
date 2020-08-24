part of 'widgets.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final Function onTap;

  NewsCard(this.news, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(posterPath + news.poster),
              fit: BoxFit.cover)),
      child: Container(
        height: 140,
        width: 210,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.61),
                Colors.black.withOpacity(0)
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news.title,
                style: whiteTextFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }
}

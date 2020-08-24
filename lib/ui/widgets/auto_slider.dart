part of 'widgets.dart';

class AutoSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: ImageAutoSlider(
        assetImages: [
          AssetImage('assets/banner.png'),
          AssetImage('assets/banner.png'),
          AssetImage('assets/banner.png')
        ],
        imageHeight: 100,
        boxFit: BoxFit.cover,
        slideMilliseconds: 700,
        durationSecond: 4,
      ),
    );
  }
}

part of 'widgets.dart';

class ServiceCard extends StatelessWidget {
  final Services services;
  final Function onTap;

  ServiceCard(this.services, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(iconService + services.icon,
            width: 93, height: 93, alignment: Alignment.center),
        Text(services.name, style: blackTextFont )
      ],
    );
  }
}

import 'package:bintoro_app/models/models.dart';
import 'package:bintoro_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  @override
  ServicesState get initialState => ServicesInitial();

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    if (event is FetchServices) {
      List<Services> services = await JasaServices.getJasaService();
      yield ServicesLoaded(
          services: services
              .where((element) =>
                  !element.name.toLowerCase().contains('365') &&
                  !element.name.toLowerCase().contains('bois'))
              .toList());
    }
  }
}

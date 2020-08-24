import 'package:bintoro_app/models/models.dart';
import 'package:bintoro_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trick_event.dart';
part 'trick_state.dart';

class TrickBloc extends Bloc<TrickEvent, TrickState> {
  @override
  TrickState get initialState => TrickInitial();

  @override
  Stream<TrickState> mapEventToState(TrickEvent event) async* {
    if (event is FetchTrick) {
      List<Trick> trick = await TrickServices.getTrick();
      yield TrickLoaded(
          trick: trick
              .where((element) =>
                  !element.title.toLowerCase().contains('365') &&
                  !element.title.toLowerCase().contains('bois'))
              .toList());
    }
  }
}
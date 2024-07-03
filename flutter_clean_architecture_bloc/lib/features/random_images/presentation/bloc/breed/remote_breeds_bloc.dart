import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_breeds_event.dart';
part 'remote_breeds_state.dart';

class RemoteBreedsBloc extends Bloc<RemoteBreedsEvent, RemoteBreedsState> {
  RemoteBreedsBloc() : super(RemoteBreedsLoading()) {
    on<RemoteBreedsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

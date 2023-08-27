import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'advices_bloc_event.dart';
part 'advices_bloc_state.dart';

class AdvicesBlocBloc extends Bloc<AdvicesBlocEvent, AdvicesBlocState> {
  AdvicesBlocBloc() : super(AdvicesBlocInitial()) {
    on<AdvicesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_bloc_event.dart';
part 'data_bloc_state.dart';

class DataBlocBloc extends Bloc<DataBlocEvent, DataBlocState> {
  DataBlocBloc() : super(DataBlocInitial()) {
    on<DataBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:electrops/src/services/database.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataEvent>((event, emit) {});
    on<UploadDataEvent>(
      (event, emit) {
        UploadFile().uploadImaeToFirebase();
      },
    );
  }
}

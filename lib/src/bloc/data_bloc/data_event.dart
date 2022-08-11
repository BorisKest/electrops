part of 'data_bloc.dart';

@immutable
abstract class DataEvent extends Equatable {}

class UploadDataEvent extends DataEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddUserEvent extends DataEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

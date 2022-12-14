part of 'data_bloc.dart';

@immutable
abstract class DataEvent extends Equatable {}

class UploadDataEvent extends DataEvent {
  final String? title;
  String category;
  String? description;
  String? price;
  UploadDataEvent({
    this.title,
    required this.category,
    this.description,
    this.price,
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddUserEvent extends DataEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

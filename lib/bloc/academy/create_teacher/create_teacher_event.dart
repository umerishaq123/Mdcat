import 'package:equatable/equatable.dart';

abstract class CreateTeacherEvent extends Equatable{

 const CreateTeacherEvent();
}
class CreateUser extends CreateTeacherEvent {
 final Map<String, dynamic> data;
  final Map<String, String> imagePath;

  const CreateUser(this.data,this.imagePath);

  @override
  List<Object?> get props => [data,imagePath];
}
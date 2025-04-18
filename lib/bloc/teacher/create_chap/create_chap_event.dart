
import 'package:equatable/equatable.dart';

abstract class CreateChapEvent extends Equatable {
  const CreateChapEvent();

  @override
  List<Object?> get props => [];
}

class CreateChapterr extends CreateChapEvent {
  final Map<String, dynamic> data;
  const CreateChapterr(this.data);
  @override
  List<Object?> get props => [data];
}

class CreateTopic extends CreateChapEvent {
  final Map<String, dynamic> data;
  final Map<String, String> videoPath;

  const CreateTopic(this.data, this.videoPath);

  @override
  List<Object?> get props => [data, videoPath];
}

class AddNotes extends CreateChapEvent {
  final Map<String, dynamic> data;
final Map<String, String> file;
   AddNotes(this.data,this.file);

  @override
  List<Object?> get props => [data,file];
}

class CreateChapterWiseTest extends CreateChapEvent {
  final Map<String, dynamic> data;
  const CreateChapterWiseTest(this.data);

  @override
  List<Object?> get props => [data];
}

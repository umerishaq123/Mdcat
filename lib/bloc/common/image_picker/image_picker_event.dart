import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class CameraPickerEvent extends ImagePickerEvent {}

class GalleryPickerEvent extends ImagePickerEvent {}

class ResetImagePickerEvent extends ImagePickerEvent {}

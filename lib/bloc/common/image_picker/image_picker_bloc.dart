import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdcat_kawiish/bloc/common/image_picker/image_picker_event.dart';
import 'package:mdcat_kawiish/bloc/common/image_picker/image_picker_states.dart';
import 'package:mdcat_kawiish/core/utilis/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraPickerEvent>(_cameraCapture);
    on<GalleryPickerEvent>(_galleryPicker);
    on<ResetImagePickerEvent>(_resetImagePicker);
  }

  void _cameraCapture(
      CameraPickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(
      GalleryPickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }

  void _resetImagePicker(
      ResetImagePickerEvent event, Emitter<ImagePickerState> emit) {
    emit(const ImagePickerState());
  }
}




import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdcat_kawiish/bloc/image_picker/image_picker_event.dart';
import 'package:mdcat_kawiish/bloc/image_picker/image_picker_states.dart';
import 'package:mdcat_kawiish/core/utilis/image_picker_utils.dart';


class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils ;
  ImagePickerBloc(
      this.imagePickerUtils
      ) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);
  }

  void _cameraCapture(CameraCapture event , Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(GalleryPicker event , Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}

import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import '../components/album_model.dart';
import '../components/upload_choice.dart';

class UploadController extends GetxController {
  // 앨범을 담는 Rx 변수
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  // 선택한 이미지를 담는 변수
  final Rxn<AssetEntity> _selectedImage = Rxn<AssetEntity>();
  final RxInt _index = 0.obs;

  List<AlbumModel> get albums => _albums.value;
  AssetEntity? get selectedImage => _selectedImage.value;
  int get index => _index.value;

  @override
  void onReady() {
    super.onReady();
    // 권한 확인
    _checkPermission();
  }

  void _checkPermission() {
    PhotoManager.requestPermissionExtend().then((ps) {
      if (ps.isAuth) {
        getAlbums();
      } else {
        PhotoManager.openSetting();
      }
    });
  }

  void select(AssetEntity e) {
    _selectedImage(e);
    _selectedImage.refresh();
  }

  void moveToChoose() {
    Get.to(() => const UploadChoice(),
        transition: Transition.downToUp, popGesture: false);
  }

  void changeIndex(int value) {
    _index(value);
    Get.back();
  }

  Future<void> getAlbums() async {
    await PhotoManager.getAssetPathList(type: RequestType.image).then((paths) {
      for (AssetPathEntity asset in paths) {
        asset.getAssetListRange(start: 0, end: 10000).then((images) {
          if (images.isNotEmpty) {
            final album = AlbumModel.fromGallery(asset.id, asset.name, images);
            _albums.value.add(album);
            _albums.refresh();
          }
        });
      }
    });
  }
}

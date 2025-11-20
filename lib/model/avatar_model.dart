import 'package:movie/core/recources/assets_manager/assets_manager.dart';

class AvatarModel {
  String imagePath;
  int avatarId;

  AvatarModel({required this.imagePath, required this.avatarId});

  static List<AvatarModel> avatars = [
    AvatarModel(imagePath: ImageAssets.av1, avatarId: 1),
    AvatarModel(imagePath: ImageAssets.av2, avatarId: 2),
    AvatarModel(imagePath: ImageAssets.av3, avatarId: 3),
    AvatarModel(imagePath: ImageAssets.av4, avatarId: 4),
    AvatarModel(imagePath: ImageAssets.av5, avatarId: 5),
    AvatarModel(imagePath: ImageAssets.av6, avatarId: 6),
    AvatarModel(imagePath: ImageAssets.av7, avatarId: 7),
    AvatarModel(imagePath: ImageAssets.av8, avatarId: 8),
    AvatarModel(imagePath: ImageAssets.av9, avatarId: 9),
  ];
}

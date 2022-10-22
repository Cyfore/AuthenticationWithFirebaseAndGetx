class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance {
    _instace ??= ImageConstants._();
    return _instace!;
  }

  ImageConstants._();
  final String midoriya = 'png/midoriya'.toPNG;
  final String gojoSenpai = 'png/gojo_senpai'.toPNG;
  final String saitama = 'jpg/saitamadefault'.toJPG;
  final String yuno = 'jpg/Yuno'.toJPG;
  final String garouMonster = 'jpg/Garou_Monster'.toJPG;
  final String garou = 'png/Garou_Monster-removebg-preview'.toPNG;
  final String facebook = 'png/f'.toPNG;
  final String google = 'png/g'.toPNG;
  final String twitter = 'png/t'.toPNG;
  final String deadPlanetSpecular = 'jpg/dead_planet_specular'.toJPG;
}

extension _ImageConstantsExtension on String {
  String get toPNG => 'assets/images/$this.png';
  String get toJPG => 'assets/images/$this.jpg';
}

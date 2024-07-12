// ignore_for_file: unused_field

class AppAssets {
  static AppImages images = AppImages();
  static final AppSvgs svgs = AppSvgs();
}

class AppImages {
  static const String _path = 'assets/images';
}

class AppSvgs {
  static const String _path = 'assets/svgs';

  final String logo = '$_path/logo.svg';
  final String notFound = '$_path/not_found.svg';
  final String boleto = '$_path/boleto.svg';
}

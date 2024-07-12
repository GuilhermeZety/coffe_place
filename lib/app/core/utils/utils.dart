import 'package:coffe_place/app/core/utils/toasting.dart';
import 'package:flutter/services.dart';

class Utils {
  static void copy(context, String text, {bool logged = false}) async {
    await Clipboard.setData(ClipboardData(text: text));
    Toasting.success(context, title: 'Copiado com sucesso!');
  }

  static Future<Uint8List> getAssetsBytes(String path) async {
    return await rootBundle.load(path).then((value) => value.buffer.asUint8List());
  }
}

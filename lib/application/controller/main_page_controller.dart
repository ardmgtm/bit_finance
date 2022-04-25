import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainPageController extends GetxController {
  RxInt index = 0.obs;

  switchScreen(int newIndex) {
    index.value = -1;
    index.value = newIndex;
  }
}

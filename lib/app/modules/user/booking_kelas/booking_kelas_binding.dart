import 'package:get/get.dart';
import 'booking_kelas_controller.dart';

class BookingKelasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingKelasController>(
      () => BookingKelasController(),
    );
  }
}
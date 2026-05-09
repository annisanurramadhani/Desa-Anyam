import 'package:get/get.dart';

class FormPendaftaranController extends GetxController {

  late Map<String, dynamic> data;

  var nama = "".obs;
  var wa = "".obs;
  var email = "".obs;
  var tanggal = "".obs;
  var jam = "".obs;
  var pelatih = "".obs;
  var lokasi = "".obs;
  var harga = 0.obs;

  @override
  void onInit() {
    super.onInit();

    /// 🔥 FIX ERROR DI SINI
    data = Map<String, dynamic>.from(Get.arguments ?? {});

    nama.value = data["nama"]?.toString() ?? "";
    wa.value = data["wa"]?.toString() ?? "";
    email.value = data["email"]?.toString() ?? "";
    tanggal.value = data["tanggal"]?.toString() ?? "";
    jam.value = data["jam"]?.toString() ?? "";
    pelatih.value = data["pengrajin"]?.toString() ?? "";
    lokasi.value = data["lokasi"]?.toString() ?? "";
    harga.value = int.tryParse(data["harga"]?.toString() ?? "0") ?? 0;
  }

  void changeMenu(int index) {
    // navigasi bawah
  }

  void goToPembayaran() {
    Get.toNamed('/pembayaran', arguments: data);
  }
}
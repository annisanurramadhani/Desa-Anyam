import 'package:get/get.dart';

import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';

import '../modules/auth/register/register_binding.dart';
import '../modules/auth/register/register_view.dart';

import '../modules/user/home/home_binding.dart';
import '../modules/user/home/home_view.dart';

import '../modules/user/belajar_anyaman/belajar_anyaman_binding.dart';
import '../modules/user/belajar_anyaman/belajar_anyaman_view.dart';

import '../modules/user/prof_pengrajin/prof_pengrajin_binding.dart';
import '../modules/user/prof_pengrajin/prof_pengrajin_view.dart';

import '../modules/user/detail_pengrajin/detail_pengrajin_binding.dart';
import '../modules/user/detail_pengrajin/detail_pengrajin_view.dart';

import '../modules/user/booking_kelas/booking_kelas_binding.dart';
import '../modules/user/booking_kelas/booking_kelas_view.dart';

import '../modules/user/detail_jadwal/detail_jadwal_binding.dart';
import '../modules/user/detail_jadwal/detail_jadwal_view.dart';

import '../modules/user/form_pendaftaran/form_pendaftaran_binding.dart';
import '../modules/user/form_pendaftaran/form_pendaftaran_view.dart';

import '../modules/user/pembayaran/pembayaran_binding.dart';
import '../modules/user/pembayaran/pembayaran_view.dart';

import '../modules/user/pendaftaran_berhasil/pendaftaran_berhasil_binding.dart';
import '../modules/user/pendaftaran_berhasil/pendaftaran_berhasil_view.dart';

import '../modules/user/detail_pesanan/detail_pesanan_binding.dart';
import '../modules/user/detail_pesanan/detail_pesanan_view.dart';

import '../modules/user/produk_anyaman/produk_anyaman_binding.dart';
import '../modules/user/produk_anyaman/produk_anyaman_view.dart';

import '../modules/user/detail_produk/detail_produk_binding.dart';
import '../modules/user/detail_produk/detail_produk_view.dart';

import '../modules/user/jadwal_saya/jadwal_saya_binding.dart';
import '../modules/user/jadwal_saya/jadwal_saya_view.dart';

import '../modules/user/profile_user/profile_user_binding.dart';
import '../modules/user/profile_user/profile_user_view.dart';

import '../modules/user/profile_pengrajin/profile_pengrajin_binding.dart';
import '../modules/user/profile_pengrajin/profile_pengrajin_view.dart';

import '../modules/user/edit_profile/edit_profile_binding.dart';
import '../modules/user/edit_profile/edit_profile_view.dart';

import '../modules/user/sertifikat/sertifikat_binding.dart';
import '../modules/user/sertifikat/sertifikat_view.dart';

import '../modules/user/notifikasi/notifikasi_binding.dart';
import '../modules/user/notifikasi/notifikasi_view.dart';

import '../modules/user/detail_materi/detail_materi_binding.dart';
import '../modules/user/detail_materi/detail_materi_view.dart';

import '../modules/user/riwayat_aktivitas/riwayat_aktivitas_binding.dart';
import '../modules/user/riwayat_aktivitas/riwayat_aktivitas_view.dart';

/// ================= PENGRAJIN =================
import '../modules/pengrajin/home_pengrajin/home_pengrajin_binding.dart';
import '../modules/pengrajin/home_pengrajin/home_pengrajin_view.dart';

import '../modules/pengrajin/jadwal/jadwal_pengrajin_binding.dart';
import '../modules/pengrajin/jadwal/jadwal_pengrajin_view.dart';

import '../modules/pengrajin/profile/profile_akun_pengrajin_binding.dart';
import '../modules/pengrajin/profile/profile_akun_pengrajin_view.dart';

import '../modules/pengrajin/edit_profile/edit_profile_pengrajin_binding.dart';
import '../modules/pengrajin/edit_profile/edit_profile_pengrajin_view.dart';

import '../modules/pengrajin/daftar_murid/daftar_murid_binding.dart';
import '../modules/pengrajin/daftar_murid/daftar_murid_view.dart';

import '../modules/pengrajin/payment/payment_binding.dart';
import '../modules/pengrajin/payment/payment_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.BELAJAR_ANYAMAN,
      page: () => const BelajarAnyamanView(),
      binding: BelajarAnyamanBinding(),
    ),

    GetPage(
      name: Routes.PROF_PENGRAJIN,
      page: () => const ProfPengrajinView(),
      binding: ProfPengrajinBinding(),
    ),

    GetPage(
      name: Routes.DETAIL_PENGRAJIN,
      page: () => const DetailPengrajinView(),
      binding: DetailPengrajinBinding(),
    ),

    GetPage(
      name: Routes.BOOKING_KELAS,
      page: () => const BookingKelasView(),
      binding: BookingKelasBinding(),
    ),

    GetPage(
      name: Routes.DETAIL_JADWAL,
      page: () => const DetailJadwalView(),
      binding: DetailJadwalBinding(),
    ),

    GetPage(
      name: Routes.FORM_PENDAFTARAN,
      page: () => const FormPendaftaranView(),
      binding: FormPendaftaranBinding(),
    ),

    GetPage(
      name: Routes.PEMBAYARAN,
      page: () => const PembayaranView(),
      binding: PembayaranBinding(),
    ),

    GetPage(
      name: Routes.PENDAFTARAN_BERHASIL,
      page: () => const PendaftaranBerhasilView(),
      binding: PendaftaranBerhasilBinding(),
    ),

    GetPage(
      name: Routes.DETAIL_PESANAN,
      page: () => const DetailPesananView(),
      binding: DetailPesananBinding(),
    ),

    GetPage(
      name: Routes.PRODUK_ANYAMAN,
      page: () => const ProdukAnyamanView(),
      binding: ProdukAnyamanBinding(),
    ),

    GetPage(
      name: Routes.DETAIL_PRODUK,
      page: () => const DetailProdukView(),
      binding: DetailProdukBinding(),
    ),

    GetPage(
      name: Routes.JADWAL_SAYA,
      page: () => const JadwalSayaView(),
      binding: JadwalSayaBinding(),
    ),

    GetPage(
      name: Routes.PROFILE_USER,
      page: () => const ProfileUserView(),
      binding: ProfileUserBinding(),
    ),

    GetPage(
      name: Routes.PROFILE_PENGRAJIN,
      page: () => const ProfilePengrajinView(),
      binding: ProfilePengrajinBinding(),
    ),

    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),

    GetPage(
      name: Routes.SERTIFIKAT,
      page: () => const SertifikatView(),
      binding: SertifikatBinding(),
    ),

    GetPage(
      name: Routes.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: NotifikasiBinding(),
    ),

    GetPage(
      name: Routes.DETAIL_MATERI,
      page: () => const DetailMateriView(),
      binding: DetailMateriBinding(),
    ),

    GetPage(
      name: Routes.RIWAYAT_AKTIVITAS,
      page: () => const RiwayatAktivitasView(),
      binding: RiwayatAktivitasBinding(),
    ),

    /// ================= PENGRAJIN =================
    GetPage(
      name: Routes.HOME_PENGRAJIN,
      page: () => const HomePengrajinView(),
      binding: HomePengrajinBinding(),
    ),

    GetPage(
      name: Routes.JADWAL_PENGRAJIN,
      page: () => const JadwalPengrajinView(),
      binding: JadwalPengrajinBinding(),
    ),

    GetPage(
      name: Routes.PROFILE_AKUN_PENGRAJIN,
      page: () => const ProfileAkunPengrajinView(),
      binding: ProfileAkunPengrajinBinding(),
    ),

    GetPage(
      name: Routes.EDIT_PROFILE_PENGRAJIN,
      page: () => const EditProfilePengrajinView(),
      binding: EditProfilePengrajinBinding(),
    ),

    GetPage(
      name: Routes.DAFTAR_MURID,
      page: () => const DaftarMuridView(),
      binding: DaftarMuridBinding(),
    ),

    GetPage(
      name: Routes.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
  ];
}

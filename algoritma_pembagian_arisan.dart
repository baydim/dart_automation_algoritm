import 'data/data_siswa.dart';

void main() {
  // Mengacak urutan siswa
  namaSiswa.shuffle();

  // Inisialisasi set untuk melacak siswa yang telah mendapatkan arisan
  Set<String> siswaDapatArisan = {};

  // Inisialisasi list untuk menyimpan hasil arisan
  List<Map<String, dynamic>> hasilArisan = [];

  // Melakukan arisan
  for (var siswa in namaSiswa) {
    // Jika siswa belum pernah mendapatkan arisan, tambahkan ke hasil arisan
    if (!siswaDapatArisan.contains(siswa["nama"])) {
      hasilArisan.add(siswa);
      // Tandai siswa ini telah mendapatkan arisan
      siswaDapatArisan.add(siswa["nama"]);
    }
  }

  print("Hasil arisan:");
  for (var i = 0; i < hasilArisan.length; i++) {
    var penerima = hasilArisan[i];
    print("Minggu ke-${i + 1}. ${penerima["gender"]} ${penerima["nama"]}");
  }
}

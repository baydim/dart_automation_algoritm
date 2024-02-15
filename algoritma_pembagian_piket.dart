

void main() {
  // Contoh data nama siswa dengan gender
  List<Map<String, dynamic>> namaSiswa = [
    {"nama": "Adi", "gender": "Laki-laki"},
    {"nama": "Budi", "gender": "Laki-laki"},
    {"nama": "Citra", "gender": "Perempuan"},
    {"nama": "Dian", "gender": "Perempuan"},
    {"nama": "Eka", "gender": "Perempuan"},
    {"nama": "Fajar", "gender": "Laki-laki"},
    {"nama": "Gita", "gender": "Perempuan"},
    {"nama": "Hadi", "gender": "Laki-laki"},
    {"nama": "Indra", "gender": "Perempuan"},
    {"nama": "Joko", "gender": "Laki-laki"},
    {"nama": "Kartika", "gender": "Perempuan"},
    {"nama": "Lina", "gender": "Perempuan"},
    {"nama": "Mira", "gender": "Perempuan"},
    {"nama": "Nita", "gender": "Perempuan"},
    {"nama": "Oktavia", "gender": "Perempuan"},
    {"nama": "Putra", "gender": "Laki-laki"},
    {"nama": "Rani", "gender": "Perempuan"},
    {"nama": "Sari", "gender": "Perempuan"},
    {"nama": "Tono", "gender": "Laki-laki"},
    {"nama": "Umar", "gender": "Laki-laki"},
    {"nama": "Vina", "gender": "Perempuan"},
    {"nama": "Wulan", "gender": "Perempuan"},
    {"nama": "Yanti", "gender": "Perempuan"},
    {"nama": "Zain", "gender": "Laki-laki"},
    {"nama": "Aisyah", "gender": "Perempuan"},
    {"nama": "Bambang", "gender": "Laki-laki"},
    {"nama": "Cindy", "gender": "Perempuan"},
    {"nama": "Dewi", "gender": "Perempuan"},
    {"nama": "Eko", "gender": "Laki-laki"},
    {"nama": "Fitri", "gender": "Perempuan"},
    {"nama": "Galih", "gender": "Laki-laki"},
    {"nama": "Hana", "gender": "Perempuan"},
    {"nama": "Irfan", "gender": "Laki-laki"},
    {"nama": "Jihan", "gender": "Perempuan"},
    {"nama": "Kiki", "gender": "Perempuan"},
    {"nama": "Lukman", "gender": "Laki-laki"},
    {"nama": "Merry", "gender": "Perempuan"},
    {"nama": "Nadia", "gender": "Perempuan"},
    {"nama": "Oscar", "gender": "Laki-laki"},
    {"nama": "Putri", "gender": "Perempuan"},
    {"nama": "Rama", "gender": "Laki-laki"},
    {"nama": "Sinta", "gender": "Perempuan"},
    {"nama": "Tono", "gender": "Laki-laki"},
    {"nama": "Uci", "gender": "Perempuan"},
    {"nama": "Viona", "gender": "Perempuan"},
    {"nama": "Winda", "gender": "Perempuan"},
    {"nama": "Yono", "gender": "Laki-laki"},
    {"nama": "Zara", "gender": "Perempuan"},
    {"nama": "Andi", "gender": "Laki-laki"},
    {"nama": "Bunga", "gender": "Perempuan"},
    {"nama": "Cici", "gender": "Perempuan"},
    {"nama": "Dona", "gender": "Perempuan"},
    {"nama": "Eka", "gender": "Perempuan"},
    {"nama": "Fina", "gender": "Perempuan"},
    {"nama": "Gilang", "gender": "Laki-laki"},
    {"nama": "Hesti", "gender": "Perempuan"},
    {"nama": "Ilham", "gender": "Laki-laki"},
    {"nama": "Juli", "gender": "Perempuan"},
    {"nama": "Kiki", "gender": "Perempuan"},
    {"nama": "Lina", "gender": "Perempuan"},
    {"nama": "Maman", "gender": "Laki-laki"},
    {"nama": "Nindy", "gender": "Perempuan"},
    {"nama": "Opik", "gender": "Laki-laki"}
  ];

  // Mengacak urutan siswa
  namaSiswa.shuffle();

  // Data jadwal piket
  List<Map<String, dynamic>> dataJadwalPiket = [
    {"day": "senin", "siswa": []},
    {"day": "selasa", "siswa": []},
    {"day": "rabu", "siswa": []},
    {"day": "kamis", "siswa": []},
    {"day": "jumat", "siswa": []}
  ];

  // Map untuk menyimpan siswa berdasarkan gender
  Map<String, List<Map<String, dynamic>>> kelompokGender = {
    "Laki-laki": [],
    "Perempuan": [],
  };

  // Mengelompokkan siswa berdasarkan gender
  for (var siswa in namaSiswa) {
    String gender = siswa["gender"];
    kelompokGender[gender]!.add(siswa);
  }

  // Membuat jadwal piket dengan adil antara laki-laki dan perempuan
  for (var i = 0; i < dataJadwalPiket.length; i++) {
    // Menghitung jumlah siswa laki-laki dan perempuan yang akan dipilih untuk jadwal piket hari ini
    int jumlahLakiLaki = (kelompokGender["Laki-laki"]!.length ~/ (dataJadwalPiket.length - i));
    int jumlahPerempuan = (kelompokGender["Perempuan"]!.length ~/ (dataJadwalPiket.length - i));

    // Memilih siswa laki-laki dan perempuan untuk jadwal piket hari ini
    List<Map<String, dynamic>> siswaLakiLaki = kelompokGender["Laki-laki"]!.sublist(0, jumlahLakiLaki);
    List<Map<String, dynamic>> siswaPerempuan = kelompokGender["Perempuan"]!.sublist(0, jumlahPerempuan);

    // Menghapus siswa yang telah dipilih dari kelompok gender
    kelompokGender["Laki-laki"]!.removeRange(0, jumlahLakiLaki);
    kelompokGender["Perempuan"]!.removeRange(0, jumlahPerempuan);

    // Menambahkan siswa yang dipilih ke dalam jadwal piket
    dataJadwalPiket[i]["siswa"]!.addAll(siswaLakiLaki);
    dataJadwalPiket[i]["siswa"]!.addAll(siswaPerempuan);
  }

  // Menampilkan hasil jadwal piket
  for (var jadwal in dataJadwalPiket) {
    print("Hari ${jadwal["day"]}:");
    for (var siswa in jadwal["siswa"]) {
      print("${siswa["gender"]} ${siswa["nama"]}");
    }
    print("");
  }
  
    // Set untuk melacak siswa yang sudah mendapat jadwal piket
  Set<String> siswaDalamJadwal = {};
    
  print("Menampilkan hasil jadwal piket dan melakukan pengecekan");
  // Menampilkan hasil jadwal piket dan melakukan pengecekan
  for (var jadwal in dataJadwalPiket) {
    print("Hari ${jadwal["day"]}:");
    if (jadwal["siswa"].isEmpty) {
      print("Tidak ada siswa yang dijadwalkan untuk piket.");
    } else {
      for (var siswa in jadwal["siswa"]) {
        print("${siswa["gender"]} ${siswa["nama"]}");
        // Menambahkan nama siswa ke dalam set
        siswaDalamJadwal.add(siswa["nama"]);
      }
    }
    print("");
  }
  
  print("Memeriksa apakah ada siswa yang tidak mendapat jadwal piket");
  // Memeriksa apakah ada siswa yang tidak mendapat jadwal piket
  for (var siswa in namaSiswa) {
    if (!siswaDalamJadwal.contains(siswa["nama"])) {
      print("Peringatan: ${siswa["gender"]} ${siswa["nama"]} tidak mendapat jadwal piket.");
    }
  }
}

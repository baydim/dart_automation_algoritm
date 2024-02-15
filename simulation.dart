import 'dart:math';

class Individu {
  String nama;
  String gender;
  double nilaiIPA;
  double nilaiIPS;
  double nilaiBIng;
  double nilaiMatematika;
  double nilaiAgama;

  Individu(this.nama, this.gender, this.nilaiIPA, this.nilaiIPS, this.nilaiBIng,
      this.nilaiMatematika, this.nilaiAgama);

  double hitungFitness() {
    return (nilaiIPA + nilaiIPS + nilaiBIng + nilaiMatematika + nilaiAgama) /
        5.0;
  }

  @override
  String toString() {
    return 'Nama: $nama, Gender: $gender, Nilai IPA: $nilaiIPA, Nilai IPS: $nilaiIPS, Nilai Bahasa Inggris: $nilaiBIng, Nilai Matematika: $nilaiMatematika, Nilai Agama: $nilaiAgama';
  }
}

Individu seleksi(List<Individu> populasi) {
  return populasi
      .reduce((a, b) => a.hitungFitness() > b.hitungFitness() ? a : b);
}

Individu crossover(Individu induk1, Individu induk2) {
  Random random = Random();
  double nilaiIPA =
      random.nextDouble() < 0.5 ? induk1.nilaiIPA : induk2.nilaiIPA;
  double nilaiIPS =
      random.nextDouble() < 0.5 ? induk1.nilaiIPS : induk2.nilaiIPS;
  double nilaiBIng =
      random.nextDouble() < 0.5 ? induk1.nilaiBIng : induk2.nilaiBIng;
  double nilaiMatematika = random.nextDouble() < 0.5
      ? induk1.nilaiMatematika
      : induk2.nilaiMatematika;
  double nilaiAgama =
      random.nextDouble() < 0.5 ? induk1.nilaiAgama : induk2.nilaiAgama;

  // Menyalin nama dan gender dari salah satu induk
  String nama = random.nextBool() ? induk1.nama : induk2.nama;
  String gender = random.nextBool() ? induk1.gender : induk2.gender;

  return Individu(
      nama, gender, nilaiIPA, nilaiIPS, nilaiBIng, nilaiMatematika, nilaiAgama);
}

Individu mutasi(Individu individu, double probMutasi) {
  Random random = Random();
  double nilaiIPA = individu.nilaiIPA;
  double nilaiIPS = individu.nilaiIPS;
  double nilaiBIng = individu.nilaiBIng;
  double nilaiMatematika = individu.nilaiMatematika;
  double nilaiAgama = individu.nilaiAgama;
  if (random.nextDouble() < probMutasi) {
    nilaiIPA +=
        (random.nextDouble() - 0.5) * 20; // Nilai mutasi antara -10 dan 10
    nilaiIPS += (random.nextDouble() - 0.5) * 20;
    nilaiBIng += (random.nextDouble() - 0.5) * 20;
    nilaiMatematika += (random.nextDouble() - 0.5) * 20;
    nilaiAgama += (random.nextDouble() - 0.5) * 20;
    nilaiIPA =
        nilaiIPA.clamp(0, 100); // Memastikan nilai berada dalam rentang 0-100
    nilaiIPS = nilaiIPS.clamp(0, 100);
    nilaiBIng = nilaiBIng.clamp(0, 100);
    nilaiMatematika = nilaiMatematika.clamp(0, 100);
    nilaiAgama = nilaiAgama.clamp(0, 100);
  }
  return Individu(individu.nama, individu.gender, nilaiIPA, nilaiIPS, nilaiBIng,
      nilaiMatematika, nilaiAgama);
}

void main() {
  List<Map<String, dynamic>> namaSiswa = [
    {"nama": "Adi", "gender": "Laki-laki"},
    {"nama": "Budi", "gender": "Laki-laki"},
    {"nama": "Citra", "gender": "Perempuan"},
    // Sisanya didefinisikan di sini...
  ];

  final int jumlahIndividu = namaSiswa.length;
  final int jumlahGenerasi = namaSiswa.length;

  List<Individu> populasi = [];
  Random random = Random();
  for (var siswaData in namaSiswa) {
    String nama = siswaData["nama"];
    String gender = siswaData["gender"];
    double nilaiIPA = random.nextDouble() * 100; // Nilai acak antara 0 dan 100
    double nilaiIPS = random.nextDouble() * 100;
    double nilaiBIng = random.nextDouble() * 100;
    double nilaiMatematika = random.nextDouble() * 100;
    double nilaiAgama = random.nextDouble() * 100;
    populasi.add(Individu(nama, gender, nilaiIPA, nilaiIPS, nilaiBIng,
        nilaiMatematika, nilaiAgama));
  }

  for (int generasi = 0; generasi < jumlahGenerasi; generasi++) {
    List<Individu> populasiBaru = [];
    for (int i = 0; i < jumlahIndividu; i++) {
      Individu induk1 = seleksi(populasi);
      Individu induk2 = seleksi(populasi);
      Individu anak = crossover(induk1, induk2);
      anak = mutasi(anak, 0.1);
      populasiBaru.add(anak);
    }
    populasi = populasiBaru;
  }

  Individu ketuaKelas = seleksi(populasi);
  print("Individu Terbaik:");
  print(ketuaKelas);
}

class KostItem {
  late String imageUrl;
  late String name;
  late String location;
  late String rating;
  late String description;
  late String noHp;
  late String? maps;
  late Fasilitas fasilitas;

  KostItem(
      {required this.imageUrl,
      required this.name,
      required this.location,
      required this.rating,
      required this.description,
      required this.noHp,
      this.maps,
      required this.fasilitas});
}

var kostItemList = [
  KostItem(
      name: 'Kost Pagaesangan',
      location: 'Pagaesangan',
      rating: '4.5',
      imageUrl: 'assets/kos1/kost_1_1.jpeg',
      noHp: "082341855964",
      maps: 'https://maps.app.goo.gl/EjAc6NiHp87U47uv6',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur',
          kamarMandi: 'Kamar Mandi',
          parkiran: 'Parkiran'),
      description:
          'Kos-kosan yang terletak di daerah pagesangan yang dekat dengan kampus Muhammadiyah mataram, sangat cocok buat calon mahasiswa selain itu dekat juga dengan kampus UIN Mataram, pasar umum pagesangan, lapangan futsal krisna dan lapangan bulu tangkis GOR Bintang'),
  KostItem(
      name: 'Kost Putri Kekalik',
      location: 'Kekalik',
      rating: '4.0',
      imageUrl: 'assets/kos2/kost_2_1.jpeg',
      noHp: "082341855964",
      maps: 'https://maps.app.goo.gl/gVB5DDxMMhhrxgLfA',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur', kamarMandi: 'Kamar Mandi', dapur: 'Dapur'),
      description:
          'Koskosan yang berada di dekat GOR bulu tangkis Garuda, dan dekat dengan kampus Universitas Mataram, selain itu daerah kos ini sangat banyak yang jualan makanan dan dekat dengan pasar'),
  KostItem(
      name: 'Kos Lingkar Selatan',
      location: 'Jempong',
      rating: '5.0',
      imageUrl: 'assets/kos3/kost_3_1.jpeg',
      noHp: "082341855964",
      fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
      description:
          'Kos Kosan yang terletak di Jempong dekat dengan kampus Yarsi Mataram, dekat dengan tempat wisata Tebolak yang lagi booming di daerah mataram, koskosan bebas, bersih'),
  KostItem(
      name: 'Kost Udayana',
      location: 'Udayana',
      rating: '5.0',
      imageUrl: 'assets/kos4/kost_4_1.jpeg',
      noHp: "082341855964",
      maps: 'https://maps.app.goo.gl/2EHnmqzZxg1RV7H37',
      fasilitas:
          Fasilitas(kamarTidur: 'Kamar Tidur', kamarMandi: 'Kamar Mandi'),
      description:
          'Kos ini terletak di pusat kota Mataram, yang terletak di udayana, siapa yang tidak tau udayana tempat ex bandara internasional lombok, selain itu tempat wisatu islami yakni Islamic Centre masjid terbesar di pulau lombok, kosan ini juga sangat dekat dengan tempat olahraga dan bisa melakukan care free day pada hari minggu'),
  KostItem(
      name: 'Kost Mataram',
      location: 'Karang Tapen',
      rating: '5.0',
      imageUrl: 'assets/kos5/kost_5_1.jpg',
      noHp: "082341855964",
      maps: 'https://goo.gl/maps/mAs17geuiw87oCwN7',
      fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
      description:
          'Koskosan yang terletak di samping Idoop Hotel dan dekat dengan Kampus Universitas Bumgigora cocok buat Calon Mahasiswa, selain itu kosan ini murah bisa perbulan dan pertahun'),
  KostItem(
      name: 'Kost Pak Bambang',
      location: 'Karang Tapen',
      rating: '5.0',
      imageUrl: 'assets/kos6/kost_6_2.jpeg',
      noHp: "0881037129405",
      fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
      description:
          'Kos kosan yang berada di dekat kampus Universitas Bumigora dan Mataram Mall, selain itu kosan ini terletak di dekat masjid Nurul Huda Karang Tapen, tempat berada di dekat jalan raya, disamping kos ada tempat Photocopy dan pasar karang jasi'),
  KostItem(
      name: 'Kost Karang Jangkong',
      location: 'Karang Jangkong',
      rating: '5.0',
      imageUrl: 'assets/kos7/kost_7_2.jpeg',
      noHp: "082341855964",
      maps: 'https://maps.app.goo.gl/2ryf8YXnCzRU6DWV7 ',
      fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
      description:
          'Kos kosan yang berada di depan Mataram Mall, lokasi yang strategis yang dekat dengan pedagang kaki 5, banyak tempat nongkrong seperti cafe Kafein di dekat kos tersebut'),
  KostItem(
      name: 'Kost Pondok Indah',
      location: 'Kekalik',
      rating: '4.6',
      imageUrl: 'assets/kos8/1.png',
      noHp: "081236296499",
      maps: 'https://maps.app.goo.gl/SVmadvshUM3Ctygk6',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur',
          kamarMandi: 'Kamar Mandi',
          ac: 'AC',
          lemari: 'Lemari',
          springBed: 'Spring Bed'),
      description:
          'Koskosan yang sangat nyaman dan cocok buat yang berkeluarga namun bisa juga buat mahasiswa karena dekat dengan kampus Universitas Mataram dan dekat dengan salah satu pantai di Mataram yakni Pantai Loang Baloq dan Pantai Gading'),
  KostItem(
      name: 'Kost Rahayu',
      location: 'Pejanggik',
      rating: '3,7',
      imageUrl: 'assets/kos9/1.jpeg',
      noHp: "081337283176",
      maps: 'https://maps.app.goo.gl/JAFBMdbfMJ4fLVEP9',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur',
          kamarMandi: 'Kamar Mandi',
          ac: 'AC',
          lemari: 'Lemari',
          springBed: 'Spring Bed'),
      description:
          'kos kosan yang terletak di belakang Mataram Mall dan disamping kos terdapat Gramedia yang sangat cocok buat Pelajar atau Mahasiswa, selain itu dekat dengan Pom Bensin dan Kantor Gubernur Nusa Tenggara Barat'),
  KostItem(
      name: 'Kos Mio Green 1',
      location: 'Monjok Barat',
      rating: '4.3',
      imageUrl: 'assets/kos10/1.jpeg',
      noHp: "087865249136",
      maps: 'https://maps.app.goo.gl/KtErQgPYBgWGqumUA',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur',
          kamarMandi: 'Kamar Mandi',
          lemari: 'Lemari',
          springBed: 'Spring Bed',
          parkiran: 'Parkiran Motor',
          tv: 'Televisi'),
      description:
          'Koskosan yang terletak di Jl. Dewi Sartika No.22, Monjok Bar., Kec. Selaparang, Kota Mataram, kosan Elit yang bersih nyaman dan dekat dengan tempat makan yang berada di lombok yakni Makanan Ayam Taliwang'),
  KostItem(
      name: 'Kos Mio Green 2',
      location: 'Monjok',
      rating: '4.3',
      imageUrl: 'assets/kos11/1.jpeg',
      noHp: "087865249136",
      maps: 'https://maps.app.goo.gl/YuZDWuS4FQoRb9k99',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur',
          kamarMandi: 'Kamar Mandi',
          ac: 'AC',
          lemari: 'Lemari',
          springBed: 'Spring Bed',
          tv: 'Televisi'),
      description:
          'Cabang kedua kosan kami yang terletak di Jl. Semanggi III No.11, Monjok Bar., Kec. Selaparang, Kota Mataram, tidak jauh dari kos pertama kami yakni Kos Mio Green 2 namun tempat ini lebih mewah karena sudah ditambahkan AC '),
  KostItem(
      name: 'Kos Elite Pagesangan',
      location: 'Pagesangan',
      rating: '4.0',
      imageUrl: 'assets/kos12/1.jpeg',
      noHp: "082341918065",
      maps: 'https://maps.app.goo.gl/YuZDWuS4FQoRb9k99',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur',
          kamarMandi: 'Kamar Mandi',
          ac: 'AC',
          lemari: 'Lemari',
          springBed: 'Spring Bed',
          tv: 'Televisi',
          dapur: 'Dapur',
          parkiran: 'Parkiran'),
      description:
          'Kos ELite mewah yang terletak di pagesangan tinggal bawa pakaian karena semua perlengkapan sudah disiapkan, dekat dengan kampus UIN Mataram dan Kampu Muhammadiyah Mataram'),
  KostItem(
      name: 'Rumah Kost',
      location: 'Turida',
      rating: '4.8',
      imageUrl: 'assets/kos13/1.jpeg',
      noHp: "08197218251",
      maps: 'https://maps.app.goo.gl/kuTDpm7LNStsvuk16',
      fasilitas: Fasilitas(
          kamarTidur: 'Kamar Tidur',
          kamarMandi: 'Kamar Mandi',
          lemari: 'Lemari',
          springBed: 'Spring Bed',
          dapur: 'Dapur',
          parkiran: 'Parkiran Mobil / Motor'),
      description:
          'Rumah Kost adalah tempat penginapan yang berada di daerah Turida Sandubaya, Kosan yang berada di dekat Gedung Olahraga 14 Desember, lokasi kos dekat dengan Lombok Post dan Kampus Universitas Al Azhar Mataram'),
  KostItem(
    name: 'Mahaba Kost',
    location: 'Jempong Baru',
    rating: '4.8',
    imageUrl: 'assets/kos14/1.jpeg',
    noHp: "085652243340",
    maps: 'https://maps.app.goo.gl/ozzoJc9JjCNt9zr67',
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        lemari: 'Lemari',
        springBed: 'Spring Bed',
        dapur: 'Dapur',
        parkiran: 'Parkiran Mobil / Motor'),
    description:
        'Koskosan mewah yang terletak di jempong baru sekarbela, dekat dengan pantai Loang baloq dan pantai gading, dari desain rumah hingga kamar sudah dibuat secara modern dan terkini, sudah disediakan dapur dan wastafel yang akan membuat betah untuk bertempat tinggal',
  ),
  KostItem(
    name: 'D Mawar Kost',
    location: 'Pagesangan',
    rating: '4.7',
    imageUrl: 'assets/kos15/1.jpeg',
    noHp: "081338291268",
    maps: 'https://maps.app.goo.gl/CwPrWy13PcbASMe48',
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        springBed: 'Spring Bed',
        parkiran: 'Parkiran Motor'),
    description:
        'koskosan luas dan elegan kosan yang terletak dipagesangan dekat dengan RSUD kota Mataram, pertengahan kota, dekat dengan Lombok Epicentrum Mall, pertengahan dari semua kampus terkenal di Mataram seperti UIN Mataram, Universitas Mataram, Universitas Bumigora, Universitas 45 dan Universitas Muhamadiyah',
  ),
  KostItem(
    name: 'Kost Dewi',
    location: 'Pagutan',
    rating: '4.9',
    imageUrl: 'assets/kos16/1.jpeg',
    noHp: "081915966667",
    maps: 'https://maps.app.goo.gl/3gWRLEWCFXiB4NAL6',
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        lemari: 'Lemari',
        springBed: 'Spring Bed',
        parkiran: 'Parkiran Motor'),
    description:
        'koskosan dengan temapt yang strategis dan dekat dengan kampus kampus besar di sekitar kota Mataram, lingkungan yang bersih dan penghuninya di jamin ramah, sangat di rekomendasi bagi pelajar yang ingin bertemapat tinggal dan sudah disediakan berugak untuk menerima tamu',
  ),
  KostItem(
    name: 'Nanda Kost',
    location: 'Dasan Cermen',
    rating: '4.9',
    imageUrl: 'assets/kos17/1.jpeg',
    noHp: "081907177747",
    maps: 'https://maps.app.goo.gl/V32rC8ejRvwYystZ8',
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        lemari: 'Lemari',
        springBed: 'Spring Bed',
        parkiran: 'Parkiran Motor'),
    description:
        'Nanda Kost adalah tempat penginapan bersih dan nyaman yang berlokasi di dasan cermen, lokasi kosan dekat dengan Rumah Sakit Umum Provinsi Nusa Tenggara Barat dan dekat dengan Pom Bensin, dan cocok untuk pelajar karena dekat dengan SMAN 8 Mataram dan pusat perbelanjaan yang paling ramai di Mataram yakni Lotte',
  ),
  KostItem(
    name: 'Pondok Nabila',
    location: 'Kekalik Jaya',
    rating: '4.0',
    imageUrl: 'assets/kos18/1.jpeg',
    noHp: "082166098792",
    maps: 'https://maps.app.goo.gl/kwSGQb37V2fuQvpt6',
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        lemari: 'Lemari',
        springBed: 'Spring Bed',
        parkiran: 'Parkiran Motor'),
    description:
        'Koskosan khusus putri yang terletak di Kekalik Jaya sangat cocok untuk Mahasiswi yang berasal dari luar kota Mataram, kosan bersih, nyaman dan terletak di dekat kampus Universitas Mataram dan Kampus Universitas Teknologi Mataram',
  ),
  KostItem(
    name: 'Kost Omah dToh',
    location: 'Pagesangan',
    rating: '4.9',
    imageUrl: 'assets/kos19/1.jpeg',
    noHp: "085333964599",
    maps: 'https://maps.app.goo.gl/tNCZjFy1X6tj3xa2A',
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        lemari: 'Lemari',
        parkiran: 'Parkiran Motor',
        dapur: 'Dapur'),
    description:
        'Koskosan bersih nyaman dan dekat dekat dengan pasar pagesangan, selain itu lokasi dari kosan ini juga dekat dengan Kampus UIN Mataram yang letaknya di Jempong, lokasi kosan yang strategis dan dekat dengan pasar umum pagesangan',
  ),
  KostItem(
    name: 'Manarat Green House \nKost Putri',
    location: 'Kekalik Jaya',
    rating: '4.7',
    imageUrl: 'assets/kos20/1.jpeg',
    noHp: "087761200070",
    maps: 'https://maps.app.goo.gl/zzxe8fPUfUsk6Wqt9',
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        lemari: 'Lemari',
        wifi: 'Wifi',
        dapur: 'Dapur',
        parkiran: 'Parkiran Motor'),
    description:
        'Koskosan yang berada di Kekalik, koskosan khusus untuk putri dengan fasiltas yang sangat lengkap akan membuat sangat betah berada di dalam kos, selain itu lokasi yang strategis dengan dengan kampus Universitas Mataram dan SMAN 2 Mataram sekaligus Museum Nusa Tenggara Barat, kosan bersih nyaman dan tetangga yang ramah.',
  ),
];

class Fasilitas {
  late String? kamarTidur;
  late String? kamarMandi;
  late String? parkiran;
  late String? dapur;
  late String? springBed;
  late String? lemari;
  late String? ac;
  late String? kulkas;
  late String? tv;
  late String? wifi;

  Fasilitas({
    this.kamarTidur,
    this.kamarMandi,
    this.parkiran,
    this.dapur,
    this.springBed,
    this.lemari,
    this.ac,
    this.kulkas,
    this.tv,
    this.wifi,
  });
}

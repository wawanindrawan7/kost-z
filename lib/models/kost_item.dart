class KostItem {
  late String imageUrl;
  late String name;
  late String location;
  late String rating;
  late double price;
  late int noHp;
  late Fasilitas fasilitas;

  KostItem(
      {required this.imageUrl,
      required this.name,
      required this.location,
      required this.rating,
      required this.price,
      required this.noHp,
      required this.fasilitas});
}

var kostItemList = [
  KostItem(
    name: 'Kost Kece',
    location: 'Lombok Tengah',
    rating: '4.5',
    imageUrl: 'assets/kos1/kost_1_1.jpeg',
    price: 18000000,
    noHp: 082341855964,
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        parkiran: 'Parkiran'),
  ),
  KostItem(
    name: 'Kost Bagus',
    location: 'Lombok Selatan',
    rating: '4.0',
    imageUrl: 'assets/kos2/kost_2_1.jpeg',
    price: 18000000,
    noHp: 082341855964,
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur', kamarMandi: 'Kamar Mandi', dapur: 'Dapur'),
  ),
  KostItem(
    name: 'Kost Megah',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos3/kost_3_1.jpeg',
    price: 18000000,
    noHp: 082341855964,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
  KostItem(
    name: 'Kost Mantap',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos4/kost_4_1.jpeg',
    price: 18000000,
    noHp: 082341855964,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
  KostItem(
    name: 'Kost Mantap',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos5/kost_5_1.jpg',
    price: 18000000,
    noHp: 082341855964,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
  KostItem(
    name: 'Kost Mantap',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos6/kost_6_2.jpeg',
    price: 18000000,
    noHp: 082341855964,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
  KostItem(
    name: 'Kost Mantap',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos7/kost_7_2.jpeg',
    price: 18000000,
    noHp: 082341855964,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
  KostItem(
    name: 'Kost Alvino',
    location: 'Karang Tapen',
    rating: '5.0',
    imageUrl: 'assets/kos8/kost_8_1.jpg',
    price: 1500000,
    noHp: 085338623002,
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        lemari: 'Lemari',
        tv: 'Televisi',
        parkiran: 'Parkiran Mobil/Motor',
        springBed: 'Spring Bed',
        ac: 'AC'),
  ),
  KostItem(
    name: 'Kost Aurora',
    location: 'Gerung',
    rating: '5.0',
    imageUrl: 'assets/kos9/kost_9_1.jpg',
    price: 600000,
    noHp: 081907111714,
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        dapur: 'Dapur',
        lemari: 'Lemari',
        springBed: 'Spring Bed'),
  ),
  KostItem(
    name: 'Kost Made Artana',
    location: 'Cakra',
    rating: '5.0',
    imageUrl: 'assets/kos10/kos_10_1.jpg',
    price: 500000,
    noHp: 087865722725,
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        dapur: 'Dapur',
        lemari: 'Lemari',
        springBed: 'Spring Bed'),
  ),
  KostItem(
    name: 'Kost Made Artana',
    location: 'Cakra',
    rating: '5.0',
    imageUrl: 'assets/kos11/kos_11_1.jpg',
    price: 550000,
    noHp: 087765644187,
    fasilitas: Fasilitas(
      kamarTidur: 'Kamar Tidur',
      kamarMandi: 'Kamar Mandi',
      dapur: 'Dapur',
      lemari: 'Lemari',
    ),
  ),
  KostItem(
    name: 'Kost Elite Pagesangan;',
    location: 'Pagesangan',
    rating: '5.0',
    imageUrl: 'assets/kos12/kos_12_1.jpg',
    price: 550000,
    noHp: 081239811616,
    fasilitas: Fasilitas(
      kamarTidur: 'Kamar Tidur',
      kamarMandi: 'Kamar Mandi',
      dapur: 'Dapur',
      lemari: 'Lemari',
      springBed: 'Spring Bed',
      tv: 'Televisi',
    ),
  ),
  KostItem(
    name: 'Kost Dewi',
    location: 'Pagesangan Baru',
    rating: '5.0',
    imageUrl: 'assets/kos13/kos_13_1.jpg',
    price: 550000,
    noHp: 081239811616,
    fasilitas: Fasilitas(
      kamarTidur: 'Kamar Tidur',
      kamarMandi: 'Kamar Mandi',
      dapur: 'Dapur',
      lemari: 'Lemari',
      springBed: 'Spring Bed',
    ),
  ),
  KostItem(
    name: 'Kost Sulendra',
    location: 'Karang Medain',
    rating: '5.0',
    imageUrl: 'assets/kos14/kos_14_1.jpg',
    price: 550000,
    noHp: 08175772709,
    fasilitas: Fasilitas(
      kamarTidur: 'Kamar Tidur',
      kamarMandi: 'Kamar Mandi',
    ),
  ),
  KostItem(
    name: 'Kost Dany Styawan',
    location: 'Kekalik',
    rating: '5.0',
    imageUrl: 'assets/kos15/kos_15_1.jpg',
    price: 4500000,
    noHp: 087855218257,
    fasilitas: Fasilitas(
      kamarTidur: 'Kamar Tidur',
      kamarMandi: 'Kamar Mandi',
    ),
  ),
  KostItem(
    name: 'Kost Dimas Suryo',
    location: 'Rembiga',
    rating: '5.0',
    imageUrl: 'assets/kos16/kos16_1.jpg',
    price: 4500000,
    noHp: 087855218257,
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur',
        kamarMandi: 'Kamar Mandi',
        ac: 'AC',
        lemari: 'Lemari',
        springBed: 'Spring Bed'),
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
  });
}

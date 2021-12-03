class KostItem {
  late String imageUrl;
  late String name;
  late String location;
  late String rating;
  late double price;
  late Fasilitas fasilitas;

  KostItem(
      {required this.imageUrl,
      required this.name,
      required this.location,
      required this.rating,
      required this.price,
      required this.fasilitas});
}

var kostItemList = [
  KostItem(
    name: 'Kost Kece',
    location: 'Lombok Tengah',
    rating: '4.5',
    imageUrl: 'assets/kos1/kost_1_1.jpeg',
    price: 18000000,
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
    fasilitas: Fasilitas(
        kamarTidur: 'Kamar Tidur', kamarMandi: 'Kamar Mandi', dapur: 'Dapur'),
  ),
  KostItem(
    name: 'Kost Megah',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos3/kost_3_1.jpeg',
    price: 18000000,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
  KostItem(
    name: 'Kost Mantap',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos4/kost_4_1.jpeg',
    price: 18000000,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
  KostItem(
    name: 'Kost Mantap',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos5/kost_5_1.jpg',
    price: 18000000,
    fasilitas: Fasilitas(kamarTidur: 'kamarTidur', kamarMandi: 'kamarMandi'),
  ),
];

class Fasilitas {
  late String? kamarTidur;
  late String? kamarMandi;
  late String? parkiran;
  late String? dapur;
  late String? springBed;
  late String? lemari;

  Fasilitas(
      {this.kamarTidur,
      this.kamarMandi,
      this.parkiran,
      this.dapur,
      this.springBed,
      this.lemari});
}

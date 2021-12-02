class KostItem {
  late String imageUrl;
  late String name;
  late String location;
  late String rating;

  KostItem({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
  });
}

var kostItemList = [
  KostItem(
    name: 'Kost Kece',
    location: 'Lombok Tengah',
    rating: '4.5',
    imageUrl: 'assets/kos1/kost_1_1.jpeg',
  ),
  KostItem(
    name: 'Kost Bagus',
    location: 'Lombok Selatan',
    rating: '4.0',
    imageUrl: 'assets/kos1/kost_1_2.jpeg',
  ),
  KostItem(
    name: 'Kost Megah',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos1/kost_1_3.jpeg',
  ),
  KostItem(
    name: 'Kost Mantap',
    location: 'Lombok Tengah',
    rating: '5.0',
    imageUrl: 'assets/kos1/kost_1_4.jpeg',
  ),
];

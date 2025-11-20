import 'package:movie_com/models/model.dart';

class MovieController {
  final List<MovieModel> movies = [
    MovieModel(
      id: 1,
      title: 'Bunga Dahlia',
      overview: 
          'Dahlia adalah tanaman perdu berumbi yang sifatnya tahunan (perenial), berbunga di musim panas sampai musim gugur.',
      voteAverage: 8.8,
      posterPath:
          'https://www.shutterstock.com/image-photo/single-pink-purple-dahlia-flower-600nw-2628201123.jpg'
    ),
    MovieModel(
      id: 2,
      title: 'Bunga Tulip',
      overview:
          'Tulip adalah tanaman geofit bulbiferus herba abadi yang mekar di musim semi dalam genus Tulipa.',
      voteAverage: 9.0,
      posterPath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS97_bC_vwlKfRQgkDe7H0hfU197WbUJLin9g&s',
    ),
    MovieModel(
      id: 3,
      title: 'Bunga Mawar',
      overview:
          'Mawar memiliki ketinggian antara 2 hingga 5 meter dan dikenal dengan batangnya yang berduri, yang berfungsi sebagai pegangan',
      voteAverage: 9.0,
      posterPath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-W-vevRd32YVVHUWvAhbWk3zD2keWd3Dz8A&s',
    ),
    MovieModel(
      id: 4,
      title: 'Bunga Melati',
    overview:
          'Bunga melati (Jasminum sambac) merupakan salah satu bunga yang mewakili karakter bangsa dan Negara Indonesia.',
      voteAverage: 8.7,
      posterPath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFZwtEfuQlPzDXyHrsuuBA6H9qBmUTBmzHUrJYKIthSCyuBU-MuG-aJkxit5ICJmkcws4&usqp=CAU',
    ),
    MovieModel(
      id: 5,
      title: 'Bunga Matahari',
      overview:
          'Bunga matahari biasa sebenarnya adalah pseudanthium, atau kepala bunga, yang terdiri dari banyak bunga kecil.',
      voteAverage: 8.7,
      posterPath:
          'https://cdn.pixabay.com/photo/2025/08/20/02/47/sunflower-9784693_1280.jpg',
    ),
  ];
}
import 'package:flutter/material.dart';
import 'package:movie_com/controller/controller.dart';
import 'package:movie_com/models/dummy_data.dart';
import 'package:movie_com/models/model.dart';
import 'package:movie_com/models/partner_card.dart';
import 'package:movie_com/widget/widget.dart';
import 'package:movie_com/pages/list.dart';
import 'package:movie_com/pages/news_page.dart';
import 'package:movie_com/models/akun_page.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final formKey = GlobalKey<FormState>();
  MovieController movie = MovieController();
  

  TextEditingController title = TextEditingController();
  TextEditingController overview = TextEditingController();
  TextEditingController posterPath = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  TextEditingController gambar = TextEditingController();

  late List<Widget> pages;

  int _selectedIndex = 0;

  List? film;
  int? film_id;

  List buttonChoice = ["UPDATE", "DELETE"];

  void _onNavTap(int index) {
    setState(() => _selectedIndex = index);
  }

  void getFilm() {
    setState(() {
      film = movie.movies;
    });
  }

  @override
  void initState() {
    super.initState();
    getFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: const Color.fromARGB(255, 254, 176, 224),
          child: const Text(
            "Love.inBloom",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),

      body: _selectedIndex == 0
          ? buildHomeBody()
          : _selectedIndex == 1
              ? const ListPage()
              : _selectedIndex == 2
                  ? const NewsPage()
                  : const OwnerProfilePage(),

      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(index: 0, icon: Icons.home, label: "Home"),
            _navItem(index: 1, icon: Icons.list_alt, label: "List"),
            _navItem(index: 2, icon: Icons.newspaper, label: "News"),
            _navItem(index: 3, icon: Icons.person, label: "Account"),
          ],
        ),
      ),
    );
  }

  // ================================
  // HOME BODY
  // ================================
  Widget buildHomeBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // PARTNER SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Official Partner Store",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 16)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Partner Pemesanan Bunga Premium Kami",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 12),
              itemCount: officialPartners.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return PartnerCard(
                  image: officialPartners[index],
                  onTap: () {},
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // FINANCIAL PARTNER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Financial Partner",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 16)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Solusi pembiayaan untuk proyek Renovasi",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 12),
              itemCount: financialPartners.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return PartnerCard(
                  image: financialPartners[index],
                  onTap: () {},
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // HEADER LIST BUNGA
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("List Bunga",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      "Koleksi bunga terbaik untukmu",
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                  ],
                ),

                IconButton(
                  icon: const Icon(Icons.star_border_purple500_rounded),
                  onPressed: () {
                    setState(() {
                      film_id = null;
                    });
                    title.clear();
                    overview.clear();
                    voteAverage.clear();
                    posterPath.clear();

                    ModalWidget().showFullModal(context, addItem(null));
                  },
                )
              ],
            ),
          ),

          // LIST BUNGA
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: film?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Card(
                  elevation: 6,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    onTap: () {
                      film_id = film![index].id;
                      title.text = film![index].title;
                      overview.text = film![index].overview;
                      posterPath.text = film![index].posterPath;
                      voteAverage.text = (film![index].voteAverage ?? 0).toString();

                      ModalWidget().showFullModal(context, updateAndDelete(index));
                    },
                    leading: Image.network(film![index].posterPath),
                    title: Text(film![index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          film![index].overview,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 2,
                          children: List.generate(5, (star) {
                            return Icon(
                              star <
                                      (film![index].voteAverage?.round() ?? 0)
                                  ? Icons.star
                                  : Icons.star_border,
                              color:
                                  const Color.fromARGB(255, 245, 209, 81),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ================================
  // NAV ITEM
  // ================================
  Widget _navItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    bool selected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onNavTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                selected ? const Color.fromARGB(255, 239, 130, 197) : Colors.grey,
            size: selected ? 30 : 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: selected
                  ? const Color.fromARGB(255, 239, 130, 197)
                  : Colors.grey,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  // ================================
  // MODAL ADD ITEM FORM
  // ================================
  Widget addItem(int? index) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: title,
            decoration: const InputDecoration(labelText: "Title"),
            validator: (v) => v!.isEmpty ? "Title is required" : null,
          ),
          TextFormField(
            controller: overview,
            decoration: const InputDecoration(labelText: "Overview"),
            validator: (v) => v!.isEmpty ? "Overview is required" : null,
          ),
          TextFormField(
            controller: posterPath,
            decoration: const InputDecoration(labelText: "Poster Path"),
            validator: (v) => v!.isEmpty ? "Poster path is required" : null,
          ),
          TextFormField(
            controller: voteAverage,
            decoration: const InputDecoration(labelText: "Vote Average"),
            validator: (v) => v!.isEmpty ? "Vote average required" : null,
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (index != null) {
                  film![index].id = film_id;
                  film![index].title = title.text;
                  film![index].overview = overview.text;
                  film![index].posterPath = posterPath.text;
                  film![index].voteAverage =
                      double.tryParse(voteAverage.text);

                  getFilm();
                  Navigator.pop(context);
                } else {
                  int id_film = film!.length + 1;
                  film!.add(
                    MovieModel(
                      id: id_film,
                      title: title.text,
                      overview: overview.text,
                      posterPath: posterPath.text,
                      voteAverage: double.parse(voteAverage.text),
                    ),
                  );
                  getFilm();
                  Navigator.pop(context);
                }
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
  Widget updateAndDelete(int index) {
    return Column(
      children: [
        // Menggunakan addItem untuk form update
        addItem(index), 

        const SizedBox(height: 20),

        // Tombol DELETE
        ElevatedButton(
          onPressed: () {
            movie.movies.removeAt(index);
            getFilm();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text("DELETE"),
        ),
      ],
    );
  }

}

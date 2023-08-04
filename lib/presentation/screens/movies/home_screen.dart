import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(moviesSlideshowProvider);
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMoviesProvider = ref.watch(moviesSlideshowProvider);

    if (slideshowMoviesProvider.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideShow(movies: slideshowMoviesProvider),
      ],
    );
  }
}

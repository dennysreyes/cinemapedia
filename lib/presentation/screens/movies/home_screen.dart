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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideshowMoviesProvider = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          toolbarHeight: 50,
          floating: true,
          title: CustomAppBar(),
          // flexibleSpace: FlexibleSpaceBar(
          // title: CustomAppBar(),
          // ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  // const CustomAppBar(),
                  MoviesSlideShow(movies: slideshowMoviesProvider),
                  MoviesHorizontalListView(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subtitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MoviesHorizontalListView(
                    movies: popularMovies,
                    title: 'Populares',
                    subtitle: 'Actualmente',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
                  MoviesHorizontalListView(
                    movies: topRatedMovies,
                    title: 'Más valorado',
                    subtitle: 'Actualmente',
                    loadNextPage: () => ref
                        .read(topRatedMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MoviesHorizontalListView(
                    movies: upcomingMovies,
                    title: 'Muy pronto',
                    // subtitle: '',
                    loadNextPage: () => ref
                        .read(upcomingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}

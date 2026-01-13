import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({
    super.key,
    required this.books,
    this.isLoadingMore = false,  
  });
  
  final List<BookEntity> books;
  final bool isLoadingMore;

  @override
  State<FeaturedListView> createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isAtEnd()) {
      context.read<FeaturedBooksCubit>().fetchMoreFeaturedBooks();
    }
  }

  bool _isAtEnd() {
    if (!_scrollController.hasClients) return false;
    
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    
    return (maxScroll - currentScroll) <= 50;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        
        key: const PageStorageKey<String>('featured_list'),
        
        itemCount: widget.isLoadingMore 
            ? widget.books.length + 1 
            : widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          
          if (index == widget.books.length && widget.isLoadingMore) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomBookImage(
              imageUrl: widget.books[index].image ?? "",
            ),
          );
        },
      ),
    );
  }
}
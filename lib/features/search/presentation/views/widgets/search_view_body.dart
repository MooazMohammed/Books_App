import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_application_1/features/search/presentation/views/widgets/custom_search_view_text_field.dart';
import 'package:flutter_application_1/features/search/presentation/views/widgets/search_result_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: kPadding,
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField(),
            SizedBox(height: 20),
            Text("Search Result", style: Styles.textStyle20),
            SizedBox(height: 20),
            Expanded(child: SearchResultListView()),
          ],
        ),
      
    );
  }
}

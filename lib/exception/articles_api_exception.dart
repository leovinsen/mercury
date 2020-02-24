class NewsSourceIsNullException implements Exception {
  final String msg;

  NewsSourceIsNullException() : msg = "Please enter a non-null value for news source ID!";
}

class SearchQueryIsNullException implements Exception {
  final String msg;
  
  SearchQueryIsNullException() : msg = "Please enter a non-null value for search query!";
}

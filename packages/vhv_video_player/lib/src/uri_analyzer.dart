
bool useYoutubePlayer(String url) {
  return url.contains('youtube');
}

bool _isValidUrl(String url) {
  try {
    final uri = Uri.parse(url);
    return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
  } catch (e) {
    return false;
  }
}

String extractYoutubeVideoId(String url) {
  if (!_isValidUrl(url)) {
    throw Exception('Invalid URL: $url');
  }

  final List<String> prefixPaths = [
    'https://www.youtube.com/watch?v=',
    'https://youtu.be/',
    'https://www.youtube.com/embed/',
    'https://www.youtube.com/v/',
  ];

  for (final prefixPath in prefixPaths) {
    if (url.startsWith(prefixPath)) {
      return url.substring(prefixPath.length).split(RegExp(r'[?|&]')).first;
    }
  }

  throw Exception('Invalid Youtube Video Url: $url');
}

String standardizedUrl(String url) {
  return 'https://www.youtube.com/embed/${extractYoutubeVideoId(url)}' ;
}

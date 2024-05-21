class NewsApiEndpoint {
  final String domain;
  final String resource;
  final Protocol protocol;

  NewsApiEndpoint({
    required this.domain,
    required this.resource,
    this.protocol = Protocol.https,
  });

  String get apiUrl => '${protocol.name}://$domain/api/$resource';

  String get fileUrl => '${protocol.name}://$domain/$resource';
}

enum Protocol {
  http,
  https,
}

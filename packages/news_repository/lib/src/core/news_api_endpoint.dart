class NewApiEndpoint {
  final String domain;
  final String resource;
  final Protocol protocol;

  NewApiEndpoint({
    required this.domain,
    required this.resource,
    this.protocol = Protocol.https,
  });

  String get url => '${protocol.name}://$domain/api/$resource';
}

enum Protocol {
  http,
  https,
}

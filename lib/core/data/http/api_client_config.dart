class ApiClientConfig {
  final String baseUrl;
  final bool isDebug;


  ApiClientConfig({required this.baseUrl, required this.isDebug});


  bool get isNotDebug {
    return !isDebug;
  }
}

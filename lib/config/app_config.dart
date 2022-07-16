class AppConfig {
  String? appName;
  String? baseUrl;

  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  void fromJson(Map<String, dynamic> json) {
    appName = json['appName'].toString();
    baseUrl = json['baseUrl'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appName'] = appName;
    data['baseUrl'] = baseUrl;
    return data;
  }
}

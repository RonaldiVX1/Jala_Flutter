class RegionRequestModel {
  RegionRequestModel({String? has, String? search})
      : _has = has ?? "shrimp_prices",
        _search = search ?? "";

  final String _has;
  final String _search;

  Map<String, dynamic> toJson() => {
        'has': _has,
        'search': _search,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

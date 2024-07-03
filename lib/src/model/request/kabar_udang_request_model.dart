class KabarUdangRequestModel {
  KabarUdangRequestModel({int? perPage, int? page, String? region})
      : _perPage = perPage ?? 15,
        _page = page ?? 1,
        _region = region ?? "creator";

  final int _perPage;
  final int _page;
  final String _region;

  Map<String, dynamic> toJson() => {
        'per_page': _perPage,
        'page': _page,
        'with': _region,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class PenyakitRequestModel {
  PenyakitRequestModel({int? perPage, int? page})
      : _perPage = perPage ?? 15,
        _page = page ?? 1;

  final int _perPage;
  final int _page;

  Map<String, dynamic> toJson() => {
        'per_page': _perPage,
        'page': _page,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

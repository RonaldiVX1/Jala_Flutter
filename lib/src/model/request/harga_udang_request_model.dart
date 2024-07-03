class HargaUdangRequestModel {
  HargaUdangRequestModel(
      {int? perPage, int? page, String? region, String? regionId})
      : _perPage = perPage ?? 15,
        _page = page ?? 1,
        _region = region ?? "region,creator",
        _regionId = regionId ?? "";

  final int _perPage;
  final int _page;
  final String _region;
  final String _regionId;

  Map<String, dynamic> toJson() => {
        'per_page': _perPage,
        'page': _page,
        'with': _region,
        'region_id': _regionId,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

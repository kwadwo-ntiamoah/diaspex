class Pager {
  final String page, pageSize;

  Pager({ required this.page, required this.pageSize });

  toQueryParams() {
    Map<String, dynamic> queryParams = {
      "page": page,
      "pageSize": pageSize
    };

    return queryParams;
  }
}
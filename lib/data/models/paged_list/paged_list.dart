import 'package:json_annotation/json_annotation.dart';

part 'paged_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagedList {
  final int page, pageSize, totalCount;
  final bool hasNextPage, hasPreviousPage;
  final List<dynamic> items;

  PagedList({
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.items
  });

  factory PagedList.fromJson(Map<String, dynamic> json) =>
      _$PagedListFromJson(json);

  Map<String, dynamic> toJson() => _$PagedListToJson(this);
}

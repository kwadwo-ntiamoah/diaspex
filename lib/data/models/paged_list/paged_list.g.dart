// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedList _$PagedListFromJson(Map<String, dynamic> json) => PagedList(
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      totalCount: json['totalCount'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
      items: json['items'] as List<dynamic>,
    );

Map<String, dynamic> _$PagedListToJson(PagedList instance) => <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'items': instance.items,
    };

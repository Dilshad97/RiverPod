// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      json['userId'] as int?,
      json['title'] as String?,
      json['body'] as String?,
      json['id'] as int?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'id': instance.id,
    };

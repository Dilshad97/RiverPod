import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class Users {
  int? userId;
  String? title;
  String? body;
  int? id;

Users(this.userId,this.title,this.body,this.id);

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);


}


import 'dart:convert';

import 'package:json_place_holder_list/Layers/domain/entities/list_posts_entity.dart';

class PostsDto extends ListPostsEntity {
  
  final int idDto;
  final String titleDto;
  final String bodyDto;

  PostsDto({
    required this.idDto,
    required this.titleDto,
    required this.bodyDto,
  }) : super(id: idDto, title: titleDto, body: bodyDto);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PostsDto &&
      other.idDto == idDto &&
      other.titleDto == titleDto &&
      other.bodyDto == bodyDto;
  }

  @override
  int get hashCode => idDto.hashCode ^ titleDto.hashCode ^ bodyDto.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'idDto': idDto,
      'titleDto': titleDto,
      'bodyDto': bodyDto,
    };
  }

  factory PostsDto.fromMap(Map<String, dynamic> map) {
    return PostsDto(
      idDto: map['id']?.toInt() ?? 0,
      titleDto: map['title'] ?? '',
      bodyDto: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsDto.fromJson(String source) => PostsDto.fromMap(json.decode(source));
}

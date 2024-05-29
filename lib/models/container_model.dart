import 'dart:convert';

ContainerModel containerModelFromJson(String str) => ContainerModel.fromJson(json.decode(str));

String containerModelToJson(ContainerModel data) => json.encode(data.toJson());

class ContainerModel {
  double? height;
  double? width;
  double? borderRadius;
  int? flexPhoto;
  int? flexText;

  ContainerModel({
    this.height,
    this.width,
    this.borderRadius,
    this.flexPhoto,
    this.flexText
  });

  factory ContainerModel.fromJson(Map<String, dynamic> json) => ContainerModel(
    height: json["height"]?.toDouble(),
    width: json["width"]?.toDouble(),
    borderRadius: json["borderRadius"]?.toDouble(),
    flexPhoto: json["flexPhoto"],
    flexText: json["flexText"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "borderRadius": borderRadius,
    "flexPhoto": flexPhoto,
    "flexText": flexText,
  };
}

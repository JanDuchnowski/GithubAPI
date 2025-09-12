import 'package:json_annotation/json_annotation.dart';
part 'license_model.g.dart';

@JsonSerializable()
class License {
  final String? key;
  final String? name;
  @JsonKey(name: 'spdx_id')
  final String? spdxId;
  final String? url;
  @JsonKey(name: 'node_id')
  final String? nodeId;

  License({this.key, this.name, this.spdxId, this.url, this.nodeId});

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}

// To parse this JSON data, do
//
//     final kipssUser = kipssUserFromJson(jsonString);

import 'dart:convert';

KipssUser kipssUserFromJson(String str) => KipssUser.fromJson(json.decode(str));

String kipssUserToJson(KipssUser data) => json.encode(data.toJson());

enum TargetedDomain {
  KPSS_A("KPSS-A"),
  KPSS_B("KPSS-B"),
  KPSS_TEACHER("KPSS Öğretmenlik"),
  KPSS_OABT("KPSS ÖABT");

  const TargetedDomain(this.name);
  final String name;
}

class KipssUser {
  final String? userId;
  final String? email;
  final TargetedDomain? targetedDomain;
  final DateTime? birthDate;

  KipssUser({
    this.userId,
    this.email,
    this.targetedDomain,
    this.birthDate,
  });

  KipssUser copyWith({
    String? userId,
    String? email,
    TargetedDomain? targetedDomain,
    DateTime? birthDate,
  }) =>
      KipssUser(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        targetedDomain: targetedDomain ?? this.targetedDomain,
        birthDate: birthDate ?? this.birthDate,
      );

  factory KipssUser.fromJson(Map<String, dynamic> json) => KipssUser(
        userId: json["userID"],
        email: json["email"],
        targetedDomain: TargetedDomain.values[json["targetedDomain"]],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "email": email,
        "targetedDomain": TargetedDomain.values.indexOf(targetedDomain!),
        "birthDate": birthDate?.toIso8601String(),
      };
}

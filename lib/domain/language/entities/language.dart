import 'package:flutter/material.dart';
@immutable
class Language {

//<editor-fold desc="Data Methods">
  const Language({
    required this.name,
    required this.locale,
  });

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      name: map['name'] as String,
      locale: map['locale'] as Locale,
    );
  }
  final String name;
 final Locale locale;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Language &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          locale == other.locale);

  @override
  int get hashCode => name.hashCode ^ locale.hashCode;

  @override
  String toString() {
    return 'Language{ name: $name, locale: $locale,}';
  }

  Language copyWith({
    String? name,
    Locale? locale,
  }) {
    return Language(
      name: name ?? this.name,
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'locale': locale,
    };
  }

//</editor-fold>
}

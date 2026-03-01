///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	/// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override String player_greeting({required Object playerName}) => TranslationOverrides.string(_root.$meta, 'player_greeting', {'playerName': playerName}) ?? 'Hallo ${playerName}';
	@override String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name';
	@override String get display_text => TranslationOverrides.string(_root.$meta, 'display_text', {}) ?? 'Anzeigetext';
	@override String get tts_text => TranslationOverrides.string(_root.$meta, 'tts_text', {}) ?? 'Sprachausgabentext';
	@override String get image_url => TranslationOverrides.string(_root.$meta, 'image_url', {}) ?? 'Bild Url';
	@override String get display_cover => TranslationOverrides.string(_root.$meta, 'display_cover', {}) ?? 'Versteckt anzeigen';
	@override String get execute_for_each_player => TranslationOverrides.string(_root.$meta, 'execute_for_each_player', {}) ?? 'Für jeden Spieler ausführen';
	@override String get can_be_skipped => TranslationOverrides.string(_root.$meta, 'can_be_skipped', {}) ?? 'Überspringbar';
	@override String get per_tag_texts => TranslationOverrides.string(_root.$meta, 'per_tag_texts', {}) ?? 'Text pro Tag';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'player_greeting' => ({required Object playerName}) => TranslationOverrides.string(_root.$meta, 'player_greeting', {'playerName': playerName}) ?? 'Hallo ${playerName}',
			'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name',
			'display_text' => TranslationOverrides.string(_root.$meta, 'display_text', {}) ?? 'Anzeigetext',
			'tts_text' => TranslationOverrides.string(_root.$meta, 'tts_text', {}) ?? 'Sprachausgabentext',
			'image_url' => TranslationOverrides.string(_root.$meta, 'image_url', {}) ?? 'Bild Url',
			'display_cover' => TranslationOverrides.string(_root.$meta, 'display_cover', {}) ?? 'Versteckt anzeigen',
			'execute_for_each_player' => TranslationOverrides.string(_root.$meta, 'execute_for_each_player', {}) ?? 'Für jeden Spieler ausführen',
			'can_be_skipped' => TranslationOverrides.string(_root.$meta, 'can_be_skipped', {}) ?? 'Überspringbar',
			'per_tag_texts' => TranslationOverrides.string(_root.$meta, 'per_tag_texts', {}) ?? 'Text pro Tag',
			_ => TranslationOverrides.string(_root.$meta, path, {}),
		};
	}
}

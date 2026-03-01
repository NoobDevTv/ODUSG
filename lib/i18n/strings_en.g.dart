///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	/// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Hello $playerName'
	///
	/// de: 'Hallo $playerName'
	String player_greeting({required Object playerName}) => TranslationOverrides.string(_root.$meta, 'player_greeting', {'playerName': playerName}) ?? 'Hello ${playerName}';

	/// en: 'Name'
	///
	/// de: 'Name'
	String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name';

	/// en: 'Display Text'
	///
	/// de: 'Anzeigetext'
	String get display_text => TranslationOverrides.string(_root.$meta, 'display_text', {}) ?? 'Display Text';

	/// en: 'Text To Speech Text'
	///
	/// de: 'Sprachausgabentext'
	String get tts_text => TranslationOverrides.string(_root.$meta, 'tts_text', {}) ?? 'Text To Speech Text';

	/// en: 'Image Url'
	///
	/// de: 'Bild Url'
	String get image_url => TranslationOverrides.string(_root.$meta, 'image_url', {}) ?? 'Image Url';

	/// en: 'Display Cover'
	///
	/// de: 'Versteckt anzeigen'
	String get display_cover => TranslationOverrides.string(_root.$meta, 'display_cover', {}) ?? 'Display Cover';

	/// en: 'Execute for each player'
	///
	/// de: 'Für jeden Spieler ausführen'
	String get execute_for_each_player => TranslationOverrides.string(_root.$meta, 'execute_for_each_player', {}) ?? 'Execute for each player';

	/// en: 'Can be skipped'
	///
	/// de: 'Überspringbar'
	String get can_be_skipped => TranslationOverrides.string(_root.$meta, 'can_be_skipped', {}) ?? 'Can be skipped';

	/// en: 'Per Tag Texts'
	///
	/// de: 'Text pro Tag'
	String get per_tag_texts => TranslationOverrides.string(_root.$meta, 'per_tag_texts', {}) ?? 'Per Tag Texts';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'player_greeting' => ({required Object playerName}) => TranslationOverrides.string(_root.$meta, 'player_greeting', {'playerName': playerName}) ?? 'Hello ${playerName}',
			'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name',
			'display_text' => TranslationOverrides.string(_root.$meta, 'display_text', {}) ?? 'Display Text',
			'tts_text' => TranslationOverrides.string(_root.$meta, 'tts_text', {}) ?? 'Text To Speech Text',
			'image_url' => TranslationOverrides.string(_root.$meta, 'image_url', {}) ?? 'Image Url',
			'display_cover' => TranslationOverrides.string(_root.$meta, 'display_cover', {}) ?? 'Display Cover',
			'execute_for_each_player' => TranslationOverrides.string(_root.$meta, 'execute_for_each_player', {}) ?? 'Execute for each player',
			'can_be_skipped' => TranslationOverrides.string(_root.$meta, 'can_be_skipped', {}) ?? 'Can be skipped',
			'per_tag_texts' => TranslationOverrides.string(_root.$meta, 'per_tag_texts', {}) ?? 'Per Tag Texts',
			_ => TranslationOverrides.string(_root.$meta, path, {}),
		};
	}
}

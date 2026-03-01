import 'package:odusg/i18n/strings.g.dart';
import 'package:slang/overrides.dart';

class CustomTranslationMetadata<
  E extends BaseAppLocale<E, T>,
  T extends BaseTranslations<E, T>
>
    extends TranslationMetadata<E, T> {
  CustomTranslationMetadata({
    required super.locale,
    required super.overrides,
    super.cardinalResolver,
    super.ordinalResolver,
  });

  @override
  dynamic Function(String path) get getTranslation => _flatMapFunction!;

  String? Function(String key)? _flatMapFunction;

  @override
  void setFlatMapFunction(Function(String key) func) {
    
    _flatMapFunction =
        (String key) => func(key) ?? TranslationOverrides.string(this, key, {});
  }
}

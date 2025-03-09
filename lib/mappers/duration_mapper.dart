import 'package:dart_mappable/dart_mappable.dart';

class DurationMapper extends SimpleMapper<Duration> {
  const DurationMapper();

  @override
  Duration decode(dynamic value) {
    return Duration(milliseconds: value);
  }

  @override
  dynamic encode(Duration self) {
    return self.inMilliseconds;
  }
}



import 'package:logger/logger.dart';
import 'package:pos/injection/main_injection.dart';

Logger logger() {
  return getIt.get<Logger>();
}
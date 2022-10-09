import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
//! localization
  AppLocalizations get string => AppLocalizations.of(this)!;
  //! lang
  String get lang => Localizations.localeOf(this).toString();
}
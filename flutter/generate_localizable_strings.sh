#!/bin/bash

set -e

SOURCE_DIR=$( dirname "${BASH_SOURCE[0]}")

cd $SOURCE_DIR

flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/src/app_localizations.dart
flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/src/app_localizations.dart lib/l10n/intl_*.arb

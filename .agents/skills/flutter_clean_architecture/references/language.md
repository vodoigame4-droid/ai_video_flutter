---
trigger: always_on
---

- Không được phép hard code String
- Cần được quản lý String thông qua thư viện intl các file json

The English localization source file (lib/i18n/en.i18n.json) was just modified. Please do the following:

1. Read lib/i18n/en.i18n.json to identify the current full set of keys and values.
2. For each of the 11 target locale files (ar, de, es, fr, hi, id, ja, ko, pt, vi, zh) in lib/i18n/:
   a. Read the target locale file.
   b. Identify any keys that are missing or whose corresponding English value has changed.
   c. Generate accurate translations for those keys, preserving:
      - Interpolation placeholders like $arg, $current, $required exactly as-is
      - Newline characters (\n) in the same positions
      - The nested JSON structure and key names unchanged
      - Locale-specific conventions (e.g., RTL considerations for Arabic, honorifics for Japanese/Korean, formal/informal register as appropriate)
   d. Update the target locale file with the new/changed translations, keeping existing correct translations intact.
3. Do NOT modify any .g.dart generated files — only edit the .i18n.json source files.
4. After updating all locale files, remind the user to run `dart run slang` to regenerate the typed Dart accessors.
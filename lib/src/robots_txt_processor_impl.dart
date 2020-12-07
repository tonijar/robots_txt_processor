import 'dart:convert';

import 'package:robots_txt_processor/src/robots_txt.dart';

/// A robots.txt processor
class RobotsTxtProcessor {
  /// Process robots.txt string and return a more manageable RobotsTxt object
  RobotsTxt process(String txt) {
    final RobotsTxt result = new RobotsTxt();
    LineSplitter.split(txt).forEach((line) {
      if (_startsWithIgnoreCase(line, "User-agent[ \t]*:")) {
        result.groups.add(new RobotsTxtGroup(_getValueFromLine(line)));
      } else if (_startsWithIgnoreCase(line, "Allow[ \t]*:") &&
          result.groups.isNotEmpty) {
        result.groups.last.allow.add(_getValueFromLine(line));
      } else if (_startsWithIgnoreCase(line, "Disallow[ \t]*:") &&
          result.groups.isNotEmpty) {
        result.groups.last.disallow.add(_getValueFromLine(line));
      } else if (_startsWithIgnoreCase(line, "Sitemap[ \t]*:")) {
        result.sitemap.add(_getValueFromLine(line));
      }
    });
    return result;
  }

  /// Check if line starts with regexp prefix and avoiding empty spaces
  _startsWithIgnoreCase(String line, String prefix) =>
      line != null &&
      prefix != null &&
      line.trim().toLowerCase().startsWith(new RegExp(prefix.toLowerCase()));

  /// Get value from line avoiding empty spaces
  _getValueFromLine(String line) => line != null
      ? line
          .substring(line.indexOf(":") + 1,
              line.lastIndexOf("#") > 0 ? line.lastIndexOf("#") : line.length)
          .trim()
      : "";
}

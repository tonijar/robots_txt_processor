import 'package:flutter_test/flutter_test.dart';
import 'dart:io';
import 'package:robots_txt_processor/robots_txt_processor.dart';

/// Read XML file from path in a sync way
String _readFile(String path) {
  return File(path).readAsStringSync();
}

void main() {
  final tested = RobotsTxtProcessor();
  test('robots.txt with 2 sitemap and 3 disallow groups', () {
    RobotsTxt result = tested.process(_readFile("test/samples/robots.txt"));
    expect(result, isNotNull);
    expect(result.sitemap, isNotNull);
    expect(result.sitemap.length, 2);
    expect(result.groups, isNotNull);
    expect(result.groups.length, 3);
    expect(result.groups[0].userAgent, isNotNull);
    expect(result.groups[0].allow.length, 1);
    expect(result.groups[0].disallow.length, 1);
    expect(result.groups[1].userAgent, isNotNull);
    expect(result.groups[1].allow.length, 0);
    expect(result.groups[1].disallow.length, 1);
    expect(result.groups[2].userAgent, isNotNull);
    expect(result.groups[2].allow.length, 1);
    expect(result.groups[2].disallow.length, 1);
  });

  test('robots.txt inconsistent without properly formed groups', () {
    RobotsTxt result =
        tested.process(_readFile("test/samples/robots-inconsistent.txt"));
    expect(result, isNotNull);
    expect(result.sitemap, isNotNull);
    expect(result.sitemap.length, 2);
    expect(result.groups, isNotNull);
    expect(result.groups.length, 3);
    expect(result.groups[0].userAgent, isNotNull);
    expect(result.groups[0].allow.length, 0);
    expect(result.groups[0].disallow.length, 1);
    expect(result.groups[1].userAgent, isNotNull);
    expect(result.groups[1].allow.length, 2);
    expect(result.groups[1].disallow.length, 2);
    expect(result.groups[2].userAgent, isNotNull);
    expect(result.groups[2].allow.length, 0);
    expect(result.groups[2].disallow.length, 0);
  });

  test('robots.txt empty', () {
    RobotsTxt result = tested.process("");
    expect(result, isNotNull);
    expect(result.sitemap, isNotNull);
    expect(result.sitemap.length, 0);
    expect(result.groups, isNotNull);
    expect(result.groups.length, 0);
  });
}

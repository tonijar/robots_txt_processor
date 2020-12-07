import 'package:robots_txt_processor/robots_txt_processor.dart';

void main() {
  // Initialize RobotsTxtProcessor
  final RobotsTxtProcessor processor = RobotsTxtProcessor();

  // Process a robots.txt string with only one user-agent
  RobotsTxt robotsTxt = processor.process('User-agent: googlebot');
  print(robotsTxt.groups[0].userAgent);

  // Process a robots.txt string with only one sitemap
  robotsTxt = processor.process('Sitemap: http://example.com/sitemap.xml');
  print(robotsTxt.sitemap[0]);
}

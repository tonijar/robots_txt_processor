/// RobotsTxt object class
class RobotsTxt {
  /// List of robots groups
  List<RobotsTxtGroup> groups = new List<RobotsTxtGroup>();

  /// List of sitemaps
  List<String> sitemap = new List<String>();
}

/// RobotsTxt group object class
class RobotsTxtGroup {
  /// User agent
  String userAgent;

  // Allow list for this user agent
  List<String> allow = new List<String>();

  // Disallow list for this user agent
  List<String> disallow = new List<String>();

  /// Default RobotsTxtGroup constructor
  RobotsTxtGroup(String userAgent) {
    this.userAgent = userAgent;
  }
}

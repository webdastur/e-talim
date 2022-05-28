class APIUtils {
  static String url = "http://99.80.20.51/api";

  static Uri signIn = build("/auth/login");
  static Uri courses = build("/courses");
  static Uri categories = build("/categories");

  static Uri build(String path) => Uri.parse(url + path);
}

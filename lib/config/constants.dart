class AppConstants {
  AppConstants._();

  static double xxSmallSpacing = 2;
  static double xSmallSpacing = 5;
  static double xSmallMedium = 12;
  static double smallMedium = 14;
  static double smallSpacing = 16;
  static double defaultSpacing = 24;
  static double largeSpacing = 32;
  static double xLargeSpacing = 46;
  static double xMLargeSpacing = 54;
  static double xxLargeSpacing = 66;
  static double xxxLargeSpacing = 100;
  static double xHugeSpacing = 120;

  static double defaultIconSize = 16;
  static double smallIconSize = 10;
}

class AppStrings {
  AppStrings._();

  static String goBack = "Go Back";
  static String profile = "Profile";
  static String create = "Create";
  static String inbox = "Inbox";
  static String login = "Login";
  static String logout = "Log Out";
  static String loginOrSignUp = "Login or Sign Up";
  static String continueWithFacebook = "Continue with Facebook";
  static String continueWithGoogle = "Continue with Google";
  static String signUpWithEmail = "Signup with Email";
  static String enterEmail = "Enter email";
  static String enterPassword = "Enter password";
  static String forgottenPassword = "Forgotten Password?";
  static String exampleEmail = "john@doe.com";
  static String examplePassword = "**********";
  static String askOrShare = "Want to ask or share something?";
  static String meetNewJoiners = "Meet new joiners";
  static String viewAll = "View All";
  static String recent = "Recent";
  static String latestNews = "Latest News";
  static String whatOthersSay = "What are others saying?";
  static String questions = "Questions";
  static String posts = "Posts";
  static String settings = "Settings";
  static String warning = "Warning";
  static String ok = "Okay";

  static String getQuickAccess =
      "Get quick access to every information you will need to move in and out of Germany.";
}

class AppRoutes {
  AppRoutes._();

  static String splash = "/";
  static String canvas = "/canvas";
  static String auth = "/auth";
  static String home = "/home";
  static String dashboard = "/dashboard";
  static String replyQuestion = "/replyQuestion";
  static String replyPost = "/replyPost";
  static String addPostQuestion = "/addPostQuestion";
  static String news = "/news";
  static String category = "/category";
}

class ApiConstants {
  ApiConstants._();

  static String baseUrl = "http://161.35.54.129:8080/api";

  // auth
  static String token = "$baseUrl/auth/token";
  static String me = "$baseUrl/auth/me";

  // news
  static String news = "$baseUrl/news";
}
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

  static String completed = "Completed";
  static String translate = "Translate";
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
  static String confirmEmail = "Confirm Email";
  static String enterEmail = "Enter email";
  static String enterName = "Enter name";
  static String enterCode = "Enter code";
  static String enterPassword = "Enter password";
  static String confirmPassword = "Confirm password";
  static String forgottenPassword = "Forgotten Password?";
  static String exampleEmail = "john@doe.com";
  static String exampleName = "John Doe";
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
  static String success = "Success";
  static String register = "Register";
  static String lblContinue = "Continue";
  static String password = "Create Password";
  static String wrappingUp = "Wrapping Up";
  static String almostThere = "We're almost there!!!";
  static String enterPhone = "Enter phone";
  static String dob = "Enter date of Birth";
  static String country = "Country";

  static String getQuickAccess =
      "Get quick access to every information you will need to move in and out of Germany.";
  static String emailInstruction =
      "Provide valid email as you'll need this to confirm your account";
}

class AppRoutes {
  AppRoutes._();

  static String splash = "/";
  static String canvas = "/canvas";
  static String auth = "/auth";
  static String home = "/home";
  static String dashboard = "/dashboard";
  static String replyPostQuestion = "/replyPostQuestion";
  static String addPostQuestion = "/addPostQuestion";
  static String news = "/news";
  static String category = "/category";
  static String translatePost = "/translatePost";
  static String translateReply = "/translateReply";
}

class ApiConstants {
  ApiConstants._();

  static String baseUrl = "http://161.35.54.129:8080/api";

  // auth
  static String token = "$baseUrl/auth/token";
  static String externalToken = "$token/external";
  static String me = "$baseUrl/auth/me";
  static String registerLocal = "$baseUrl/auth/register/local";
  static String sendConfirmationCode = "$baseUrl/auth/sendConfirmation";
  static String confirmCode = "$baseUrl/auth/confirmCode";

  // news
  static String news = "$baseUrl/news";

  // categories
  static String categories = "$baseUrl/category";
  static String posts = "$baseUrl/post";

  // replies
  static String replies = "$baseUrl/reply/";

  // misc
  static String likes = "$baseUrl/misc/likes";
  static String removeLike = "$likes/remove";

  static String bookmarks = "$baseUrl/misc/bookmarks";
  static String removeBookmark = "$bookmarks/remove";

  static String translate = "$baseUrl/misc/translate";
}

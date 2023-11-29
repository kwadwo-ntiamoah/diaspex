import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/models/news/news.dart';
import 'package:diaspex/views/auth/auth.dart';
import 'package:diaspex/views/dashboard/dashboard.dart';
import 'package:diaspex/views/drawing_board.dart';
import 'package:diaspex/views/index/index.dart';
import 'package:diaspex/views/news/news.dart';
import 'package:diaspex/views/posts_questions/add_post_question.dart';
import 'package:diaspex/views/posts_questions/reply_post.dart';
import 'package:diaspex/views/splash/splash_screen.dart';
import 'package:diaspex/views/posts_questions/reply_question.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: AppRoutes.splash,
    name: AppRoutes.splash,
    builder: (ctx, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRoutes.canvas,
    name: AppRoutes.canvas,
    builder: (ctx, state) => const DrawingBoard(),
  ),
  GoRoute(
    path: AppRoutes.auth,
    name: AppRoutes.auth,
    builder: (ctx, state) => const AuthView(),
  ),
  GoRoute(
    path: AppRoutes.home,
    name: AppRoutes.home,
    builder: (ctx, state) => const AppIndex(),
  ),
  GoRoute(
    path: AppRoutes.dashboard,
    name: AppRoutes.dashboard,
    builder: (ctx, state) => const DashboardView(),
  ),
  GoRoute(
      path: AppRoutes.replyQuestion,
      name: AppRoutes.replyQuestion,
      builder: (ctx, state) => const ReplyQuestionView()),
  GoRoute(
      path: AppRoutes.replyPost,
      name: AppRoutes.replyPost,
      builder: (ctx, state) => const ReplyPostView()),
  GoRoute(
      path: AppRoutes.addPostQuestion,
      name: AppRoutes.addPostQuestion,
      builder: (ctx, state) => const AddPostQuestionView()),
  GoRoute(
    path: AppRoutes.news,
    name: AppRoutes.news,
    builder: (ctx, state) {
      News news = state.extra as News;
      return NewsDetails(news: news);
    }
  ),
], initialLocation: "/");

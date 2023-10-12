import 'package:diaspex/config/constants.dart';
import 'package:diaspex/views/auth/auth.dart';
import 'package:diaspex/views/dashboard/dashboard.dart';
import 'package:diaspex/views/drawing_board.dart';
import 'package:diaspex/views/index/index.dart';
import 'package:diaspex/views/posts_questions/add_post_question.dart';
import 'package:diaspex/views/posts_questions/reply_post.dart';
import 'package:diaspex/views/splash/splash_screen.dart';
import 'package:diaspex/views/posts_questions/reply_question.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: AppRoutes.splash.routePath,
    name: AppRoutes.splash.routeName,
    builder: (ctx, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRoutes.canvas.routePath,
    name: AppRoutes.canvas.routeName,
    builder: (ctx, state) => const DrawingBoard(),
  ),
  GoRoute(
    path: AppRoutes.auth.routePath,
    name: AppRoutes.auth.routeName,
    builder: (ctx, state) => const AuthView(),
  ),
  GoRoute(
    path: AppRoutes.home.routePath,
    name: AppRoutes.home.routeName,
    builder: (ctx, state) => const AppIndex(),
  ),
  GoRoute(
    path: AppRoutes.dashboard.routePath,
    name: AppRoutes.dashboard.routeName,
    builder: (ctx, state) => const DashboardView(),
  ),
  GoRoute(
    path: AppRoutes.replyQuestion.routePath,
    name: AppRoutes.replyQuestion.routeName,
    builder: (ctx, state) => const ReplyQuestionView()
  ),
  GoRoute(
      path: AppRoutes.replyPost.routePath,
      name: AppRoutes.replyPost.routeName,
      builder: (ctx, state) => const ReplyPostView()
  ),
  GoRoute(
      path: AppRoutes.addPostQuestion.routePath,
      name: AppRoutes.addPostQuestion.routeName,
      builder: (ctx, state) => const AddPostQuestionView()
  )
], initialLocation: "/");

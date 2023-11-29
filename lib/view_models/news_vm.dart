import 'package:diaspex/data/entity/paged.entity.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';
import 'package:diaspex/data/models/news/news.dart';
import 'package:diaspex/data/models/paged_list/paged_list.dart';
import 'package:diaspex/data/repos/news.repo.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:flutter/cupertino.dart';

class NewsVM extends ChangeNotifier with ErrorNotifierMixin {
  final INewsRepo newsRepo;

  NewsVM({required this.newsRepo});

  int _page = 1;
  final int _pageSize = 5;

  int get page => _page;
  int get pageSize => _pageSize;

  bool _hasNexPage = false;
  bool get hasNextPage => _hasNexPage;

  final List<News> _news = [];
  List<News> get news => _news;

  FormStatus _status = FormStatus.init;
  FormStatus get status => _status;

  Future getAllNews() async {
    try {
      _status = FormStatus.loading;
      notifyListeners();

      // get news
      Pager pager = Pager(page: _page.toString(), pageSize: _pageSize.toString());
      ApiResponse response = await newsRepo.getAllNews(pager);

      if (response.status == 200) {
        PagedList pagedItem = PagedList.fromJson(response.data);
        _hasNexPage = pagedItem.hasNextPage;

        for (var element in pagedItem.items) {
          News newsItem = News.fromJson(element);
          _news.add(newsItem);
        }

        _status = FormStatus.passed;
        notifyListeners();
      } else {
        _status = FormStatus.failed;

        notifyError(response.message);
        notifyListeners();
      }
    } catch (e) {
      notifyError(e.toString());
      notifyListeners();
    }
  }

  void setPage(int nextPage) {
    _page = nextPage;
    notifyListeners();
  }
}

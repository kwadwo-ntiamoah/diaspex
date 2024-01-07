import 'package:diaspex/data/enums/category_post_enum.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';
import 'package:diaspex/data/models/category/category.dart';
import 'package:diaspex/data/repos/category.repo.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:flutter/cupertino.dart';

class CategoryVM extends ChangeNotifier with ErrorNotifierMixin{
  final ICategoryRepo categoryRepo;

  CategoryVM({ required this.categoryRepo });

  final List<Category> _questionCategories = [];
  final List<Category> _postCategories = [];

  Category _currentPostCategory = Category(id: "All", title: "All", description: "All" , type: CategoryPostType.post.index);
  Category _currentQuestionCategory = Category(id: "All", title: "All", description: "All" , type: CategoryPostType.question.index);

  List<Category> get questionCategories => _questionCategories;
  List<Category> get postCategories => _postCategories;

  Category get currentQuestionCategory => _currentQuestionCategory;
  Category get currentPostCategory => _currentPostCategory;

  FormStatus _status = FormStatus.init;
  FormStatus get status => _status;

  void setCurrentPostCategory(String newCategory) {
    _currentPostCategory = _postCategories.firstWhere((element) => element.title == newCategory);
    notifyListeners();
  }

  void setCurrentQuestionCategory(String newCategory) {
    var temp = _questionCategories.firstWhere((element) => element.title == newCategory);
    _currentQuestionCategory = temp;
    notifyListeners();
  }

  Future getAllCategories() async {
    try {
      _status = FormStatus.loading;
      notifyListeners();

      // get categories
      ApiResponse response = await categoryRepo.getAllCategories();

      if (response.status == 200) {
        final tempQuestionCategory =  Category(id: "All", title: "All", description: "All" , type: CategoryPostType.question.index);
        final tempPostCategory =  Category(id: "All", title: "All", description: "All" , type: CategoryPostType.post.index);

        _postCategories.add(tempPostCategory);
        _questionCategories.add(tempQuestionCategory);

        for (var element in response.data) {
          Category categoryItem = Category.fromJson(element);

          if (categoryItem.type == CategoryPostType.post.index) {
            _postCategories.add(categoryItem);
          }

          if (categoryItem.type == CategoryPostType.question.index) {
            _questionCategories.add(categoryItem);
          }
        }

        _status = FormStatus.passed;
      } else {
        notifyError(response.message);
        _status = FormStatus.failed;
      }

      notifyListeners();
    } catch(e) {
      notifyError(e.toString());
      notifyListeners();
    }
  }
}
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

  List<Category> get questionCategories => _questionCategories;
  List<Category> get postCategories => _postCategories;

  FormStatus _status = FormStatus.init;
  FormStatus get status => _status;

  Future getAllCategories() async {
    try {
      _status = FormStatus.loading;
      notifyListeners();

      // get categories
      ApiResponse response = await categoryRepo.getAllCategories();

      if (response.status == 200) {
        for (var element in response.data) {
          Category categoryItem = Category.fromJson(element);

          if (categoryItem.type == CategoryPostType.post) {
            _postCategories.add(categoryItem);
          }

          if (categoryItem.type == CategoryPostType.question) {
            _questionCategories.add(categoryItem);
          }
        }

        notifyListeners();
      } else {
        notifyError(response.message);
        notifyListeners();
      }

    } catch(e) {
      notifyError(e.toString());
      notifyListeners();
    }
  }
}
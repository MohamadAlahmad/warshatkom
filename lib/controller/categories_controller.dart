import 'package:get/get.dart';
import 'package:warshatkom/model/MainCategory.dart';
import 'package:warshatkom/model/SubCategory.dart';

class CategoriesController extends GetxController {
  List<MainCategory> mainCategories = [];
  List<SubCategory> subCategories = [];

  addCategoryToList(MainCategory category) {
    mainCategories.add(category);
    update();
  }
  addSubCategoryToList(SubCategory category) {
    subCategories.add(category);
    update();
  }

  getMainCategories() {
    return mainCategories;
  }
  getSubCategories() {
    return subCategories;
  }

}
import 'package:get/get.dart';
import 'package:warshatkom/model/serv_order.dart';

class ServOrdersController extends GetxController {
  List<ServOrder> servOrders = [];

  addOrderToList(ServOrder order) {
    servOrders.add(order);
    update();
  }

  getAllOrders() {
    return servOrders;
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warshatkom/controller/serv_orders_controller.dart';
import 'package:warshatkom/model/serv_order.dart';

class AddOrderPage extends StatefulWidget {
  final int orderId;
  final String orderName;
  const AddOrderPage({required this.orderId, required this.orderName, super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color(0xffffeeef),
      ),
      body: Container(
        color: const Color(0xffffeeef),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Dialog(
            backgroundColor: const Color(0xffe8aa41),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                color: Color(0xffe8aa41),
                boxShadow: [BoxShadow(blurRadius: 20.0, spreadRadius: 10.0, color: Colors.grey)],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('إضافة الخدمة', style: TextStyle(fontSize: 20.0),),
                  Text(widget.orderName, style: const TextStyle(fontSize: 20.0),),
                  Text('${widget.orderId}', style: const TextStyle(fontSize: 20.0),),
                  const SizedBox(height: 10,),
                  GetBuilder<ServOrdersController>(
                      init: ServOrdersController(),
                      builder: (controller) {
                        return CustomButton(
                          onClick: () {
                            var servOrder = ServOrder(id: widget.orderId, name: widget.orderName);
                            controller.addOrderToList(servOrder);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                'تمت الإضافة بنجاح',
                                style: TextStyle(color: Color(0xffe8aa41)),
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 1),
                              backgroundColor: Color(0xff025464),
                            ));
                            Navigator.pop(context);
                          },
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  late VoidCallback onClick;
  CustomButton({required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(75.0),
      child: Ink(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Color(0xff025464),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(75.0),
          onTap: () {
            onClick();
          },
          child: Container(
            width: 120.0,
            height: 120.0,
            alignment: Alignment.center,
            child: const Text(
              'إضافة',
              style: TextStyle(
                color: Colors.white, // Change text color
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:warshatkom/themes/theme.dart';
import 'package:warshatkom/view/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController controller = PageController();
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController username = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool isLastPage = false;

  /*@override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }*/
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 75.0),
        child: PageView(
          //TODO : physics هاااااااااااااااام
          //physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          onPageChanged: (index) {
            /*if(index == 1) {
              setState(() {
                isLastPage = true;
              });
            }*/
          },
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 100.0),
                //color: const Color(0xff025464),
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset('assets/logo/warshatkom.png', color: WSThemes.primaryColor, scale: 1.2,),
                    const SizedBox(height: 25.0,),
                    const Text(
                      'أدخل رقم هاتفك لتتمكن من الوصول لحسابك و الاستفادة من خدمات ورشاتكم',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: WSThemes.primaryColor,),
                    ),
                    const SizedBox(height: 25.0,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: phoneController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1.0, color: WSThemes.primaryColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1.0, color: WSThemes.primaryColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: ' رقم الموبايل ',
                                labelStyle: const TextStyle(color: Colors.grey),
                                //border: InputBorder.none,
                                prefixIcon: Container(
                                  //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          final code = await countryPicker.showPicker(
                                            context: context,
                                            initialSelectedLocale: 'sy',
                                          );
                                          setState(() {
                                            countryCode = code;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: countryCode != null ? countryCode!.flagImage() : Container(),
                                            ),
                                            const SizedBox(width: 5.0,),
                                            Container(
                                              padding: const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color: WSThemes.primaryColor.withOpacity(0.8),
                                                borderRadius: BorderRadius.circular(12.0),
                                              ),
                                              child: Text(countryCode == null ? 'اختر الدولة' : countryCode!.dialCode, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if(value!.isEmpty) {
                                  return 'الحقل مطلوب';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 50.0,),
                            SizedBox(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1.0, color: WSThemes.primaryColor),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1.0, color: WSThemes.primaryColor),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.only(top: 12.0),
                                  border: InputBorder.none,
                                  labelText: ' الاسم الكامل (اختياري) ',
                                  labelStyle: const TextStyle(color: Colors.grey),
                                ),
                                onChanged: (value) {},
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: WSThemes.secondaryColor,
                      ),
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          if(controller.page! < 1 ) {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        }
                        if(controller.page! == 1) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('التالي', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 100.0, right: 25.0, left: 25.0),
                //color: const Color(0xff025464),
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset('assets/logo/warshatkom.png', color: WSThemes.primaryColor, scale: 1.2,),
                    const SizedBox(height: 25.0,),
                    const Text(
                      'أدخل رمز التحقق المكون من 4 خانات الذي تم إرساله إلى رقمك',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: WSThemes.primaryColor,),
                    ),
                    const SizedBox(height: 25.0,),
                    Form(
                      key: formKey2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customTextField(true),
                              customTextField(false),
                              customTextField(false),
                              customTextField(false),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: WSThemes.secondaryColor,
                            ),
                            onPressed: () {
                              if(formKey2.currentState!.validate()) {
                                  Get.offAll(() => const Home());
                              }
                            },
                            child: const Text('تأكيد الرمز', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: WSThemes.primaryColor,
        height: 75.0,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 2,
            effect: const WormEffect(activeDotColor: WSThemes.secondaryColor, spacing: 16.0),
            onDotClicked: (index) {
              /*controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );*/
            },
          ),
        ),
      ),
    );
  }
  Container customTextField(bool autoFocus) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: WSThemes.primaryColor,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      height: 55.0,
      width: 52.0,
      child: TextFormField(
        autofocus: autoFocus,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 12.0),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if(value.length == 1) FocusScope.of(context).nextFocus();
        },
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if(value!.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}


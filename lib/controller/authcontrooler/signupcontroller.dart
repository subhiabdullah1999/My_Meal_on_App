import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/alertdialogexitapp.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/authdata/signupdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class SinUpController extends GetxController {
  backButton();
  signUp();
  goToLogIn();
}

class SignUpControllerImp extends SinUpController {
  SignUpData signUpData = SignUpData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController userName;
  late TextEditingController phonenumber;
  String? fullphonenumber;
  late TextEditingController password;
  late TextEditingController repassword;

  String? codeFirebase;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseMessaging fcm = FirebaseMessaging.instance;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  List data = [];

  bool isShowwPassword = true;
  String? verficode;

  String? firToken;

  showPassword() {
    isShowwPassword = isShowwPassword == false ? true : false;
    update();
  }

  @override
  backButton() {
    alertDialogExitApp();
  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoutsName.login);
  }

  // void phoneAuth() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: fullphonenumber,
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken) async {
  //       verficode = verificationId;
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  //   print("donnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
  // }

  verfiCode() async {
    print("rrrrryyyyyyyyyyyyy");
    print(codeFirebase);
    print("rrrrryyyyyyyyyyyyy");

    //   try {
    //     String smsCode = codeFirebase!;

    //     // Create a PhoneAuthCredential with the code
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //         verificationId: verficode!, smsCode: smsCode);

    //     // Sign the user in (or link) with the credential
    //     await auth.signInWithCredential(credential);
    //     print("fddddddddddddddddddd");
    //     print("sucssesssssssssssss");
    //   } catch (e) {
    //     print("rrrrrrrrrrrrrrrrrrrrr");
    //     print(e.toString());
    //     print("rrrrrrrrrrrrrrrrrrrrr");
    //   }
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(userName.text, fullphonenumber!,
          password.text, repassword.text, firToken!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print("ddddddddddsssssssssssssssss");
        print(firToken);
        if (response['status'] == 'success') {
          myServices.sharedPreferences
              .setString("token", response['data']['token'].toString());

          myServices.sharedPreferences
              .setString("id", response['data']['user']['id'].toString());
          myServices.sharedPreferences.setString(
              "username", response['data']['user']['name'].toString());
          myServices.sharedPreferences
              .setString("phone", response['data']['user']['phone'].toString());
          myServices.sharedPreferences.setString(
              "password", response['data']['user']["password"].toString());
          myServices.sharedPreferences.setString("step", "2");

          // phoneAuth();

          // Get.offNamed(AppRoutsName.veryfiCodeSignAndLogIn, arguments: {
          //   "phonenumber": fullphonenumber,
          // });

          Get.offNamed(AppRoutsName.homebuttonApbar);
        } else {
          Get.defaultDialog(
            titlePadding: const EdgeInsets.all(10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            title: "waring".tr,
            backgroundColor: AppColors.whiteColor,
            content: Text("phoneAlredy".tr),
            confirm: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Get.back(canPop: false);
                  },
                  child: Text("ok".tr)),
            ),
          );
          statusRequest = StatusRequest.faliure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    userName = TextEditingController();
    phonenumber = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    fcm.getToken().then((token) {
      firToken = token!;
    });

    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    phonenumber.dispose();
    password.dispose();

    super.dispose();
  }
}

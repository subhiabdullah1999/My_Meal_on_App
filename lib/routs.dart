import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/middleware/mymiddleware.dart';
import 'package:My_Meal_on/view/address/add.dart';
import 'package:My_Meal_on/view/address/add_adress_part_tow.dart';
import 'package:My_Meal_on/view/address/view.dart';
import 'package:My_Meal_on/view/screens/ResturantScreen/resturantdiscbotmapbar.dart';
import 'package:My_Meal_on/view/screens/ResturantScreen/resturantdiscrscreen.dart';
import 'package:My_Meal_on/view/screens/ResturantScreen/resturantscreen.dart';
import 'package:My_Meal_on/view/screens/about_us/about_us.dart';
import 'package:My_Meal_on/view/screens/auth/forgetpassword.dart';
import 'package:My_Meal_on/view/screens/auth/login.dart';
import 'package:My_Meal_on/view/screens/auth/resetpassword.dart';
import 'package:My_Meal_on/view/screens/auth/signup.dart';
import 'package:My_Meal_on/view/screens/auth/verfiricodesignandlogin.dart';
import 'package:My_Meal_on/view/screens/auth/veryficoderesetpass.dart';
import 'package:My_Meal_on/view/screens/cart/cart_id.dart';
import 'package:My_Meal_on/view/screens/cart/catrtest.dart';
import 'package:My_Meal_on/view/screens/categories/categoriesbotmApbar.dart';
import 'package:My_Meal_on/view/screens/chooseLanguage/chooselanguage.dart';
import 'package:My_Meal_on/view/screens/home/home.dart';
import 'package:My_Meal_on/view/screens/home/homebottombar.dart';
import 'package:My_Meal_on/view/screens/items/itemdetails.dart';
import 'package:My_Meal_on/view/screens/notification/notification.dart';
import 'package:My_Meal_on/view/screens/onboarding/onBoarding.dart';
import 'package:My_Meal_on/view/screens/orders/check%20_out.dart';
import 'package:My_Meal_on/view/screens/orders/orderId.dart';
import 'package:My_Meal_on/view/screens/orders/your_orders.dart';
import 'package:My_Meal_on/view/screens/profile/chanepassword.dart';
import 'package:My_Meal_on/view/screens/profile/editprofile.dart';
import 'package:My_Meal_on/view/screens/profile/profile.dart';
import 'package:My_Meal_on/view/screens/profile/profilescreen.dart';
import 'package:My_Meal_on/view/screens/splash/splash.dart';
import 'package:My_Meal_on/view/screens/settings/settings.dart';
import 'package:My_Meal_on/view/widget/home/custombutomabb.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

import 'view/screens/ResturantScreen/resturantbotomapbar.dart';
import 'view/screens/categories/categoriesdiscbotmappbar.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: "/",
  //   page: () => const CustomBottomNavBar(),
  // ),
  GetPage(
    name: "/",
    page: () => const SplashScreen(),
  ),
  GetPage(
      name: AppRoutsName.choceLang,
      page: () => const ChooseLanguage(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoutsName.login, page: () => const LogIn()),
  GetPage(name: AppRoutsName.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutsName.signUp, page: () => const SignUp()),
  GetPage(
      name: AppRoutsName.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutsName.veryfiCode, page: () => const VeryfiCode()),
  GetPage(name: AppRoutsName.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutsName.veryfiCodeSignAndLogIn,
      page: () => const VerFiriCodeSignAndLOgIn()),
  GetPage(name: AppRoutsName.home, page: () => const Home()),
  GetPage(
      name: AppRoutsName.resturantScreen, page: () => const ResturantScreen()),
  GetPage(name: AppRoutsName.settings, page: () => const Setting()),
  GetPage(name: AppRoutsName.profile, page: () => const Profile()),
  GetPage(name: AppRoutsName.chanePassword, page: () => const ChangePassword()),
  GetPage(name: AppRoutsName.profilescreen, page: () => const ProfileScrren()),
  GetPage(name: AppRoutsName.order, page: () => const YourOrders()),
  GetPage(
      name: AppRoutsName.homebuttonApbar,
      page: () => const CustomBottomNavBar()),
  GetPage(
      name: AppRoutsName.bottmapbarcategories,
      page: () => const CustomCategoriesBotomApbar()),
  GetPage(
      name: AppRoutsName.resturantbotomapbar,
      page: () => const CustomResturantBotomApbar()),
  GetPage(
      name: AppRoutsName.resturantdescscreen,
      page: () => const ResturantDescScreen()),

  GetPage(
      name: AppRoutsName.resturandisctbotomapbar,
      page: () => const CustomResturantDisBotomApbar()),
  GetPage(
      name: AppRoutsName.bottmapbarcategoriesdescr,
      page: () => const CustomCategoriesDisBotomApbar()),

  GetPage(name: AppRoutsName.itemsDetails, page: () => const ItemDetails()),
  GetPage(name: AppRoutsName.viewAddress, page: () => const ViewAddress()),
  GetPage(name: AppRoutsName.addAddress, page: () => const AddAddress()),

  GetPage(name: AppRoutsName.notification, page: () => const Notifications()),
  GetPage(name: AppRoutsName.carttest, page: () => const CartTest()),
  GetPage(
      name: AppRoutsName.addAddressPartTow,
      page: () => const AddAddressParTow()),
  GetPage(name: AppRoutsName.editProfile, page: () => const EditeProfile()),
  GetPage(name: AppRoutsName.cartId, page: () => const CartId()),
  GetPage(name: AppRoutsName.checkOut, page: () => const CheckOut()),
  GetPage(name: AppRoutsName.orderId, page: () => const OrderId()),
  GetPage(name: AppRoutsName.aboutUs, page: () => const AboutUs()),
];

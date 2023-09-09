import 'package:My_Meal_on/controller/address/add_adress_controller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/view/widget/address/customiconcancel.dart';
import 'package:My_Meal_on/view/widget/address/customtexttitleaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdressController());

    return SafeArea(
        child: GetBuilder<AddAdressController>(
      builder: (controller) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomIconCancle(),
            const CustomTextAddress(textTitle: "Enter a new address"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: Get.height - 160,
                child: GetBuilder<AddAdressController>(
                    builder: (controllerpage) => HandlingDatatRequest(
                          statusRequest: controllerpage.statusRequest,
                          widget: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (controllerpage.kGooglePlex != null)
                                GoogleMap(
                                  markers: controllerpage.markers.toSet(),
                                  onTap: (latlong) {
                                    controllerpage.addMarkers(latlong);
                                  },
                                  mapType: MapType.normal,
                                  initialCameraPosition:
                                      controllerpage.kGooglePlex!,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    controllerpage.completer
                                        .complete(controller);
                                  },
                                ),
                              Positioned(
                                  bottom: 10,
                                  child: MaterialButton(
                                    splashColor: AppColors.bluacc,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    onPressed: () {
                                      controllerpage.goToAddAdressPartTow();
                                    },
                                    color: AppColors.oraColor,
                                    child: Text(
                                      "Complete your address".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ))
                            ],
                          ),
                        )))
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/bookings_requests_controller.dart';
import 'package:tapbar/models/booking.dart';
import '../widgets/boxInformation.dart';

class BookingsRequests extends StatelessWidget {
  final BookingsRequestsController controller = Get.put(
    BookingsRequestsController(),
  );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.height > size.width;

    final boxHeight = size.height * 0.20;
    final boxWidth = size.width;
    final titleSize = isMobile ? size.width * 0.05 : size.width * 0.017;
    final titleSize1 = size.width * 0.01;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: boxHeight,
              width: boxWidth,
              alignment: Alignment.center,
              child: Text(
                'Booking_Requests'.tr,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            isMobile
                ? _buildMobileList(context, titleSize, isDark)
                : _buildGridList(context, titleSize, titleSize1, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileList(BuildContext context, double titleSize, bool isDark) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.requestList.isEmpty) {
        return Center(child: Text('no_requests'.tr));
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.requestList.length,
        itemBuilder: (context, index) {
          final booking = controller.requestList[index];

          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => showDialog(context, booking),
              child: Card(
                color: const Color.fromARGB(255, 50, 196, 130),
                child: ListTile(
                  title: Text(
                    '${'registration_number'.tr} ${booking.id}',
                    style: TextStyle(
                      fontSize: titleSize,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Status: ${booking.id}',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildGridList(
    BuildContext context,
    double titleSize,
    double titleSize1,
    bool isDark,
  ) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.requestList.isEmpty) {
        return Center(child: Text('no_requests'.tr));
      }

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: controller.requestList.length,
        itemBuilder: (context, index) {
          final booking = controller.requestList[index];

          return InkWell(
            onTap: () => showDialog(context, booking),
            child: Card(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${'registration_number'.tr} ${booking.id}',
                    style: TextStyle(
                      fontSize: titleSize,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Status: ${booking.bookingStatus}',
                    style: TextStyle(
                      fontSize: titleSize,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void showDialog(BuildContext context, Booking booking) {
    Get.defaultDialog(
      title: 'Booking_Requests'.tr,
      textCancel: 'reject'.tr,
      textConfirm: 'accept'.tr,
      onCancel: () async {
        bool success = await controller.rejectRequest(booking.id);
        //   Get.back();
        Get.snackbar(
          success ? 'Great'.tr : 'error'.tr,
          success ? 'request_rejected'.tr : 'failed_reject'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (success) controller.requestList.remove(booking);
      },
      onConfirm: () async {
        bool success = await controller.acceptRequest(booking.id);
        Get.back();
        Get.snackbar(
          success ? 'Great'.tr : 'error'.tr,
          success ? 'request_accepted'.tr : 'failed_accept'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (success) controller.requestList.remove(booking);
      },
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BoxInformation(
                title: 'Booking_ID'.tr,
                value: Text('${booking.id}'),
              ),

              BoxInformation(
                title: 'Check_in'.tr,
                value: Text('${booking.checkInDate}'),
              ),
              BoxInformation(
                title: 'Check_out'.tr,
                value: Text('${booking.checkOutDate}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_request_controller.dart';
import '../models/requests_model.dart';
import '../widgets/boxInformation.dart';
import '../widgets/photo.dart';

class AdminRegistratinRequest extends StatelessWidget {
  final AdminRequestController controller = Get.put(AdminRequestController());

  @override
  Widget build(BuildContext context) {
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
                "Registration Applications",
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            isMobile
                ? _buildMobileList(context, titleSize)
                : _buildGridList(context, titleSize, titleSize1),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileList(BuildContext context, double titleSize) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.RequestList.isEmpty) {
        return const Center(child: Text("No Requests Found"));
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.RequestList.length,
        itemBuilder: (context, index) {
          final user = controller.RequestList[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => showDialog(context, user),
              child: Card(
                color: const Color.fromARGB(255, 50, 196, 130),
                child: ListTile(
                  title: Text(
                    'Registration number ${index + 1}',
                    style: TextStyle(fontSize: titleSize),
                  ),

                  subtitle: Text('${user.firstname} ${user.lastname}'),
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
  ) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.RequestList.isEmpty) {
        return const Center(child: Text("No Requests Found"));
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
        itemCount: controller.RequestList.length,
        itemBuilder: (context, index) {
          final user = controller.RequestList[index];
          print("picture: ${user.picture}");

          return InkWell(
            onTap: () => showDialog(context, user),

            child: Card(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Registration number ${index + 1}',
                    style: TextStyle(fontSize: titleSize),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${user.firstname} ${user.lastname}",
                    style: TextStyle(fontSize: titleSize),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void showDialog(BuildContext context, Userg user) {
    print('Photo URL: ${user.picture}');

    Get.defaultDialog(
      title: 'Registration Application',
      textCancel: 'Reject',
      textConfirm: 'Accept',
      onCancel: () async {
        bool success = await controller.rejectRequest(user.id);
        if (success) {
          print("in screen success");
          controller.RequestList.remove(user); 
          Get.back(); 
          Get.snackbar(
            "Great",
            "The Request is Rejected Successfully",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          print("in screen fail");
          Get.back(); 
          Get.snackbar(
            "Error",
            "Failed to Reject user",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      onConfirm: () async {
        bool success = await controller.acceptRequest(user.id);
        if (success) {
          controller.RequestList.remove(user);
          Get.back();
          Get.snackbar(
            "Great",
            "The Request is Accepted Successfully",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.back();
          Get.snackbar(
            "Error",
            "Failed to approve user",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },

      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BoxInformation(title: 'First Name:', value: Text(user.firstname)),
              BoxInformation(title: 'Last Name:', value: Text(user.lastname)),
              BoxInformation(
                title: 'Date Of Birth:',
                value: Text(
                  '${user.dateOfBirth.year}-${user.dateOfBirth.month}-${user.dateOfBirth.day}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              BoxInformation(
                title: 'Personal Photo',
                value: Photo(imageUrl: user.picture),
              ),
              BoxInformation(
                title: 'ID Card Photo',
                value: Photo(imageUrl: user.idCardImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

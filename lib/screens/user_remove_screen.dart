import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../models/user.dart';


class UserRemoveScreen extends StatelessWidget {
  final UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.height > size.width;

    final boxHeight = size.height * 0.20;
    final boxWidth = size.width;
    final titleSize = isMobile ? size.width * 0.05 : size.width * 0.017;
    final titleSize1 = size.width * 0.01;

    controller.getAllUsersisApprovedTrue();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: boxHeight,
            width: boxWidth,
            alignment: Alignment.center,
            child: Text(
              "Current Users",
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.users.isEmpty) {
                return const Center(child: Text("No users"));
              }
              return isMobile
                  ? _buildMobileList(context, controller.users)
                  : _buildGridList(
                      context,
                      controller.users,
                      titleSize,
                      titleSize1,
                    );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileList(BuildContext context, List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () => showDeleteDialog(context, user, controller),
            child: Card(
              child: ListTile(
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.phone),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridList(
    BuildContext context,
    List<User> users,
    double titleSize,
    double titleSize1,
  ) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 5,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return InkWell(
          onTap: () => showDeleteDialog(context, user, controller),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: TextStyle(fontSize: titleSize),
                ),
                const SizedBox(height: 10),
                Text(user.phone, style: TextStyle(fontSize: titleSize1)),
              ],
            ),
          ),
        );
      },
    );
  }
}

void showDeleteDialog(
  BuildContext context,
  User user,
  UserController controller,
) {
  Get.defaultDialog(
    title: 'Remove User',
    textCancel: 'Cancel',
    textConfirm: 'Delete',
    middleText: 'Do you want to delete ${user.firstName} ${user.lastName}?',
    onCancel: () => print('Cancelled: ${user.id}'),
    onConfirm: () async {
      try {
        await controller.rejectUser(user); 
      } finally {
        Get.back(closeOverlays: true); 
      }
    },
  );
}

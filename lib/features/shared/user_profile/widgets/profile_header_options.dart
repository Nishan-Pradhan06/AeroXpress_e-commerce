import 'package:flutter/material.dart';

import '../../../../core/constant/app_icons.dart';
import 'profile_squre_tile.dart';


class ProfileHeaderOptions extends StatelessWidget {
  const ProfileHeaderOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileSqureTile(
            label: 'All Order',
            icon: AppIcons.truckIcon,
            onTap: () {
            },
          ),
          ProfileSqureTile(
            label: 'Voucher',
            icon: AppIcons.voucher,
            onTap: () {
            },
          ),
          ProfileSqureTile(
            label: 'Address',
            icon: AppIcons.homeProfile,
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}

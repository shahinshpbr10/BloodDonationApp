import 'package:blood_donation_app/common/apptextstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://via.placeholder.com/40'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back! 👋',
                style: AppTextStyles.heading2.copyWith(fontSize: 18),
              ),
              Text(
                'Shahinsh.pbr',
                style: AppTextStyles.smallBodyText.copyWith(
                  fontSize: 15,

                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(width: 40,
            decoration:BoxDecoration(color: Colors.white,shape: BoxShape.circle) ,
            child: IconButton(
              icon: const Icon(Iconsax.notification),
              onPressed: () {
                // Add your notification logic here
              },
            ),
          ),
          SizedBox(width: 5,),
          Container(width: 40,
            decoration:BoxDecoration(color: Colors.white,shape: BoxShape.circle) ,
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Add your menu logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}

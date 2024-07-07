import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/style/colors.dart';
import '../../../constants.dart';
import '../../../data/constants/app_constants_value.dart';
import '../../../data/models/request/indextPageCountRequestModel.dart';
import '../../../viewmodels/view_model_indext_page_count.dart';
import '../../profile/profile.dart';
import 'icon_btn_with_counter.dart';
import 'notification_Screen.dart';

class HomeHeader extends StatefulWidget {
  final bool isOnline;
  final ValueChanged<bool> onStatusChanged;

  const HomeHeader({
    Key? key,
    required this.isOnline,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  IndextPageCountViewModel indexPageCountViewModel = IndextPageCountViewModel();

  void getOnlineOfflineData() {
    final indexCountRequestmodel = IndextPageCountRequestModel(
      userId: Constants.userIdForUse,
    );

    indexPageCountViewModel.fetchOnlineOfflineData(
      indexCountRequestmodel,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 23,
                foregroundColor: Colors.white,
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white70,
                        width: 1.7,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/Profile Image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Delivery Boy',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: IconBtnWithCounter(
                svgSrc: "assets/icons/Bell.svg",
                press: () {},
              ),
            ),


          ],
        ),
        const SizedBox(height: 24),
        Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8),
        decoration: BoxDecoration(
        color:  Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16.0),
        ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Text(
                'Online Status:',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
              const Expanded(child: SizedBox(width: 32)),
              // Text(
              //   '${widget.isOnline}',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 16,
              //   ),
              // ),
              Switch(
                value: widget.isOnline,
                onChanged: widget.onStatusChanged,
                activeColor:AppColors.primaryColor,
                inactiveThumbColor: Colors.red.shade300,
                inactiveTrackColor: Colors.white.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

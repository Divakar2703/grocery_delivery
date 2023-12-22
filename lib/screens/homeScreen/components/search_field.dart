import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor.withOpacity(0.4),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search),
          // suffixIcon: SizedBox(
          //   width: 48,
          //   height: 48,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       primary: primaryColor,
          //       shape: const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(12)),
          //       ),
          //     ),
          //     onPressed: () {},
          //  //   child: SvgPicture.asset("assets/icons/close.svg",),
          //     child: Icon(Icons.filter_list_outlined),
          //   ),
          // ),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide.none,
);

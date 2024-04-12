import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerProductDetails() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                    Radius.circular(8)
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                    Radius.circular(8)
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                    Radius.circular(8)
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                    Radius.circular(8)
                ),
              ),

            ),
          ],
        ),
      ),
    ),
  );
}

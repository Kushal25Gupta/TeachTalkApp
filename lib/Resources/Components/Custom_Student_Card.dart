import 'package:teachtool/Resources/Components/Rounded_Container.dart';
import 'package:teachtool/Resources/Components/icon_Text_Pair.dart';
import 'package:flutter/material.dart';
import '../Colors/App_Colors.dart';

class CustomStudentCard extends StatelessWidget {
  const CustomStudentCard({
    required this.studentName,
    required this.studentGender,
    required this.studentDOB,
    required this.onPress,
    super.key,
  });

  final String studentName;
  final String studentGender;
  final String studentDOB;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CustomContainer(
        Width: double.infinity,
        Height: 90,
        Child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: SizedBox(
                width: 250,
                child: Text(
                  studentName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: InkWell(
                onTap: onPress,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.darkPurpleColor,
                      width: 1.5,
                    ),
                  ),
                  width: 55,
                  height: 28,
                  child: Center(
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        color: AppColor.customPurpleColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 15),
              child: Row(
                children: [
                  IconTextPair(iconData: Icons.person, texts: studentGender),
                  IconTextPair(iconData: Icons.date_range, texts: studentDOB),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

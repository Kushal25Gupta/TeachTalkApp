import 'package:teachtool/Resources/Routes/Routes_Names.dart';
import 'package:teachtool/Views/AddStudentScreen/Add_New_Student_Form.dart';
import 'package:teachtool/Views/AddStudentScreen/Add_Student_Screen.dart';
import 'package:teachtool/Views/AuthScreen/Auth_Screen.dart';
import 'package:teachtool/Views/AuthScreen/verify_screen.dart';
import 'package:teachtool/Views/NavigationBar/Navigation_Bar.dart';
import 'package:teachtool/Views/StudentListScreen/StudentEditScreen/student_edit_screen.dart';
import 'package:get/get.dart';
import 'package:teachtool/Views/StudentListScreen/StudentListScreen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesNames.authScreen,
          page: () => const AuthScreen(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: RoutesNames.verifyEmailScreen,
          page: () => const VerifyEmailScreen(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: RoutesNames.navigationBar,
          page: () => const CustomNavigationBar(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: RoutesNames.studentListScreen,
          page: () => const StudentListScreen(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 1000),
        ),
        GetPage(
          name: RoutesNames.addStudentScreen,
          page: () => const AddStudentScreen(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 1000),
        ),
        GetPage(
          name: RoutesNames.addNewStudentForm,
          page: () => const AddNewStudentForm(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 1000),
        ),
        GetPage(
          name: RoutesNames.studentEditScreen,
          page: () => StudentEditScreen(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      ];
}

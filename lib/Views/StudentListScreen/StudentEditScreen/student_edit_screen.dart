import 'package:teachtool/Resources/Components/Custom_Dialog.dart';
import 'package:teachtool/ViewModel/StudentEditController/studentEditController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:teachtool/Resources/Colors/App_Colors.dart';
import 'package:teachtool/Resources/Components/Buttons/Round_Button.dart';
import 'package:teachtool/Resources/Components/TextStyle/App_Text_Style.dart';
import 'package:teachtool/Resources/Components/TextFields/Custom_Student_Text_Form_Field.dart';
import '../../../Utils/Utils.dart';

class StudentEditScreen extends StatefulWidget {
  const StudentEditScreen({super.key});

  @override
  State<StudentEditScreen> createState() => _StudentEditScreenState();
}

class _StudentEditScreenState extends State<StudentEditScreen> {
  final StudentEditController studentEditController =
      Get.put(StudentEditController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentDOBController = TextEditingController();
  final FocusNode _studentNameFocusNode = FocusNode();
  final FocusNode _studentGenderFocusNode = FocusNode();
  final FocusNode _studentDOBFocusNode = FocusNode();

  String studentGender = "";
  final int index = Get.arguments;

  void unFocusAll() {
    _studentNameFocusNode.unfocus();
    _studentGenderFocusNode.unfocus();
    _studentDOBFocusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _studentNameFocusNode.requestFocus();
      });
    });
    studentEditController.getStudentValues(index);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final student = studentEditController.student.value;

      return GestureDetector(
        onTap: unFocusAll,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Enter The Details Of New Student',
              style: AppTextStyle.boldPurpleStyle,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 30,
                  children: [
                    CustomStudentTextFormField(
                      focusNode: _studentNameFocusNode,
                      controller: _studentNameController,
                      hintText: student.studentName,
                      onValidateText: 'Please Enter Student Name',
                      onFieldSubmitted: (value) {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(_studentGenderFocusNode);
                        });
                      },
                      onPress: () {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(_studentNameFocusNode);
                        });
                      },
                    ),
                    DropdownButtonFormField(
                      focusNode: _studentGenderFocusNode,
                      borderRadius: BorderRadius.circular(40),
                      dropdownColor: AppColor.customOrangeColor,
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Male",
                          child: Text('Male'),
                        ),
                        DropdownMenuItem<String>(
                          value: "Female",
                          child: Text('Female'),
                        ),
                        DropdownMenuItem<String>(
                          value: "Do not want to disclose",
                          child: Text('Do not want to disclose'),
                        ),
                      ],
                      hint: Text(student.studentGender),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: _studentGenderFocusNode.hasFocus
                            ? AppColor.purpleBackgroundColor
                            : Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              const BorderSide(color: AppColor.darkPurpleColor),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Please Select The Student Gender";
                      },
                      onChanged: (value) {
                        setState(() {
                          studentGender = value!;
                        });
                        FocusScope.of(context)
                            .requestFocus(_studentDOBFocusNode);
                      },
                      onTap: () {
                        FocusScope.of(context)
                            .requestFocus(_studentGenderFocusNode);
                      },
                    ),
                    CustomStudentTextFormField(
                      readOnly: true,
                      focusNode: _studentDOBFocusNode,
                      controller: _studentDOBController,
                      hintText: student.studentDOB,
                      onValidateText: 'Please Select Student DOB',
                      onFieldSubmitted: (value) {
                        unFocusAll();
                      },
                      onPress: () async {
                        FocusScope.of(context)
                            .requestFocus(_studentDOBFocusNode);
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != Null) {
                          setState(() {
                            _studentDOBController.text =
                                DateFormat("d-MMM-yy").format(pickedDate!);
                          });
                        }
                      },
                    ),
                    SizedBox(
                      width: 200,
                      child: RoundButton(
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            customAlertDialog(context);
                          }
                        },
                        text: 'Submit',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void customAlertDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Student detail changed'),
          content:
              Text("Do you really want to change the details of this student"),
          actions: [
            TextButton(
              onPressed: () async {
                await updatingDetails(index, context);
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Future<void> updatingDetails(int index, BuildContext context) async {
    CustomLoaderDialog.showLoader();
    bool result = false;
    try {
      result = await studentEditController
          .changeStudentValues(
        _studentNameController.text,
        studentGender,
        _studentDOBController.text,
        index,
      );
    } catch (e) {
      Utils.errorSnackBar(
          "Error", "Please try again later");
    } finally {
      await CustomLoaderDialog.hideLoader();
      Navigator.pop(context);
      if (result == true) {
        Get.back();
        Utils.successSnackBar("Success",
            'You have successfully changed the data.');
      }
    }
  }

  @override
  void dispose() {
    _studentNameController.dispose();
    _studentDOBController.dispose();
    _studentNameFocusNode.dispose();
    _studentGenderFocusNode.dispose();
    _studentDOBFocusNode.dispose();
    super.dispose();
  }
}

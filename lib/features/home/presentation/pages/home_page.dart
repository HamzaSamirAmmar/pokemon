import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/generate_screen.dart';
import '../../../../core/widgets/buttons/custom_elevated_button.dart';
import '../widgets/clear_text_button.dart';
import '../widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    // For refreshing the displayed name on input
    _nameController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _clearText() {
    setState(() {
      _nameController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 30.h),
                  CustomTextFormField(controller: _nameController),
                  SizedBox(height: 50.h),
                  Text(
                    _nameController.text,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ClearTextButton(onPressed: _clearText),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        PageName.animationsPage,
                        arguments: _nameController.text,
                      );
                    },
                    title: "Go to page 1",
                  ),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      Navigator.of(context).pushNamed(PageName.pokemonsPage);
                    },
                    title: "Go to page 2",
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

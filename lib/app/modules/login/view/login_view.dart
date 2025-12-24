import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/custom_widgets/my_text_field.dart';
import '../../../core/custom_widgets/my_elevated_button.dart';
import '../../../core/extensions/size_extensions.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                Center(
                  child: Image.asset(
                    "assets/logo/splash_logo.png",
                    height: 17.h,
                  ),
                ),
                5.height,
                MyText(
                  "Welcome Back",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
                1.height,
                MyText(
                  "Login to your account",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                4.height,
                MyTextField(
                  controller: controller.emailController,
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                2.height,
                MyTextField(
                  controller: controller.passwordController,
                  labelText: "Password",
                  isPassword: controller.isVisible.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.isVisibleToggle();
                    },
                    child: Icon(
                      controller.isVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                2.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: MyText(
                    "Forgot Password?",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                4.height,
                Obx(
                  () => MyElevatedButton(
                    text: controller.isLoading.value ? "Loading..." : "Login",
                    onPressed: controller.isLoading.value
                        ? () {}
                        : () {
                            // if (_formKey.currentState!.validate()) {
                              controller.login();
                            // }
                          },
                  ),
                ),
                3.height,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white38
                            : Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: MyText(
                        "Or login with",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white38
                            : Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                2.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(context, "assets/logo/google.png"),
                    4.width,
                    _socialButton(context, "assets/logo/facebook.png"),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      "Don't have an account?",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    1.width,
                    GestureDetector(
                      onTap: () {},
                      child: MyText(
                        "Sign Up",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _socialButton(BuildContext context, String icon) {
    return Container(
      height: 6.h,
      width: 14.w,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white12
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Image.asset(icon, height: 3.h)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/common/widgets/auth_footer.dart';
import 'package:fruit_e_commerce/common/widgets/auth_social_buttons.dart';
import 'package:fruit_e_commerce/common/widgets/auth_text_field.dart';
import 'package:fruit_e_commerce/common/widgets/custom_button.dart';
import 'package:fruit_e_commerce/common/widgets/forget_password_text.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              24.verticalSpace,
              AuthTextFields(
                passwordController: passwordController,
                emailController: emailController,
              ),
              16.verticalSpace,
              const ForgotPasswordText(),
              33.verticalSpace,
              CustomButton(
                onPressed: () {
                  // if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   context.read<SigninCubit>().signIn(
                  //     emailController.text,
                  //     passwordController.text,
                  //   );
                  // } else {
                  //   setState(() {
                  //     autovalidateMode = AutovalidateMode.always;
                  //   });
                  // }
                },
                text: 'Sign In',
              ),
              33.verticalSpace,
              AuthFooter(
                primaryText: 'Don\'t have an account?',
                actionText: 'Sign Up',
                onActionTap: () {
                  // Navigator.pushNamed(context, SignupView.routeName);
                },
              ),
              37.verticalSpace,
              const AuthSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

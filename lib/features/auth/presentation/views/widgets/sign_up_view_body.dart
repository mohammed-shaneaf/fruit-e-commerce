import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/common/widgets/auth_footer.dart';
import 'package:fruit_e_commerce/common/widgets/auth_social_buttons.dart';
import 'package:fruit_e_commerce/common/widgets/auth_text_field.dart';
import 'package:fruit_e_commerce/common/widgets/custom_button.dart';
import 'package:fruit_e_commerce/common/widgets/custom_text_form_field.dart';
import 'package:fruit_e_commerce/core/extensions/navigation_extensions.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup/signup_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool agreeToTerms = false;
  late String name;

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

  void _onSignUpPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context.read<SignupCubit>().createUserWithEmailAndPassword(emailController.text, passwordController.text, '');
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
    if (agreeToTerms == false) {
      final snackBar = agreeTirmsSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  SnackBar agreeTirmsSnackBar() {
    return const SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(title: 'Oops!', message: 'You must agree to the Terms and Conditions.', contentType: ContentType.failure),
    );
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
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Full Name',
                textInputType: TextInputType.name,
              ),
              16.verticalSpace,
              AuthTextFields(passwordController: passwordController, emailController: emailController),
              16.verticalSpace,

              Row(
                children: [
                  Checkbox(
                    activeColor: AppColorsManger.primaryColor,
                    value: agreeToTerms,
                    onChanged: (val) {
                      setState(() {
                        agreeToTerms = val ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'By creating an account, ',
                        style: TextStyle(color: AppColorsManger.grayColor, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: 'you agree to our Terms and Conditions.',
                            style: AppTextStyles.regular16.copyWith(color: AppColorsManger.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              33.verticalSpace,
              CustomButton(onPressed: _onSignUpPressed, text: 'Sign Up'),
              33.verticalSpace,
              AuthFooter(
                primaryText: 'Already have an account?',
                actionText: 'Sign In',
                onActionTap: () {
                  context.pop();
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

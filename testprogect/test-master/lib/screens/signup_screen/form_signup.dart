import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/bloc/signup/cubit/signup_cubit.dart';
import 'package:graduationproject/bloc/signup/cubit/signup_state.dart';
import 'package:graduationproject/presantion/buttom_navigation/buttom_navigation.dart';
import 'package:graduationproject/presantion/screens/info_screen/info_screen.dart';
import 'package:graduationproject/presantion/screens/user/user_screen.dart';

class FormSiginup extends StatefulWidget {
  const FormSiginup({Key? key}) : super(key: key);

  @override
  State<FormSiginup> createState() => _FormSiginupState();
}

class _FormSiginupState extends State<FormSiginup> {
  final _globalekey = GlobalKey<FormState>();
  bool isvaled = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
      if (state is SignupSucsess) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(" التسجيل بنجاح")));
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BottomNavBarscreen()));
      } else if (state is Signupfaliouer) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errormassage)));
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
          child: Column(children: [
        SizedBox(height: 10.h),
        Form(
            key: _globalekey,
            child: Column(
              children: [
                Text(
                  "Email                             ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0x00000000ffE9E9E9),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.width / 8,
                  child: TextFormField(
                    controller: context.read<SignupCubit>().emailController,
                    validator: (value) {
                      // You can define validation rules for the input field.
                      if (value!.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null; // Return null if the input is valid.
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'email',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Your Name                       ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0x00000000ffE9E9E9),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.width / 8,
                  child: TextFormField(
                    controller: context.read<SignupCubit>().nameController,
                    validator: (value) {
                      // You can define validation rules for the input field.
                      if (value!.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null; // Return null if the input is valid.
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'name',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  " Password                         ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0x00000000ffE9E9E9),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.width / 8,
                  child: TextFormField(
                    controller: context.read<SignupCubit>().passwordController,
                    validator: (value) {
                      // You can define validation rules for the input field.
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null; // Return null if the input is valid.
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "  Confirm Password            ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0x00000000ffE9E9E9),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.width / 8,
                  child: TextFormField(
                    controller:
                        context.read<SignupCubit>().confarmepasController,
                    validator: (value) {
                      // You can define validation rules for the input field.
                      if (value!.isEmpty) {
                        return 'Please enter your Cunfarme password';
                      }
                      return null; // Return null if the input is valid.
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: ' Confirm password',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: state is signuploaded
                      ? CircularProgressIndicator()
                      : MaterialButton(
                          onPressed: () {
                            if (_globalekey.currentState!.validate()) {
                              // BlocProvider.of<LoginCubit>(context).Loginpost(
                              //     email: emailController.text,
                              //     pasworrd: passwordController.text);
                              context.read<SignupCubit>().Signup();
                            }
                          },
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                )
              ],
            ))
      ]));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:social_app/layout/social_layout_screen.dart';
import 'package:social_app/modules/auth/cubit/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return FlutterLogin(
            onRecoverPassword: null,
            onSignup: cubit.register,
            onLogin: null,
            onSubmitAnimationCompleted: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SocialLayoutScreen(),
              ));
            },

          );
        },
      ),
    );
  }
}

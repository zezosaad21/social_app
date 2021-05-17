import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<String> register(LoginData data) async {
    emit(AuthSuccessState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: data.name, password: data.password)
        .then((value) {
      emit(AuthSuccessState());

      createUser(
        name: data.username,
        uId: value.user.uid,
        email: data.name,
        phone: data.phone,
      );
    }).catchError((error) {
      emit(AuthErrorState());
      return error.toString();
      print(error.toString());
    });
    return null;
  }

  void createUser({
    @required String name,
    @required String uId,
    @required String email,
    @required String phone,
    /*@required*/ String image = "",
  }) {
    UserModel model = UserModel(
      name: name,
      uId: uId,
      email: email,
      phone: phone,
      image: image,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(AuthSuccessCreatUserState());
    }).catchError((error) {
      emit(AuthErrorCreatuserState());
    });
  }
}

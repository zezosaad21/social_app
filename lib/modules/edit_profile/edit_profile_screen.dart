import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layout/cubit/social_cubit.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/style/broken_icons.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _bioController = TextEditingController();

    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'Edit Profile', actions: [
        TextButton(onPressed: () {}, child: Text('UPDATE')),
        SizedBox(
          width: 15.0,
        )
      ]),
      body: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var userModel = SocialCubit.get(context).model;

          _nameController.text = userModel.name;
          _bioController.text = userModel.dio;
          var profileImage = SocialCubit.get(context).profileImage;
          var coverImage = SocialCubit.get(context).coverImage;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // image cover and personal photo
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Container(
                              height: 150.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage("${userModel.cover}")
                                        : FileImage(coverImage),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20.0,
                            child: IconButton(
                              icon: Icon(IconBroken.Camera),
                              onPressed: () {
                                SocialCubit.get(context).getCoverImage();
                              },
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: profileImage == null
                                  ? NetworkImage("${userModel.image}")
                                  : FileImage(profileImage),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20.0,
                            child: IconButton(
                              icon: Icon(IconBroken.Camera),
                              onPressed: () {
                                SocialCubit.get(context).getProfileImage();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                defaultTextFormField(
                  controller: _nameController,
                  prifix: Icon(IconBroken.Profile),
                  labelText: 'Name',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'name must be not empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                defaultTextFormField(
                  controller: _bioController,
                  prifix: Icon(IconBroken.Info_Circle),
                  labelText: 'Bio',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'bio must be not empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

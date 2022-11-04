import 'package:flutter/material.dart';
import 'package:productivity/models/user.dart';

import 'avatar.dart';

class ProfileWidget extends StatelessWidget{
  final User user;

  const ProfileWidget({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
   return  Column(
     mainAxisSize: MainAxisSize.min,
     children: <Widget>[
       Avatar(photo: user.photo,radius: 24,),
       const SizedBox(height: 2),
       Text(user.name ?? '', style: textTheme.subtitle1),
     ],
   );
  }
}
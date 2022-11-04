import 'package:flutter/material.dart';

class ClassTypeTile extends StatelessWidget{
  const ClassTypeTile({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   return  Padding(
     padding: const EdgeInsets.symmetric(vertical: 6.0),
     child: ListTile(
       title: Text(
         title,
         style: theme.textTheme.headline6,
       ),
       shape:
       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
       tileColor: theme.cardColor,
     ),
   );
  }
}
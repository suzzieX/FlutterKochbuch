//Alex was here
import 'package:flutter/material.dart';

class IconBox extends StatelessWidget{
  const IconBox({super.key, required this.label, this.icon, required this.didTap,});
  final String label;
  final IconData? icon;
  final VoidCallback didTap;



  @override
  Widget build(BuildContext context) {


    return(
        InkWell(
          onTap: () {
           didTap();
          }
          ,
          child:  Container(
            margin: const EdgeInsets.all(40.0),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[  Icon(
          icon ?? Icons.favorite ,
          color:Theme.of(context).colorScheme.primary,
          size: 60.0,
        ),Text(label, textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: const TextStyle(fontWeight: FontWeight.bold),)],
     ),
    )
    ));
  }



}
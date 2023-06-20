import 'package:flutter/material.dart';

import '../../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../../core/ui/styles/colors_app.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.all(8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.percentWidth(.8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('87629'),
                    Text('Carga de Farelo'),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Tomadora'),
                        Text('Marcondes Grãos a Granel'),
                      ],
                    ),
                    Column(
                      children: [],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: context.percentWidth(.05),
            height: 70,
            decoration: BoxDecoration(
              color: ColorsApp.i.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

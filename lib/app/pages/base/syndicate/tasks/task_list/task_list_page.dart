import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../menu/menu_drawer.dart';
import '../register/task_syndicate_register_page.dart';
import 'widgets/task_list_tile.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Tarefas',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.dashboard)),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TasksSyndicateRegisterPage(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => const TaskListTile(),
        ),
      ),
    );
  }
}

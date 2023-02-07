import 'package:deprem_destek/pages/my_demand_page/widgets/yaf_reactive_text_field.dart';
import 'package:deprem_destek/pages/my_demand_page/widgets/yaf_tag.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MyDemandView extends StatelessWidget {
  const MyDemandView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Column(
          children: [
            YafReactiveTextField(
              hintText: 's',
              onChange: (_) {},
            ),
            ReactiveCheckbox(
              onChanged: (value) {},
              activeColor: const Color(0xff344054),
              checkColor: const Color(0xff344054),
            ),
            YafTags(onClose: () {}, title: 'asdas'),
            YafReactiveTextField(
              hintText: 'sa',
              onChange: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}

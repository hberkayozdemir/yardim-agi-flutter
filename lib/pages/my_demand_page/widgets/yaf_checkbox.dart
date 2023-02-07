import 'package:flutter/material.dart';

import 'package:reactive_forms/reactive_forms.dart';

class YafCheckBox extends StatelessWidget {
  const YafCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveCheckbox(
      onChanged: (value) {},
      activeColor: const Color(0xff344054),
      checkColor: const Color(0xff344054),
    );
  }
}

import 'package:flutter/material.dart';

import '../ui/helpers/size_extensions.dart';
import '../ui/styles/text_styles.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sucesso',
              style: context.textStyles.textBold.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: context.percentWidth(.65),
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fechar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

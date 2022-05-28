import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../themes/TextStyles/text_styles.dart';
import '../themes/colors/app_colors.dart';

class InputWidget extends GestureDetector {
  InputWidget(
    BuildContext context, {
    Key? key,
    bool isPassword = false,
    required String label,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    required List<TextInputFormatter>? inputFormatters,
    required TextInputType keyboardType,
  }) : super(
          key: key,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              textAlign: TextAlign.justify,
              inputFormatters: inputFormatters,
              textAlignVertical: TextAlignVertical.top,
              obscureText: isPassword ? true : false,
              decoration: InputDecoration(
                labelStyle: const TextStyle(fontSize: 25),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orangeContrast),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orangeContrast),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent),
                ),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                contentPadding: EdgeInsets.zero,
                labelText: label,
                errorStyle: TextStyles.error,
                errorMaxLines: 1,
              ),
            ),
          ),
        );
}

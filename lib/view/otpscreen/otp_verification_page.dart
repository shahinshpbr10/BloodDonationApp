import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/apptextstyle.dart';

class OTPVerificationPage extends StatefulWidget {
  final Function(String) onSubmit;
  final Function() onResend;
  final int otpLength;

  const OTPVerificationPage({
    Key? key,
    required this.onSubmit,
    required this.onResend,
    this.otpLength = 4,
  }) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.otpLength,
          (index) => TextEditingController(),
    );
    focusNodes = List.generate(
      widget.otpLength,
          (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpDigitChanged(int index, String value) {
    if (value.length == 1 && index < widget.otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    }

    // Check if all fields are filled
    if (!controllers.any((controller) => controller.text.isEmpty)) {
      String otp = controllers.map((controller) => controller.text).join();
      widget.onSubmit(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
               Text(
                'OTP Verification',
                style: AppTextStyles.bodyText.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
               Text(
                'Enter the verification code we just sent on your mobile number',
                style: AppTextStyles.smallBodyText.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  widget.otpLength,
                      (index) => SizedBox(
                    width: 60,
                    height: 60,
                    child: TextField(
                      style: AppTextStyles.smallBodyText,
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => _onOtpDigitChanged(index, value),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String otp = controllers.map((controller) => controller.text).join();
                    widget.onSubmit(otp);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Verify',
                    style: AppTextStyles.bodyText.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                    "Didn't received code? ",
                    style: AppTextStyles.smallBodyText.copyWith(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: widget.onResend,
                    child: Text(
                      'Resend',
                      style: AppTextStyles.bodyText.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
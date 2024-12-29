import 'package:blood_donation_app/common/appcolors.dart';
import 'package:blood_donation_app/common/apptextstyle.dart';
import 'package:blood_donation_app/view/donatePage/widgets/success_page.dart';
import 'package:flutter/material.dart';

class BloodRequestForm extends StatefulWidget {
  const BloodRequestForm({Key? key}) : super(key: key);

  @override
  _BloodRequestFormState createState() => _BloodRequestFormState();
}

class _BloodRequestFormState extends State<BloodRequestForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedBloodGroup;
  String? _selectedUrgency;

  final List<String> _bloodGroups = [
    'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'
  ];

  final List<Map<String, String>> _urgencyLevels = [
    {'title': 'High (within 3 days)', 'value': 'high'},
    {'title': 'Moderate (within 2 weeks)', 'value': 'moderate'},
    {'title': 'Low (within two weeks)', 'value': 'low'},
  ];

  Widget _buildTextField({
    required String label,
    required String hintText,
    bool isRequired = false,
    TextInputType? keyboardType,
    Widget? suffix,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label${isRequired ? '*' : ''}',
          style: AppTextStyles.bodyText.copyWith(
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: suffix,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            hintText: hintText,
            hintStyle: AppTextStyles.smallBodyText.copyWith(color: Colors.grey),
          ),
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Personal Details', style: AppTextStyles.heading2),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'If you are someone you know is in need of blood, please fill up the form below to submit your request.',
                  style: AppTextStyles.smallBodyText.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Patient Name
                _buildTextField(
                  label: 'Patient Name',
                  hintText: 'Enter patient name',
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient name';
                    }
                    return null;
                  },
                ),

                // Contact Number
                _buildTextField(
                  label: 'Contact no',
                  hintText: 'Enter contact number',
                  isRequired: true,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact number';
                    }
                    return null;
                  },
                ),

                // Patient Place
                _buildTextField(
                  label: 'Patient Place',
                  hintText: 'Enter patient location',
                ),

                // Blood Group
                Text(
                  'Blood Group*',
                  style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _bloodGroups.map((blood) => ChoiceChip(
                    label: Text(blood, style: AppTextStyles.smallBodyText),
                    selected: _selectedBloodGroup == blood,
                    onSelected: (selected) {
                      setState(() {
                        _selectedBloodGroup = selected ? blood : null;
                      });
                    },
                  )).toList(),
                ),
                const SizedBox(height: 16),

                // Required quantity
                _buildTextField(
                  label: 'Required quantity',
                  hintText: 'Enter required units',
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter required quantity';
                    }
                    return null;
                  },
                ),

                // Hospital name
                _buildTextField(
                  label: 'Hospital name',
                  hintText: 'Enter hospital name',
                  suffix: const Icon(Icons.location_on_outlined),
                ),

                // Urgency Level
                Text(
                  'Urgency Level*',
                  style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Column(
                  children: _urgencyLevels.map((level) => RadioListTile(
                    title: Text(level['title']!, style: AppTextStyles.smallBodyText),
                    value: level['value'],
                    groupValue: _selectedUrgency,
                    onChanged: (value) {
                      setState(() {
                        _selectedUrgency = value as String?;
                      });
                    },
                  )).toList(),
                ),
                const SizedBox(height: 16),

                // Reason for Request
                Text(
                  'Reason for Request',
                  style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    CheckboxListTile(
                      title: Text('Emergency (e.g. surgery, trauma)', style: AppTextStyles.smallBodyText),
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    CheckboxListTile(
                      title: Text('Scheduled Procedure (e.g. planned surgery)', style: AppTextStyles.smallBodyText),
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    CheckboxListTile(
                      title: Text('General Stock Replenishment', style: AppTextStyles.smallBodyText),
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    CheckboxListTile(
                      title: Text('Other', style: AppTextStyles.smallBodyText),
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Additional Information
                _buildTextField(
                  label: 'Additional Information',
                  hintText: 'Enter any additional details here',
                  maxLines: 3,
                ),

                const SizedBox(height: 8),
                // Declaration Text
                Text(
                  'I hereby declare that the information provided above is true and accurate to the best of my knowledge.',
                  style: AppTextStyles.smallBodyText.copyWith(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessPage(),));
                      }
                    },
                    child: Text('Submit',style: AppTextStyles.smallBodyText,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
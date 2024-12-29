import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({Key? key}) : super(key: key);

  @override
  _PersonalDetailsFormState createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please fill out the following form to determine if you are eligible to donate blood and help save lives',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                _buildLabel('Patient Name', true),
                TextFormField(
                  decoration: _buildInputDecoration('Enter Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('DOB', true),
                          TextFormField(
                            controller: _dobController,
                            decoration: _buildInputDecoration('DD/MM/YYYY')
                                .copyWith(
                                suffixIcon: Icon(Icons.calendar_today,
                                    color: Colors.grey[400])),
                            readOnly: true,
                            onTap: () => _selectDate(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Blood Group', true),
                          TextFormField(
                            decoration: _buildInputDecoration('Eg: B+'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildLabel('Contact no', true),
                TextFormField(
                  decoration: _buildInputDecoration('Enter mobile number'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                _buildLabel('Email Address', false),
                TextFormField(
                  decoration: _buildInputDecoration('Enter email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                _buildLabel('Address', false),
                TextFormField(
                  decoration: _buildInputDecoration('Enter Address'),
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label, bool isRequired) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          children: isRequired
              ? const [
            TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red),
            ),
          ]
              : null,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400]),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black),
      ),
    );
  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }
}
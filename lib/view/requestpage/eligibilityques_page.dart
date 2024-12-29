import 'package:blood_donation_app/common/appcolors.dart';
import 'package:blood_donation_app/common/apptextstyle.dart';
import 'package:blood_donation_app/view/requestpage/widgets/personal_details_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EligibilityQuestionScreen extends StatefulWidget {
  @override
  _EligibilityQuestionScreenState createState() =>
      _EligibilityQuestionScreenState();
}

class _EligibilityQuestionScreenState extends State<EligibilityQuestionScreen> {
  int currentIndex = 0;

  // List of eligibility questions
  final List<Map<String, String>> questions = [
    {
      'en': "Are you at least 18 years old and weigh more than 50 kg (110 lbs)?",
      'ml': "നിങ്ങളുടെ പ്രായം കുറഞ്ഞത് 18 വയസ്സോ തൂക്കം 50 കിലോഗ്രാമോ (110 പൗണ്ട്) കൂടിയതോ?"
    },
    {
      'en': "Have you donated blood in the past 12 weeks (3 months)?",
      'ml': "നിങ്ങൾ കഴിഞ്ഞ 12 ആഴ്ച (3 മാസം) രക്തം ദാനം ചെയ്തിട്ടുണ്ടോ?"
    },
    {
      'en': "Do you currently feel healthy and well?",
      'ml': "നിങ്ങൾ ഇപ്പോൾ ആരോഗ്യമുള്ളതും സുഖമുള്ളതും അനുഭവപ്പെടുന്നുണ്ടോ?"
    },
    {
      'en': "Have you had any cold, fever, or flu symptoms in the past 7 days?",
      'ml': "കഴിഞ്ഞ 7 ദിവസങ്ങളിലായി ചുമ, പനി, അല്ലെങ്കിൽ ഫ്ലൂ ലക്ഷണങ്ങൾ ഉണ്ടായിരുന്നോ?"
    },
    {
      'en': "Have you had a tattoo, piercing, or acupuncture treatment in the last 6 months?",
      'ml': "കഴിഞ്ഞ 6 മാസത്തിനുള്ളിൽ ടാറ്റൂ, പിയേഴ്‌സിംഗ്, അല്ലെങ്കിൽ ആക്യുപങ്ക്ചർ ചികിത്സയുണ്ടായിരുന്നോ?"
    },
    {
      'en': "Are you currently taking any medications?",
      'ml': "നിങ്ങൾ ഇപ്പോൾ ഏതെങ്കിലും മരുന്നുകൾ കഴിക്കുകയാണോ?"
    },
    {
      'en': "Have you traveled to any malaria-endemic regions in the past 12 months?",
      'ml': "കഴിഞ്ഞ 12 മാസത്തിനുള്ളിൽ മലേറിയ വ്യാപകമായ പ്രദേശങ്ങളിൽ യാത്ര ചെയ്തിട്ടുണ്ടോ?"
    },
    {
      'en': "Have you had any major surgeries or hospitalizations in the past 6 months?",
      'ml': "കഴിഞ്ഞ 6 മാസത്തിനുള്ളിൽ വൻ ശസ്ത്രക്രിയകളോ ആശുപത്രി പ്രവേശനങ്ങളോ ഉണ്ടായിരുന്നോ?"
    },
    {
      'en': "Have you been diagnosed with or treated for HIV/AIDS or hepatitis?",
      'ml': "HIV/AIDS അല്ലെങ്കിൽ ഹെപ്പറ്റൈറ്റിസിന് ചികിത്സയോ പരിശോധനയോ ഉണ്ടായിരുന്നോ?"
    },
    {
      'en': "Have you been diagnosed with or treated for cancer in the past?",
      'ml': "നിങ്ങൾക്ക് പൂർവ്വകാലത്ത് കാൻസറിന് ചികിത്സയോ പരിശോധനയോ ഉണ്ടായിരുന്നോ?"
    },
    {
      'en': "Are you currently pregnant, breastfeeding, or recently gave birth?",
      'ml': "നിങ്ങൾ ഇപ്പോൾ ഗർഭിണിയോ, മുലയൂട്ടുന്നുണ്ടോ, അല്ലെങ്കിൽ സമീപകാലത്ത് പ്രസവിച്ചിട്ടുണ്ടോ?"
    },
    {
      'en': "Have you consumed alcohol in the past 24 hours?",
      'ml': "കഴിഞ്ഞ 24 മണിക്കൂറിനുള്ളിൽ മദ്യപിച്ചിട്ടുണ്ടോ?"
    },
    {
      'en': "Have you had any recent vaccinations (e.g., COVID-19, flu) in the last 14 days?",
      'ml': "കഴിഞ്ഞ 14 ദിവസങ്ങളിലായി COVID-19 അല്ലെങ്കിൽ ഫ്ലൂ പോലെയുള്ള വാക്സിനേഷൻ ഉണ്ടായിരുന്നോ?"
    },
    {
      'en': "Do you have any chronic medical conditions such as diabetes or hypertension?",
      'ml': "നിങ്ങൾക്ക് പ്രമേഹം അല്ലെങ്കിൽ ഹൈപ്പർടെൻഷൻ പോലെയുള്ള ദീർഘകാല മെഡിക്കൽ പ്രശ്നങ്ങളുണ്ടോ?"
    },
    {
      'en': "Have you experienced fainting or dizziness after previous blood donations?",
      'ml': "മുൻ രക്തദാനങ്ങൾക്ക് ശേഷം നിങ്ങൾക്ക് ഛർദ്ദിയും തലചുറ്റലും അനുഭവപ്പെട്ടിട്ടുണ്ടോ?"
    },
  ];


  // List to store user responses (null = not answered, true = Yes, false = No)
  List<bool?> responses = [];

  // Track current language
  bool isMalayalam = false;

  @override
  void initState() {
    super.initState();
    responses = List.filled(questions.length, null); // Initialize responses
  }

  // Function to toggle language
  void toggleLanguage() {
    setState(() {
      isMalayalam = !isMalayalam;
    });
  }

  // Function to handle answer selection
  void handleAnswerSelection(bool answer,BuildContext context) {
    setState(() {
      responses[currentIndex] = answer; // Store the selected answer
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('All questions answered!')),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PersonalDetailsForm();
        },) );
      }
    });
  }

  // Function to navigate to the previous question
  void goToPreviousQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (currentIndex == 0) {
              Navigator.pop(context); // Exit the screen if on the first question
            } else {
              goToPreviousQuestion(); // Go to the previous question
            }
          },
        ),
        title:  Text(
          '${currentIndex + 1} of ${questions.length}',
          style: AppTextStyles.bodyText.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: toggleLanguage,
            child: Text(
              isMalayalam ? "English" : "മലയാളം",
              style: AppTextStyles.smallBodyText.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Progress Indicator
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,minHeight: 8,
              color: Colors.green,borderRadius: BorderRadius.circular(16),
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 20),
            // Current Question Index

            SizedBox(height: 20),
            // Display Question in Selected Language
            Text(
              isMalayalam
                  ? questions[currentIndex]["ml"] ?? ""
                  : questions[currentIndex]["en"] ?? "",
              style: AppTextStyles.smallBodyText.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            // Yes/No Buttons
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(elevation: 0,
                        backgroundColor: responses[currentIndex] == true
                            ? Colors.green
                            : Colors.transparent,

                        side: BorderSide(color: Colors.black.withOpacity(0.5),),
                      ),
                      onPressed: () {
                        handleAnswerSelection(true,context); // Handle Yes Answer
                      },
                      child: Text(
                        'Yes',
                        style: AppTextStyles.smallBodyText.copyWith(
                          color: responses[currentIndex] == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 0,
                        backgroundColor: responses[currentIndex] == false
                            ? Colors.green
                            : Colors.transparent,
                        side: BorderSide(color: Colors.black.withOpacity(0.5)),
                      ),
                      onPressed: () {
                        handleAnswerSelection(false,context); // Handle No Answer
                      },
                      child: Text(
                        'No',
                        style: AppTextStyles.smallBodyText.copyWith(
                          color: responses[currentIndex] == false
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



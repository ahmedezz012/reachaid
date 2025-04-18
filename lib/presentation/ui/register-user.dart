import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'bottom-nav-screen.dart';
import '../components/rounded-corner-button.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _mobileNumber;
  String? _password;
  String? _confirmPassword;
  String? _userName;
  int? _userAge;
  String? _gender;
  String? _medicalHistory;
  String _countryCode = '+97';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('تسجيل'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 1. Mobile Number
                Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (CountryCode code) {
                        setState(() {
                          _countryCode = code.dialCode!;
                        });
                      },
                      initialSelection: 'PS',
                      favorite: const ['IL', 'PS'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'رقم الهاتف',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب ادخال رقم الهاتف';
                          }
                          return null;
                        },
                        onSaved: (value) => _mobileNumber = value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 2. Password
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادخال كلمة المرور';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                  onChanged: (value) => _password = value,
                ),
                const SizedBox(height: 16),

                // 3. Confirm Password
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'تآكيد كلمة المرور',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادخال تآكيد كلمة المرور';
                    }
                    if (value != _password) {
                      return 'كلمة المرور و تآكيد كلمة المرور غير متطابقين';
                    }
                    return null;
                  },
                  onSaved: (value) => _confirmPassword = value,
                ),
                const SizedBox(height: 16),

                // 4. User Name
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'اسم المستخدم',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادخال اسم المستخدم';
                    }
                    return null;
                  },
                  onSaved: (value) => _userName = value,
                ),
                const SizedBox(height: 16),

                // 5. User Age
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'عمر المستخدم',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادخال عمر المستخدم';
                    }
                    if (int.tryParse(value) == null) {
                      return 'ادخل عمر صحيح';
                    }
                    return null;
                  },
                  onSaved: (value) => _userAge = int.tryParse(value!),
                ),
                const SizedBox(height: 16),

                // 6. Gender (Radio Buttons)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('الجنس'),
                    Row(
                      children: <Widget>[
                        Radio<String>(
                          value: 'male',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        const Text('ذكر'),
                        Radio<String>(
                          value: 'female',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        const Text('انثي'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 7. Medical History (Multiline)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'مشاكل صحية يعاني منها المستخدم',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) => _medicalHistory = value,
                ),
                const SizedBox(height: 24),
                SizedBox(
                    // To control the button's width
                    width: double.infinity,
                    height: 60,
                    // Submit Button
                    child: RoundedCornerButton(
                      text: 'تسجيل',
                      color: Colors.red,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavScreen()),
                            (Route<dynamic> route) => false,
                          );
                          // Process the registration data
                          print('Mobile Number: $_countryCode $_mobileNumber');
                          print('Password: $_password');
                          print('User Name: $_userName');
                          print('User Age: $_userAge');
                          print('Gender: $_gender');
                          print('Medical History: $_medicalHistory');
                          // You would typically send this data to your backend
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

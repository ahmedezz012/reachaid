import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:reachaid/user-type.dart';
import '../components/rounded-corner-button.dart';
import 'bottom-nav-screen.dart';
class RegisterRescuer extends StatefulWidget {
  const RegisterRescuer({super.key});

  @override
  State<RegisterRescuer> createState() => _RegisterRescuerState();
}

class _RegisterRescuerState extends State<RegisterRescuer> {
  final _formKey = GlobalKey<FormState>();
  String? _mobileNumber;
  String? _password;
  String? _confirmPassword;
  String? _rescuerName;
  int? _userAge;
  String? _rescuerPlace;
  String? _rescuerGovernorate;
  String _countryCode = '+97';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('تسجيل مسعف'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    child: Image.asset('assets/images/rescue.jpeg',
                      fit: BoxFit.fitWidth,),
                  ),
                ),
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
                    labelText: 'اسم المسعف',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادخال اسم المسعف';
                    }
                    return null;
                  },
                  onSaved: (value) => _rescuerName = value,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: ' مكان العمل',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادخال مكان العمل';
                    }
                    return null;
                  },
                  onSaved: (value) => _rescuerPlace = value,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'محافظة العمل',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادخال محافظة العمل';
                    }
                    return null;
                  },
                  onSaved: (value) => _rescuerGovernorate = value,
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
                                builder: (context) => BottomNavScreen(userType: UserType.Rescuer)),
                                (Route<dynamic> route) => false,
                          );
                          // Process the registration data
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

import 'package:flutter/material.dart';
import 'package:register_form/utils/widgets/custom_form_field.dart';
import 'package:register_form/validations/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String? name, phone, email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration form'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade200,
      ),
      body: buildUi(),
    );
  }

  Widget buildUi() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: 'Name',
                obscureText: false,
                validator: (value) {
                  if (value!.isValidName == false) {
                    return 'Enter a valid username';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              CustomFormField(
                obscureText: true,
                hintText: 'Phone number',
                validator: (value) {
                  if (!value!.isValidPhone) {
                    return 'Enter a valid Kenyan number';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    phone = value;
                  });
                },
              ),
              CustomFormField(
                hintText: 'Email',
                obscureText: true,
                validator: (value) {
                  if (!value!.isValidEmail) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              CustomFormField(
                hintText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (!value!.isValidPassword) {
                    return 'Enter a valid password';
                  }
                  return null;
                },

                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //save the form
                    _formKey.currentState!.save();
                    print("Form data saved successfully");
                    print(
                      'Name: $name\nPhone: $phone\nEmail address:$email\nPassword: $password\n',
                    );
                    _formKey.currentState!.reset();
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

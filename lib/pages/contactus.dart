import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final formKey = GlobalKey<FormState>();
  String fName = ''; String lName = ''; String email = ''; String message = ''; String phone = '';
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  void _clearFNameField() {
    _fNameController.clear();
    setState(() {});
  }
  void _clearLNameField() {
    _lNameController.clear();
    setState(() {});
  }
  void _clearEmailField() {
    _emailController.clear();
    setState(() {});
  }
  void _clearPhoneField() {
    _phoneController.clear();
    setState(() {});
  }
  void _clearMessageField() {
    _messageController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Center(
              child: Text(
                'Get In Touch',
                style: GoogleFonts.notoSans(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: buildFirstName()),
              const SizedBox(width: 10.0),
              Flexible(child: buildLastName())
            ],
          ),
          const SizedBox(height: 20.0),
          buildPhoneNumber(),
          const SizedBox(height: 30.0),
          buildEmail(),
          const SizedBox(height: 30.0),
          buildMessage(),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              final isValid = formKey.currentState!.validate();
              sendEmail(
                  fname: _fNameController.text,
                  lname: _lNameController.text,
                  email: _emailController.text,
                  message: _messageController.text,
                  phone: _phoneController.text
              );
              _clearLNameField();
              _clearFNameField();
              _clearEmailField();
              _clearPhoneField();
              _clearMessageField();
            },
            child: Text(
              'Send Message',
              style: GoogleFonts.notoSans(
                fontSize: 24.0,
                fontWeight: FontWeight.w600
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFFE7D6A),
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0)
            ),
          )
        ],
      )
    );
  }

  Future sendEmail({ required String fname, required String lname, required String email, required String message, required String phone }) async {
    const serviceId = 'service_36on05i';
    const templateId = 'template_sgu4q2a';
    const userId = 'user_fj5amFKI0a04bbYRtnGw5';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'first_name': fname,
          'last_name': lname,
          'user_email': email,
          'user_message': message,
          'phone_number': phone
        }
      })
    );
  }

  Widget buildFirstName() => TextFormField(
    controller: _fNameController,
    onChanged: (value) {
      setState(() {});
    },
    decoration: InputDecoration(
      labelText: 'First Name',
      labelStyle: const TextStyle(
        color: Color(0xFFFE7D6A),
        fontStyle: FontStyle.italic
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFE7D6A),
          width: 2
        )
      ),
      suffixIcon: _fNameController.text.isEmpty ? null : IconButton(
        icon: const Icon(
          Icons.clear,
          color: Color(0xFFFE7D6A),
        ),
        onPressed: _clearFNameField,
      ),
    ),
    validator: (value) {
      if (value!.length < 4) {
        return 'Enter at least 4 characters';
      } else {
        return null;
      }
    },
    maxLength: 30,
    onSaved: (value) => setState(() => fName = value!),
  );

  Widget buildLastName() => TextFormField(
    controller: _lNameController,
    onChanged: (value) {
      setState(() {});
    },
    decoration: InputDecoration(
      labelText: 'Last Name',
      labelStyle: const TextStyle(
        color: Color(0xFFFE7D6A),
        fontStyle: FontStyle.italic
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFE7D6A),
          width: 2
        )
      ),
      suffixIcon: _lNameController.text.isEmpty ? null : IconButton(
        icon: const Icon(
            Icons.clear,
            color: Color(0xFFFE7D6A),
        ),
        onPressed: _clearLNameField,
      ),
    ),
    validator: (value) {
      if (value!.length < 4) {
        return 'Enter at least 4 characters';
      } else {
        return null;
      }
    },
    maxLength: 30,
    onSaved: (value) => setState(() => lName = value!),
  );

  Widget buildEmail() => TextFormField(
    controller: _emailController,
    onChanged: (value) {
      setState(() {});
    },
    decoration: InputDecoration(
      icon: const Icon(Icons.alternate_email),
      labelText: 'Email',
      labelStyle: const TextStyle(
        color: Color(0xFFFE7D6A),
        fontStyle: FontStyle.italic
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFE7D6A),
          width: 2
        )
      ),
      suffixIcon: _emailController.text.isEmpty ? null : IconButton(
        icon: const Icon(
          Icons.clear,
          color: Color(0xFFFE7D6A)
        ),
        onPressed: _clearEmailField,
      ),
    ),
    validator: (value) {
      const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
      final regExp = RegExp(pattern);

      if (value!.isEmpty) {
        return 'Enter an email';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter a valid email';
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.emailAddress,
    onSaved: (value) => setState(() => email = value!),
  );

  Widget buildMessage() => TextFormField(
    controller: _messageController,
    onChanged: (value) {
      setState(() {});
    },
    decoration: InputDecoration(
      icon: const Icon(Icons.email),
      labelText: 'Message',
      labelStyle: const TextStyle(
        color: Color(0xFFFE7D6A),
        fontStyle: FontStyle.italic
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFE7D6A),
          width: 2
        )
      ),
      suffixIcon: _messageController.text.isEmpty ? null : IconButton(
        icon: const Icon(
          Icons.clear,
          color: Color(0xFFFE7D6A),
        ),
        onPressed: _clearMessageField,
      ),
    ),
    validator: (value) {
      if (value!.length < 4) {
        return 'Enter at least 4 characters';
      } else {
        return null;
      }
    },
    maxLength: 200,
    maxLines: 6,
    onSaved: (value) => setState(() => message = value!),
  );

  Widget buildPhoneNumber() => TextFormField(
    controller: _phoneController,
    onChanged: (value) {
      setState(() {});
    },
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      icon: const Icon(Icons.phone),
      labelText: 'Phone Number',
      labelStyle: const TextStyle(
        color: Color(0xFFFE7D6A),
        fontStyle: FontStyle.italic
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFE7D6A),
          width: 2
        )
      ),
      suffixIcon: _phoneController.text.isEmpty ? null : IconButton(
        icon: const Icon(
          Icons.clear,
          color: Color(0xFFFE7D6A),
        ),
        onPressed: _clearPhoneField,
      ),
    ),
    validator: (value) {
      if (value!.length < 8) {
        return 'Enter at least 8 numbers';
      } else {
        return null;
      }
    },
    onSaved: (value) => setState(() => phone = value!)
  );
}

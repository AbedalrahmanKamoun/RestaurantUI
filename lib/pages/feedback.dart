import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double rating = 3.0;
  final formKey = GlobalKey<FormState>();
  String feedback = ''; String name = '';
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  void _clearFeedbackField() {
    _feedbackController.clear();
    setState(() {});
  }
  void _clearNameField() {
    _nameController.clear();
    setState(() {});
  }
  late Color ratingColor = Colors.amber;
  getRatingColor(ratingColor, rating) {
    this.ratingColor = ratingColor;
    this.rating = rating;
    if (rating <= 1.0) {
      ratingColor = Colors.red;
    } else if (rating == 2.0) {
      ratingColor = Colors.redAccent;
    } else if (rating == 3.0) {
      ratingColor = Colors.amber;
    } else if (rating == 4.0) {
      ratingColor = Colors.lightGreen;
    } else if (rating == 5.0) {
      ratingColor = Colors.green;
    }
    return ratingColor;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Center(
            child: Text(
              'Rate Us',
              style: GoogleFonts.notoSans(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w800
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingBar.builder(
              minRating: 0,
              itemCount: 5,
              initialRating: 3.0,
              itemSize: 46,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              updateOnDrag: true,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
                return const Text('');
              },
              onRatingUpdate: (rating) {
                setState(() {
                  this.rating = rating;
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              'Rating: $rating',
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  color: getRatingColor(ratingColor, rating)
              ),
            ),
            const SizedBox(height: 50.0),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'User Name',
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
                      prefixIcon: const Icon(Icons.tag_faces),
                      suffixIcon: _nameController.text.isEmpty ? null : IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Color(0xFFFE7D6A),
                        ),
                        onPressed: _clearFeedbackField,
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return 'Enter at least 4 characters';
                      } else {
                        return null;
                      }
                    },
                    maxLength: 20,
                    onSaved: (value) => setState(() => name = value!),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _feedbackController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Feedback',
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
                      prefixIcon: const Icon(Icons.feedback),
                      suffixIcon: _feedbackController.text.isEmpty ? null : IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Color(0xFFFE7D6A),
                        ),
                        onPressed: _clearFeedbackField,
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
                    onSaved: (value) => setState(() => feedback = value!),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      final isValid = formKey.currentState!.validate();
                      sendEmail(
                          name: _nameController.text,
                          feedback: _feedbackController.text,
                          rate: rating.toString()
                      );
                      _clearNameField();
                      _clearFeedbackField();
                    },
                    child: Text(
                      'Send Feedback',
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
              ),
            )
          ],
        )
      ],
    );
  }

  Future sendEmail({ required String name, required String feedback, required String rate }) async {
    const serviceId = 'service_36on05i';
    const templateId = 'template_gugnb1t';
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
            'user_name': name,
            'feedback': feedback,
            'rate': rate
          }
        })
    );
  }
}

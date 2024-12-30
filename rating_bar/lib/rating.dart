import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({super.key});

  @override
  _RatingBarWidgetState createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  double _rating = 0.0; // Stores the current rating
  bool _isSubmitted = false; // Tracks if the rating is submitted

  void _submitRating() {
    if (_rating > 0) {
      setState(() {
        _isSubmitted = true; // Set submitted to true
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rating Bar
            RatingBar.builder(
              initialRating: _rating, // Initial value
              minRating: 1, // Minimum rating allowed
              direction: Axis.horizontal, // Stars are laid out horizontally
              allowHalfRating: true, // Enable half-star ratings
              itemCount: 5, // Number of stars
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0), // Spacing between stars
              itemBuilder: (context, _) => Icon(
                Icons.star, // Star icon for each rating item
                color: Colors.amber, // Amber color for stars
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating; // Update the rating value
                  _isSubmitted = false; // Reset submitted status when rating changes
                });
              },
            ),

            SizedBox(height: 20), // Add some space

            // Display the current rating
            Text(
              'Selected Rating: $_rating',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20), // Add some space

            // Submit Button
            ElevatedButton(
              onPressed: _submitRating, // Call _submitRating on press
              child: Text('Submit Rating'),
            ),

            SizedBox(height: 20), // Add some space

            // Thank You Message
            if (_isSubmitted)
              Text(
                'Thank you for your rating!',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, // Remove debug banner
  home: RatingBarWidget(),
));

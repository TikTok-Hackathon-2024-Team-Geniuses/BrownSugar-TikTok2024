import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
      const MyApp()); // Entry point of the application, running the MyApp widget.
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // Constructor for MyApp, using const to indicate it is a compile-time constant.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok App', // The title of the application.
      theme: ThemeData(
        // Theme configuration for the application.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(
              255, 84, 69, 111), // Seed color for generating the color scheme.
        ),
        useMaterial3: true, // Using Material Design 3.
      ),
      home:
          const MusicScreen(), // Setting the home screen of the application to MusicScreen.
    );
  }
}

// This screen displays the music section of the application.
class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key}); // Constructor for MusicScreen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Provides the structure for the screen with an AppBar and body.
      appBar: AppBar(
        // The top app bar with a back button, search bar, and search icon.
        backgroundColor: Colors.black, // Background color of the AppBar.
        leading: Hero(
          // Hero animation for the back button.
          tag: 'backButton', // Unique tag for the Hero animation.
          child: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Colors.white), // Icon for the back button.
            // Function executed when the back button is pressed.
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Returning to the previous page...'), // Message displayed in the SnackBar.
                ),
              );
              Future.delayed(const Duration(seconds: 2), () {
                // Adding a delay before popping the navigation.
                // Navigator.pop(context);
                // atm we won't navigate back to any page
              });
            },
          ),
        ),
        title: Hero(
          // Hero animation for the search bar.
          tag: 'searchBar', // Unique tag for the Hero animation.
          child: Material(
            color: Colors
                .transparent, // Transparent background for the Material widget.
            child: Container(
              decoration: BoxDecoration(
                // Applying a linear gradient to the container's background.
                gradient: const LinearGradient(
                  colors: [
                    Colors.pinkAccent,
                    Colors.purpleAccent
                  ], // Gradient colors.
                  begin: Alignment.topLeft, // Starting point of the gradient.
                  end: Alignment.bottomRight, // Ending point of the gradient.
                ),
                borderRadius: BorderRadius.circular(
                    30.0), // Rounded corners for the container.
              ),
              child: TextField(
                decoration: const InputDecoration(
                  // Configuration for the TextField's decoration.
                  hintText: 'Search', // Placeholder text for the search bar.
                  hintStyle: TextStyle(
                      color: Colors.white70), // Style for the hint text.
                  border: InputBorder
                      .none, // Removing the default border of the TextField.
                  prefixIcon: Icon(Icons.search,
                      color: Colors
                          .white), // Icon displayed at the beginning of the TextField.
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0), // Padding inside the TextField.
                ),
                // This is the onSubmitted function for the search bar.
                // It displays a SnackBar with the search query when the user submits the search.
                onSubmitted: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Searching for "$value"'), // Message displayed in the SnackBar.
                    ),
                  );
                },
                style: const TextStyle(
                    color: Colors
                        .white), // Style for the text entered in the TextField.
              ),
            ),
          ),
        ),
        actions: const [
          // Additional actions displayed at the end of the AppBar.
          Hero(
            tag: 'searchIcon', // Unique tag for the Hero animation.
            child: Padding(
              padding: EdgeInsets.all(8.0), // Padding around the search icon.
              child: Icon(Icons.search, color: Colors.white), // Search icon.
            ),
          ),
        ],
      ),
      body: Padding(
        // Adding padding around the body content.
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Makes the body content scrollable.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Aligns children to the start of the column.
            children: [
              // Section title with vibrant style.
              const Text(
                'Music for you',
                style: TextStyle(
                  fontSize: 24, // Font size of the text.
                  fontWeight: FontWeight.bold, // Font weight of the text.
                  color: Colors.pinkAccent, // Text color.
                  fontFamily: 'Vintage', // Custom font family.
                ),
              ),
              const SizedBox(height: 10), // Spacer with a height of 10 pixels.
              // Grid view for 'Music for you' section with vibrant style.
              GridView.builder(
                // Ensures the GridView takes only the necessary space and does not expand infinitely.
                shrinkWrap: true,
                // Disables scrolling for the GridView since it is wrapped in a SingleChildScrollView.
                physics: const NeverScrollableScrollPhysics(),
                // Defines the grid layout for the GridView.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Sets the number of columns in the grid.
                  crossAxisSpacing:
                      10, // Sets the horizontal space between grid items.
                  mainAxisSpacing:
                      10, // Sets the vertical space between grid items.
                  childAspectRatio:
                      1.5, // Sets the aspect ratio of the grid items.
                ),
                itemCount: 4, // Number of items in the grid.
                // Builds each item in the grid.
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    // Duration of the animation for property changes.
                    duration: const Duration(milliseconds: 500),
                    // Decoration of the container, including gradient, border radius, and border.
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        // List of colors for the gradient, changing based on the index.
                        colors: [
                          Colors.primaries[index % Colors.primaries.length]
                              .withOpacity(0.7),
                          Colors
                              .primaries[(index + 1) % Colors.primaries.length]
                              .withOpacity(0.7)
                        ],
                        begin: Alignment
                            .topLeft, // Starting point of the gradient.
                        end: Alignment
                            .bottomRight, // Ending point of the gradient.
                      ),
                      borderRadius: BorderRadius.circular(
                          10), // Rounded corners for the container.
                      border: Border.all(
                          color: Colors.black54,
                          width:
                              1), // Border for the container with color and width.
                    ),
                    // Content of the container.
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centers the children vertically and horizontally.
                      children: [
                        // Icon to represent play action.
                        const Icon(Icons.play_arrow,
                            size: 50, color: Colors.white),
                        const SizedBox(
                            height:
                                10), // Spacer to create some vertical space between the icon and the text.
                        // Text displaying the music number.
                        Text(
                          'Music ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Vintage'), // Styling for the text.
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20), // Spacer with a height of 20 pixels.
              // Section title with vibrant style.
              const Text(
                'Trending',
                style: TextStyle(
                  fontSize: 24, // Font size of the text.
                  fontWeight: FontWeight.bold, // Font weight of the text.
                  color: Colors.pinkAccent, // Text color.
                  fontFamily: 'Vintage', // Custom font family.
                ),
              ),
              const SizedBox(height: 10),
              // Grid view for 'Trending' section with vibrant style
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      // Applying a linear gradient to the container's background
                      gradient: LinearGradient(
                        colors: [
                          // Selecting colors from Colors.primaries and making them slightly transparent
                          // The index ensures a variety of colors by offsetting the index and wrapping around using modulo operation
                          Colors
                              .primaries[(index + 4) % Colors.primaries.length]
                              .withOpacity(0.7),
                          Colors
                              .primaries[(index + 5) % Colors.primaries.length]
                              .withOpacity(0.7),
                        ],
                        // The gradient starts from the top-left corner of the container
                        begin: Alignment.topLeft,
                        // The gradient ends at the bottom-right corner of the container
                        end: Alignment.bottomRight,
                      ),
                      // Adding rounded corners to the container with a radius of 10 pixels
                      borderRadius: BorderRadius.circular(10),
                      // Adding a border with a color and width
                      border: Border.all(color: Colors.black54, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_arrow,
                            size: 50, color: Colors.white),
                        const SizedBox(height: 10),
                        Text(
                          'Trending ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Vintage'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

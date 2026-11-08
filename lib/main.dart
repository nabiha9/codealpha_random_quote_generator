import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const QuoteApp());

class Quote {
  final String text;
  final String author;
  const Quote(this.text, this.author);
}

const List<Quote> quotes = [
  Quote('The only way to do great work is to love what you do.', 'Steve Jobs'),
  Quote('It always seems impossible until it is done.', 'Nelson Mandela'),
  Quote('Whether you think you can or you think you can\'t, you\'re right.', 'Henry Ford'),
  Quote('The future depends on what you do today.', 'Mahatma Gandhi'),
  Quote('Well done is better than well said.', 'Benjamin Franklin'),
  Quote('Act as if what you do makes a difference. It does.', 'William James'),
  Quote('Do what you can, with what you have, where you are.', 'Theodore Roosevelt'),
  Quote('Knowing is not enough; we must apply.', 'Johann Wolfgang von Goethe'),
  Quote('The best way to predict the future is to create it.', 'Peter Drucker'),
  Quote('Quality means doing it right when no one is looking.', 'Henry Ford'),
  Quote('Simplicity is the ultimate sophistication.', 'Leonardo da Vinci'),
  Quote('What we think, we become.', 'Buddha'),
  Quote('Learning never exhausts the mind.', 'Leonardo da Vinci'),
  Quote('Everything you can imagine is real.', 'Pablo Picasso'),
  Quote('Fall seven times, stand up eight.', 'Japanese proverb'),
  Quote('The journey of a thousand miles begins with a single step.', 'Lao Tzu'),
  Quote('Life is what happens when you\'re busy making other plans.', 'John Lennon'),
  Quote('In the middle of difficulty lies opportunity.', 'Albert Einstein'),
  Quote('Imagination is more important than knowledge.', 'Albert Einstein'),
  Quote('Stay hungry, stay foolish.', 'Steve Jobs'),
  Quote('Nothing will work unless you do.', 'Maya Angelou'),
  Quote('You miss 100% of the shots you don\'t take.', 'Wayne Gretzky'),
  Quote('Perseverance is not a long race; it is many short races one after the other.', 'Walter Elliot'),
  Quote('Start where you are. Use what you have. Do what you can.', 'Arthur Ashe'),
  Quote('Courage is grace under pressure.', 'Ernest Hemingway'),
  Quote('A smooth sea never made a skilled sailor.', 'Franklin D. Roosevelt'),
  Quote('Great things are done by a series of small things brought together.', 'Vincent van Gogh'),
  Quote('Happiness depends upon ourselves.', 'Aristotle'),
  Quote('He who has a why to live can bear almost any how.', 'Friedrich Nietzsche'),
  Quote('Energy and persistence conquer all things.', 'Benjamin Franklin'),
];

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2F4858),
          surface: const Color(0xFFF7F5F0),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F5F0),
      ),
      home: const QuoteScreen(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final Random _random = Random();
  late Quote _current;

  @override
  void initState() {
    super.initState();
    // A random quote is shown every time the app opens.
    _current = quotes[_random.nextInt(quotes.length)];
  }

  void _newQuote() {
    Quote next;
    // Keep picking until it differs from the current one.
    do {
      next = quotes[_random.nextInt(quotes.length)];
    } while (next == _current);
    setState(() => _current = next);
  }

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF1F2A30);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: Column(
                            key: ValueKey(_current),
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '\u201C',
                                style: TextStyle(
                                  fontFamily: 'Georgia',
                                  fontSize: 96,
                                  height: 0.8,
                                  color: Color(0xFFB8860B),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _current.text,
                                style: const TextStyle(
                                  fontFamily: 'Georgia',
                                  fontSize: 30,
                                  height: 1.4,
                                  color: ink,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                _current.author,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: ink.withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton(
                        onPressed: _newQuote,
                        style: FilledButton.styleFrom(
                          backgroundColor: ink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'New Quote',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
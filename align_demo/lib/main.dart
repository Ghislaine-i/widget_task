import 'package:flutter/material.dart';

void main() => runApp(const AlignDemoApp());

class AlignDemoApp extends StatelessWidget {
  const AlignDemoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Align Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
    home: const ChatScreen(),
  );
}

class Message {
  final String text;
  final bool isMe;
  const Message(this.text, this.isMe);
}

const messages = [
  Message('Hey! Are we still meeting at 5?', false),
  Message('Yes, see you at the cafe.', true),
  Message('Great, I will bring the notes.', false),
  Message('Perfect, thanks!', true),
];

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  double _widthFactor = 1.0;
  double _heightFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Align: Chat Demo')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                for (final m in messages)
                  // PROPERTY 1: alignment decides left vs right.
                  Align(
                    alignment: m.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: m.isMe
                            ? Colors.teal.shade100
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(m.text),
                    ),
                  ),
                const SizedBox(height: 16),
                const Text('widthFactor / heightFactor playground'),
                const SizedBox(height: 8),
                // Center loosens the constraints so the amber box can
                // shrink to the Align's size instead of filling the width.
                Center(
                  child: Container(
                    color: Colors.amber.shade100, // shows the Align's own size
                    child: Align(
                      alignment: Alignment.center,
                      // PROPERTY 2 and 3: Align size = child size * factor.
                      widthFactor: _widthFactor,
                      heightFactor: _heightFactor,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.teal.shade200,
                        child: const Text('Typing...'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text('widthFactor: ${_widthFactor.toStringAsFixed(1)}'),
                Slider(
                  value: _widthFactor,
                  min: 1,
                  max: 3,
                  onChanged: (v) => setState(() => _widthFactor = v),
                ),
                Text('heightFactor: ${_heightFactor.toStringAsFixed(1)}'),
                Slider(
                  value: _heightFactor,
                  min: 1,
                  max: 3,
                  onChanged: (v) => setState(() => _heightFactor = v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

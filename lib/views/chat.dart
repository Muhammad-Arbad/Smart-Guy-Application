import 'package:flutter/material.dart';
import 'package:smart_guy/widgets/custom_expansion_tile.dart';
import 'package:smart_guy/widgets/greeting_text_col.dart';
import '../models/chat_steps.dart';
import '../widgets/custom_chat_avatar.dart';
import '../widgets/custom_chat_options.dart';
import '../widgets/typing_dots.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ScrollController _scrollController = ScrollController();

  final List<ChatStep> _chatFlow = [
    ChatStep(
      message: "Which area would you like to explore today?",
      options: [
        'Personal/Spiritual',
        'Health/Wellness',
        'Legends',
        'Relationships/Life',
        'Work/Explore',
      ],
    ),
    ChatStep(
      message: "Which aspect of Personal/Spiritual would you like to focus on?",
      options: [
        'Faith',
        'Life',
        'Legends',
        'Work/Explore',
        'Relationships/Life',
      ],

    ),
    ChatStep(
      message: "Which area of Faith interests you most?",
      options: [
        'Be Humble',
        'Exhibit Love',
        'Be Compassionate',
        'Demonstrate Patience',
        'Exude Kindness',
        'Be Honest and Truthful',
        'Practice Forgiveness',
        'Cultivate Self-Control',
        'Practice Gratitude',
        'Avoid Pride',
        'Persevere Through Trials',
        'Soul Shield'
      ],

    ),
    ChatStep(
      message: "Here is the final output for your selection",
      isFinal: true,
    ),
  ];

 final Map<int, String> _selectedOptionPerStep = {};
  List<Widget> _chatWidgets = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addStepToChat(0);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const GreetingTextColumn(),
          ..._chatWidgets,
          if (_isLoading) const ColorfulBouncingDots(),
        ],
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _addStepToChat(int stepIndex) {
    if (stepIndex >= _chatFlow.length) return;
    final step = _chatFlow[stepIndex];

    _chatWidgets.add(CustomChatboxavatar(text: step.message));

    if (!step.isFinal) {
      _chatWidgets.add(
        customChatboxoptions(
          items: step.options,
          selectedItem: _selectedOptionPerStep[stepIndex],
          onItemSelected: (selectedItem) => _handleOptionSelected(selectedItem, stepIndex),
        ),
      );
    }
    else{
      _chatWidgets.addAll([
        CustomExpansionTile(
          title:"🌿 Reflection on Humility",
          expandedTitle: "True humility is not about thinking less of yourself, but thinking of yourself less. It’s about recognizing your strengths while remaining open to growth, correction, and the value others bring. A humble heart listens more than it speaks, learns more than it boasts, and leads by example rather than ego.",
        ),
        CustomExpansionTile(
          title:"💡 Tip",
          expandedTitle: "True humility is not about thinking less of yourself, but thinking of yourself less. It’s about recognizing your strengths while remaining open to growth, correction, and the value others bring. A humble heart listens more than it speaks, learns more than it boasts, and leads by example rather than ego.",
        ),
    ]
      );
    }

    setState(() {});
    _scrollToBottom();
  }

  List<Widget> _buildChatWidgetsUpToStep(int stepIndex) {
    List<Widget> widgets = [];
    for (int i = 0; i <= stepIndex; i++) {
      final step = _chatFlow[i];
      widgets.add(CustomChatboxavatar(text: step.message));
      if (!step.isFinal) {
        widgets.add(
          customChatboxoptions(
            items: step.options,
            selectedItem: _selectedOptionPerStep[i],
            onItemSelected: (selectedItem) => _handleOptionSelected(selectedItem, i),
          ),
        );
      }
      // else{
      //   widgets.add(
      //   CustomExpansionTile(
      //     title:"🌿 Reflection on Humility",
      //     expandedTitle: "True humility is not about thinking less of yourself, but thinking of yourself less. It’s about recognizing your strengths while remaining open to growth, correction, and the value others bring. A humble heart listens more than it speaks, learns more than it boasts, and leads by example rather than ego.",
      //   ),
      //   );
      // }
    }
    return widgets;
  }

  Future<void> _handleOptionSelected(String selectedItem, int currentStepIndex) async {
    if (_selectedOptionPerStep[currentStepIndex] == selectedItem) return;

    setState(() {
      _isLoading = true;
      _selectedOptionPerStep[currentStepIndex] = selectedItem;
      _selectedOptionPerStep.removeWhere((key, _) => key > currentStepIndex);
      _chatWidgets = _buildChatWidgetsUpToStep(currentStepIndex);
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      final nextStepIndex = _findNextStepIndex(currentStepIndex, selectedItem);
      if (nextStepIndex != -1) {
        _addStepToChat(nextStepIndex);
      }
    });
  }

  int _findNextStepIndex(int currentStepIndex, String selectedOption) {
    for (int i = currentStepIndex + 1; i < _chatFlow.length; i++) {
      // final step = _chatFlow[i];
      // if (step.parentOption == selectedOption) return i;
    }
    if (currentStepIndex + 1 < _chatFlow.length) return currentStepIndex + 1;
    return -1;
  }
}



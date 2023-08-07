import 'package:flutter/material.dart';
import 'package:reatividade_value_notifier_state_pattern/state_pattern.dart';
import 'package:reatividade_value_notifier_state_pattern/value_notifier.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key, required this.controller});

  final NameController controller;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  NameController get _controller => widget.controller;

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.error),
        onPressed: () {
          _controller.errorState();
        },
      ),
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: ValueListenableBuilder<MyPageStatePattern>(
        valueListenable: _controller,
        builder: (context, state, widget) {
          switch (state) {
            case LoadingPageState _:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );

            case SuccessPageState state:
              final names = state.names;
              return ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  final name = names[index];

                  return ListTile(
                    title: Text(name),
                  );
                },
              );

            case ErrorPageState state:
              return Center(
                child: Text(state.message),
              );
          }
        },
      ),
    );
  }
}

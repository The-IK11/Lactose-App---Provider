import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValulistenableScreen extends StatefulWidget {
  const ValulistenableScreen({super.key});

  @override
  State<ValulistenableScreen> createState() => _ValulistenableScreenState();
}

class _ValulistenableScreenState extends State<ValulistenableScreen> {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> isObsecure = ValueNotifier<bool>(false);
  final ValueNotifier<List<String>> itemList = ValueNotifier<List<String>>([]);
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    counter.dispose();
    isObsecure.dispose();
    itemList.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void closeFocus() {
    if (focusNode.hasFocus) focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeFocus,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialogBox(context);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'ValueListenableBuilder',
            style: GoogleFonts.pottaOne(color: Colors.white, fontSize: 24),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obscure test
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: ValueListenableBuilder<bool>(
                valueListenable: isObsecure,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: focusNode,
                    obscureText: value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => isObsecure.value = !isObsecure.value,
                        icon: value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Counter test
            Center(
              child: ValueListenableBuilder<int>(
                valueListenable: counter,
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // List Test
            Expanded(
              child: ValueListenableBuilder<List<String>>(
                valueListenable: itemList,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value[index]),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: TextField(
            autofocus: true,
            onSubmitted: (value) {
              // assign a new list so ValueNotifier notifies listeners
              itemList.value = List.from(itemList.value)..add(value);
              Navigator.pop(ctx);
            },
            decoration: const InputDecoration(hintText: 'Enter item'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ],
        );
      },
    );
  }
}
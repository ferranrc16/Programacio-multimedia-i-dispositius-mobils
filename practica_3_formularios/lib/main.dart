import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actividad 3 - Form C',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final String title = 'Ferran Ribera 26/27';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderChoiceChip<String>(
                name: 'choice_chips',
                decoration: const InputDecoration(
                  labelText: 'Choice Chips',
                  border: InputBorder.none,
                ),
                options: const [
                  FormBuilderChipOption(value: 'Flutter'),
                  FormBuilderChipOption(value: 'Android'),
                  FormBuilderChipOption(value: 'Chrome OS'),
                ],
              ),
              const SizedBox(height: 16),

              FormBuilderSwitch(
                name: 'switch',
                title: const Text('This is a switch'),
                initialValue: true,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(height: 16),

              FormBuilderTextField(
                name: 'text_field',
                decoration: const InputDecoration(
                  labelText: 'Text Field',
                  helperText: 'Value must have a length less than or ...',
                ),
                maxLength: 15,
              ),
              const SizedBox(height: 16),

              FormBuilderDropdown<String>(
                name: 'dropdown',
                decoration: const InputDecoration(
                  labelText: 'Dropdown Field',
                ),
                items: ['HTML', 'CSS', 'React', 'Dart', 'TypeScript', 'Angular']
                    .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),

              FormBuilderRadioGroup<String>(
                name: 'radio_group',
                decoration: const InputDecoration(
                  labelText: 'Radio Group Model',
                  border: InputBorder.none,
                ),
                orientation: OptionsOrientation.vertical,
                options: const [
                  FormBuilderFieldOption(value: 'Option 1'),
                  FormBuilderFieldOption(value: 'Option 2'),
                  FormBuilderFieldOption(value: 'Option 3'),
                  FormBuilderFieldOption(value: 'Option 4'),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _formKey.currentState?.saveAndValidate();
          String? formString = _formKey.currentState?.value.toString();
          
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Submission Completed'),
              icon: const Icon(Icons.check_circle),
              content: Text(formString ?? ''),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tancar'),
                )
              ],
            ),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
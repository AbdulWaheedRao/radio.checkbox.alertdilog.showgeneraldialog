import 'package:flutter/material.dart';
import 'package:flutter_radio_checkboxalertdialog/showgeneral.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const radioOptionFA = 'FA';
  static const radioOptionFSC = 'FSC';
  static const radioOptionICS = 'ICS';
  static const radioOptionICOm = 'I.COM';
  bool isPrint = false;
  String? groupValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Flutter'),
        actions: [
          IconButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Logingeneraldialog(),
                );
              },
              icon: Icon(Icons.alarm)),
          IconButton(
              onPressed: () async {
                bool isDelete = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(actions: [
                    Text('Do you want to delete'),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('yes')),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('No'))
                  ]),
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(isDelete.toString()),
                ));
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: Column(children: [
        ListTile(
          leading: Radio(
              value: radioOptionFA,
              groupValue: groupValue,
              onChanged: onChanged),
          title: Text('FA'),
        ),
        ListTile(
          leading: Radio(
              value: radioOptionFSC,
              groupValue: groupValue,
              onChanged: onChanged),
          title: Text('FSC'),
        ),
        ListTile(
          leading: Radio(
              value: radioOptionICOm,
              groupValue: groupValue,
              onChanged: onChanged),
          title: Text('ICOM'),
        ),
        ListTile(
          leading: Radio(
              value: radioOptionICS,
              groupValue: groupValue,
              onChanged: onChanged),
          title: Text('ICS'),
        )
      ]),
      // Center(
      //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     ListTile(
      //       leading: Checkbox(
      //         value: isPrint,
      //         onChanged: (value) => setState(() {
      //           isPrint = value!;
      //         }),
      //       ),
      //       title: Text('Abdul'),
      //     ),
      //     SizedBox(
      //       child: ListTile(
      //         leading: Checkbox(
      //           value: isPrint,
      //           onChanged: (value) => setState(() {
      //             isPrint = value!;
      //           }),
      //         ),
      //         title: Text('Bahawalpur'),
      //       ),
      //     ),
      //     ListTile(
      //       leading: Checkbox(
      //         value: isPrint,
      //         onChanged: (value) => setState(() {
      //           isPrint = value!;
      //         }),
      //       ),
      //       title: Text('Pakistan'),
      //     ),
      //   ]),
      // ),
    );
  }

  void onChanged(String? value) {
    setState(() {
      groupValue = value;
    });
  }
}

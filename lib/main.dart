import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _formKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
        menus: <MenuItem>[
          PlatformMenu(
            label: 'Mac MenuBar Demo App',
            menus: <MenuItem>[
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.about))
                    const PlatformProvidedMenuItem(
                        type: PlatformProvidedMenuItemType.about),
                ],
              ),
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.servicesSubmenu))
                    const PlatformProvidedMenuItem(
                        type: PlatformProvidedMenuItemType.servicesSubmenu),
                ],
              ),
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.hide))
                    const PlatformProvidedMenuItem(
                        type: PlatformProvidedMenuItemType.hide),
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.hideOtherApplications))
                    const PlatformProvidedMenuItem(
                        type:
                            PlatformProvidedMenuItemType.hideOtherApplications),
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.showAllApplications))
                    const PlatformProvidedMenuItem(
                        type: PlatformProvidedMenuItemType.showAllApplications),
                ],
              ),
              PlatformMenuItemGroup(members: <MenuItem>[
                if (PlatformProvidedMenuItem.hasMenu(
                    PlatformProvidedMenuItemType.quit))
                  const PlatformProvidedMenuItem(
                      type: PlatformProvidedMenuItemType.quit),
              ]),
            ],
          ),
          PlatformMenu(
            label: 'File',
            menus: <MenuItem>[
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  PlatformMenuItem(
                    label: 'New',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyN,
                        meta: true),
                    onSelected: () async {
                      _incrementCounter();
                      /*showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Hinge Aware Dialog"),
                          content: Text("Going on the left screen"),
                        ),
                      );*/

                      /*final clickedButton =
                          await FlutterPlatformAlert.showAlert(
                        windowTitle: 'This ia title',
                        text: 'This is body',
                        alertStyle: AlertButtonStyle.yesNoCancel,
                        iconStyle: IconStyle.information,
                      );*/
                      //}
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('AlertDialog Title'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('This is a demo alert dialog.'),
                                Text(
                                    'Would you like to approve of this message?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Approve'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: 'Edit',
            menus: <MenuItem>[
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  PlatformMenuItem(
                    label: 'Undo',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyZ,
                        meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Redo',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyZ,
                        meta: true, shift: true),
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  PlatformMenuItem(
                    label: 'Cut',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyX,
                        meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Copy',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyC,
                        meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Paste',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyV,
                        meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Delete',
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  PlatformMenuItem(
                    label: 'Select All',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyA,
                        meta: true),
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  PlatformMenu(
                    label: 'Speach',
                    menus: <MenuItem>[
                      PlatformMenuItemGroup(
                        members: <MenuItem>[
                          if (PlatformProvidedMenuItem.hasMenu(
                              PlatformProvidedMenuItemType.startSpeaking))
                            const PlatformProvidedMenuItem(
                                type:
                                    PlatformProvidedMenuItemType.startSpeaking),
                          if (PlatformProvidedMenuItem.hasMenu(
                              PlatformProvidedMenuItemType.stopSpeaking))
                            const PlatformProvidedMenuItem(
                                type:
                                    PlatformProvidedMenuItemType.stopSpeaking),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: 'View',
            menus: <MenuItem>[
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.toggleFullScreen))
                    const PlatformProvidedMenuItem(
                        type: PlatformProvidedMenuItemType.toggleFullScreen),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: 'Demo',
            menus: <MenuItem>[
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  PlatformMenuItem(
                      label: 'Increment',
                      shortcut: const SingleActivator(LogicalKeyboardKey.keyI,
                          meta: true),
                      onSelected: () {
                        _incrementCounter();
                      }),
                  PlatformMenuItem(
                      label: 'Reset',
                      onSelected: () {
                        _resetCounter();
                      }),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: 'Window',
            menus: <MenuItem>[
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.minimizeWindow))
                    const PlatformProvidedMenuItem(
                        type: PlatformProvidedMenuItemType.minimizeWindow),
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.zoomWindow))
                    const PlatformProvidedMenuItem(
                        type: PlatformProvidedMenuItemType.zoomWindow),
                ],
              ),
              PlatformMenuItemGroup(
                members: <MenuItem>[
                  if (PlatformProvidedMenuItem.hasMenu(
                      PlatformProvidedMenuItemType.arrangeWindowsInFront))
                    const PlatformProvidedMenuItem(
                        type:
                            PlatformProvidedMenuItemType.arrangeWindowsInFront),
                ],
              ),
            ],
          ),
        ],
        child: Material(
            child: Center(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'maps/webrtc/realm/login',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have selected the Increment many times:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                      margin: EdgeInsets.all(22),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // Add TextFormFields and ElevatedButton here.
                            TextFormField(
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            CupertinoTextFormFieldRow(
                              prefix: const Text('Enter text'),
                              placeholder: 'Enter text',
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                            ),
                            CupertinoButton(
                              onPressed: () {},
                              child: const Text('Button'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              )),
            ],
          ),
        )));
  }
}

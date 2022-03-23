import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: 'Fetchr',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        selected: index,
        header: Row(
          children: [
            Image.asset(
              "assets/icons/logo_outlined_64.png",
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text("Fetchr"),
            )
          ],
        ),
        items: [
          PaneItem(
              icon: const Icon(FluentIcons.fabric_folder),
              title: const Text("Collections")),
          PaneItem(
            icon: const Icon(FluentIcons.cloud_flow),
            title: const Text("APIs"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.variable_group),
            title: const Text("Environments"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.history),
            title: const Text("History"),
          )
        ],
        onChanged: (i) {
          setState(() {
            index = i;
          });
        },
        displayMode: PaneDisplayMode.top,
      ),
      content: NavigationBody(index: 0, children: [
        ScaffoldPage(
          content: Container(),
        ),
      ]),
    );
  }
}

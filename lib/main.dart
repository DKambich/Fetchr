import 'package:fetchr/pages/request_page.dart';
import 'package:fetchr/sidebars/request_sidebar.dart';
import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Fetchr',
      home: const MyHomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
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
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  FluentTheme.of(context).iconTheme.color ?? Colors.black,
                  BlendMode.srcIn),
              child: Image.asset(
                "assets/icons/logo_outlined_64.png",
              ),
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
          ),
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
          content: Row(children: const [
            Expanded(flex: 1, child: RequestSidebar()),
            Divider(
              direction: Axis.vertical,
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: RequestPage(),
                ))
          ]),
        ),
      ]),
    );
  }
}

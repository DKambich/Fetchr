import 'package:fluent_ui/fluent_ui.dart';

class RequestSidebar extends StatefulWidget {
  const RequestSidebar({Key? key}) : super(key: key);

  @override
  State<RequestSidebar> createState() => _RequestSidebarState();
}

class _RequestSidebarState extends State<RequestSidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TreeView(
          items: [sampleRequestDirectory],
        ),
      ],
    );
  }
}

final sampleRequestDirectory = TreeViewItem(
  content: Row(
    children: const [
      Icon(FluentIcons.folder_horizontal),
      SizedBox(width: 4),
      Text("Directory"),
    ],
  ),
  children: [
    TreeViewItem(
        content: Row(
      children: [
        SizedBox(
          width: 30,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("GET",
                style: TextStyle(fontSize: 10, color: Colors.green)),
          ),
        ),
        const SizedBox(width: 4),
        const Text("Request #1"),
      ],
    )),
    TreeViewItem(
        content: Row(
      children: [
        SizedBox(
          width: 30,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("POST",
                style: TextStyle(fontSize: 10, color: Colors.yellow.darkest)),
          ),
        ),
        const SizedBox(width: 4),
        const Text("Request #2"),
      ],
    )),
    TreeViewItem(
        content: Row(
      children: [
        SizedBox(
          width: 30,
          child: Align(
            alignment: Alignment.centerRight,
            child:
                Text("PUT", style: TextStyle(fontSize: 10, color: Colors.blue)),
          ),
        ),
        const SizedBox(width: 4),
        const Text("Request #3"),
      ],
    )),
    TreeViewItem(
        content: Row(
      children: [
        SizedBox(
          width: 30,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("PATCH",
                style: TextStyle(fontSize: 10, color: Colors.purple)),
          ),
        ),
        const SizedBox(width: 4),
        const Text("Request #4"),
      ],
    )),
    TreeViewItem(
        content: Row(
      children: [
        SizedBox(
          width: 30,
          child: Align(
            alignment: Alignment.centerRight,
            child:
                Text("DEL", style: TextStyle(fontSize: 10, color: Colors.red)),
          ),
        ),
        const SizedBox(width: 4),
        const Text("Request #5"),
      ],
    )),
    TreeViewItem(
      content: Row(
        children: [
          SizedBox(
            width: 30,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("HEAD",
                  style: TextStyle(fontSize: 10, color: Colors.grey[100])),
            ),
          ),
          const SizedBox(width: 4),
          const Text("Request #6"),
        ],
      ),
    )
  ],
);

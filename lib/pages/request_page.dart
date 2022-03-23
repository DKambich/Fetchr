import 'package:fetchr/constants.dart';
import 'package:fetchr/split.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:http/http.dart' as http;

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  RequestMethod currentMethod = RequestMethod.get;
  TextEditingController controller = TextEditingController();
  http.Response? response;

  @override
  Widget build(BuildContext context) {
    return Split(
      axis: Axis.vertical,
      initialFractions: const [0.5, 0.5],
      minSizes: const [100, 100],
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Combobox<RequestMethod>(
                      placeholder: const Text('Selected list item'),
                      isExpanded: true,
                      items: RequestMethod.values
                          .map((e) => ComboboxItem<RequestMethod>(
                                value: e,
                                child: Text(e
                                    .toString()
                                    .replaceAll("RequestMethod.", "")
                                    .toUpperCase()),
                              ))
                          .toList(),
                      value: currentMethod,
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          currentMethod = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextBox(
                      controller: controller,
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                      child: const Text("Send"), onPressed: sendRequest),
                ],
              ),
            ),
          ],
        ),
        ResponseViewer(
          response: response,
        ),
      ],
    );
  }

  void sendRequest() async {
    var url = Uri.parse(controller.text);
    switch (currentMethod) {
      case RequestMethod.get:
        response = await http.get(url);
        break;
      case RequestMethod.post:
        response = await http.post(url);
        break;
      case RequestMethod.put:
        response = await http.put(url);
        break;
      case RequestMethod.patch:
        response = await http.patch(url);
        break;
      case RequestMethod.delete:
        response = await http.delete(url);
        break;
      case RequestMethod.head:
        response = await http.head(url);
        break;
    }
    setState(() {});
  }
}

class ResponseViewer extends StatelessWidget {
  final http.Response? response;

  const ResponseViewer({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (response == null) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Combobox<String>(
            placeholder: const Text('Selected list item'),
            isExpanded: true,
            items: ["Pretty", "Raw", "Preview"]
                .map((e) => ComboboxItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: "Raw",
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Acrylic(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(
                  response!.body,
                  showCursor: true,
                  maxLines: null,
                  toolbarOptions:
                      const ToolbarOptions(copy: true, selectAll: true),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

/*  showCursor: true,
                ,*/
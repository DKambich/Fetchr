import 'package:fetchr/constants.dart';
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Combobox<RequestMethod>(
                  placeholder: Text('Selected list item'),
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
              SizedBox(width: 8),
              Expanded(
                child: TextBox(
                  controller: controller,
                ),
              ),
              SizedBox(width: 8),
              FilledButton(child: Text("Send"), onPressed: sendRequest),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(child: Text(response?.body ?? "")),
        )
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

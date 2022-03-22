# fetchr

A personal project meant to mimic applications like PostMan to work with and handle HTTP requests.

## Roadmap

This is the initial feature roadmap with resources included

**Roadmap Legend**

```
💭 - Researching
🚧 - In Progress
✅ - Completed
❌ - Removed
⚠️ - Needs Rework
```

**Features**
- ✅ Design App Logo
  - [Potential Base SVG](https://www.onlinewebfonts.com/icon/233163)
  - [SVG Editor](https://pixelied.com/)
- 🚧 Use Fluent Design System
  - [fluent_ui package](https://pub.dev/packages/fluent_ui)
  - [Windows 11 Border Radius](https://docs.microsoft.com/en-us/windows/apps/design/signature-experiences/geometry  )
- Make and customize HTTP calls
  - [http package](https://pub.dev/packages/http)
- Responsive editor with resizable panes
  - Resizing Pane Widget Options
    - [Custom Split Widget](https://github.com/flutter/flutter/issues/64768#issuecomment-796046588)
    - [resizable_widget package](https://pub.dev/packages/resizable_widget)
    - [split_view package](https://pub.dev/packages/split_view)
    - [multi_split_view package](https://pub.dev/packages/multi_split_view)
- Render HTTP Response Preview
  - [webview_flutter package](https://pub.dev/packages/webview_flutter)
  - [Render local HTML String](https://stackoverflow.com/questions/53831312/how-to-render-a-local-html-file-with-flutter-dart-webview)
- Pretty Text HTTP Response
  - [code_text_view package](https://pub.dev/packages/code_text_field)
- Multiple Tabs of Requests
  - [Fluent UI Tabs](https://pub.dev/packages/fluent_ui#tab-view)
- Save local collection of requests
  - Storage Options
    - [Hive](https://pub.dev/packages/hive)
    - [SQFlite](https://pub.dev/packages/sqflite_common_ffi)
    - [Drift](https://pub.dev/packages/drift)
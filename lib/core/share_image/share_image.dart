import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

void shareImage(widget) {
  ShareFilesAndScreenshotWidgets().shareScreenshot(
      widget, 1000, "Title", "Name.png", "image/png",
      text: "This is the caption!");
}

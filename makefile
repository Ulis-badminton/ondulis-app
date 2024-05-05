# Flutter WidgetBook
FLUTTER_BIN := flutter
CHROME_DEVICE := chrome
WIDGETBOOK_PATH := lib/main.widgetbook.dart

.PHONY: widgetbook

widgetbook:
	$(FLUTTER_BIN) run -d $(CHROME_DEVICE) -t $(WIDGETBOOK_PATH)

widgetbook_gen:
	flutter pub run build_runner build --delete-conflicting-outputs
# Align Widget Demo

`Align` is a Flutter widget that positions its child within itself using an `alignment` value, and can optionally size itself relative to the child.

## Demo
A small chat screen: `Align` places received messages on the left and sent messages on the right. A playground below the chat uses two sliders to show how `widthFactor` and `heightFactor` resize the `Align` (the amber box).

## Run
```bash
flutter pub get
flutter run -d chrome
```

## Three attributes

- **`alignment`**: sets where the child sits inside the Align. In the demo, `Alignment.centerLeft` puts received messages on the left and `Alignment.centerRight` puts sent messages on the right.
- **`widthFactor`**: sets the Align's width to the child's width multiplied by the factor. Dragging the slider from 1.0 to 3.0 makes the amber box grow wider around the "Typing..." box.
- **`heightFactor`**: sets the Align's height to the child's height multiplied by the factor. Dragging the slider makes the amber box grow taller.

Note: if `widthFactor` and `heightFactor` are not set, `Align` expands to fill the space its parent gives it.

## Screenshot
![alt text](image.png)
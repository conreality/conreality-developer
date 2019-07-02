/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'camera_screen.dart' show CameraScreen;
import 'chat_screen.dart' show ChatScreen;
import 'compass_screen.dart' show CompassScreen;
import 'dosimeter_screen.dart' show DosimeterScreen;
import 'login_screen.dart' show LoginScreen;
import 'map_screen.dart' show MapScreen;
import 'replay_screen.dart' show ReplayScreen;
import 'tracker_screen.dart' show TrackerScreen;

////////////////////////////////////////////////////////////////////////////////

class WidgetInfo {
  final IconData icon;
  final String route;
  final String label;
  final String summary;

  const WidgetInfo(this.icon, this.route, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<WidgetInfo> _widgets = [
  WidgetInfo(Icons.camera, CameraScreen.route, "Camera", "Augmented-reality camera widget."),
  WidgetInfo(Icons.chat, ChatScreen.route, "Chat", "Team chat widgets."),
  WidgetInfo(Icons.navigation, CompassScreen.route, "Compass", "Compass widget."),
  WidgetInfo(null, "/", "Countdown", "Countdown timer widget."), // TODO: icon, route
  WidgetInfo(null, DosimeterScreen.route, "Dosimeter", "Personal radiation dosimeter widget."), // TODO: icon
  WidgetInfo(null, "/", "Fonts", "Conreality font assets."), // TODO: icon, route
  WidgetInfo(null, "/", "Gamepad", "Gamepad widget for robot control."), // TODO: icon, route
  WidgetInfo(null, "/", "Icons", "Conreality icon assets."), // TODO: icon, route
  WidgetInfo(null, "/", "Joystick", "Joystick widget for robot control."), // TODO: icon, route
  WidgetInfo(null, LoginScreen.route, "Login", "Login form widgets."), // TODO: icon
  WidgetInfo(null, "/", "Logo", "Conreality logo assets."), // TODO: icon, route
  WidgetInfo(Icons.map, MapScreen.route, "Map", "Game map and marker widgets."),
  WidgetInfo(Icons.history, ReplayScreen.route, "Replay", "Game history replay widgets."),
  WidgetInfo(Icons.track_changes, TrackerScreen.route, "Tracker", "Directional and distance tracker widgets."),
];

////////////////////////////////////////////////////////////////////////////////

class WidgetList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: _widgets.length,
      itemBuilder: (final BuildContext context, final int index) {
        final WidgetInfo widget = _widgets[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(widget.icon ?? Icons.widgets),
            title: Text(widget.label),
            subtitle: Text(widget.summary),
            //trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(widget.route);
          },
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}

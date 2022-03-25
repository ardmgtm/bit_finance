import 'package:flutter/material.dart';

import 'dart:math' as math;

class CustomBottomNavBar extends StatefulWidget {
  final Function(int)? onItemMenuSelected;

  const CustomBottomNavBar({
    Key? key,
    this.onItemMenuSelected,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<NavBarItem> items = const [
      NavBarItem(Icon(Icons.home), 'Home'),
      NavBarItem(Icon(Icons.receipt), 'Transaction'),
      NavBarItem(Icon(Icons.bar_chart), 'Statistic'),
      NavBarItem(Icon(Icons.settings), 'Setting'),
    ];

    List<Widget> _itemsWidget = items
        .asMap()
        .map(
          (index, item) => MapEntry(
            index,
            NavBarItemWidget(
              icon: item.icon,
              label: item.label,
              isActive: index == _selectedIndex,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        )
        .values
        .toList();

    return BottomAppBar(
      elevation: 10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _itemsWidget,
      ),
      notchMargin: 8.0,
      shape: MyShape(),
    );
  }
}

class NavBarItem {
  final Widget icon;
  final String label;

  const NavBarItem(this.icon, this.label);
}

class NavBarItemWidget extends StatelessWidget {
  final Function()? onTap;
  final bool isActive;
  final Widget icon;
  final String label;

  const NavBarItemWidget({
    Key? key,
    this.isActive = false,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconTheme(
                  data: IconThemeData(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                  child: icon,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

class MyShape extends CircularNotchedRectangle {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }
    final double notchRadius = guest.width / 2.0;

    const double s1 = 8.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset> p = List.filled(6, const Offset(0, 0));

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, -p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) {
      p[i] += guest.center;
    }
    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[1].dx, p[1].dy)
      ..arcToPoint(
        p[4],
        radius: Radius.circular(notchRadius),
        clockwise: true,
      )
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}

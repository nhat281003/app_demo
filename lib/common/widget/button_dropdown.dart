import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ButtonDropdown<T> extends StatefulWidget {
  final Widget child;
  final void Function(T, int) onChange;
  final List<DropdownItem<T>> items;
  final DropdownStyle dropdownStyle;
  final DropdownButtonStyle dropdownButtonStyle;
  final Icon? icon;
  final bool hideIcon;
  final bool leadingIcon;
  final bool isButton;
  const ButtonDropdown({
    Key? key,
    this.hideIcon = false,
    required this.child,
    required this.items,
    this.dropdownStyle = const DropdownStyle(),
    this.dropdownButtonStyle = const DropdownButtonStyle(),
    this.icon,
    this.leadingIcon = false,
    required this.onChange, this.isButton= false,
  }) : super(key: key);

  @override
  ButtonDropdownState<T> createState() => ButtonDropdownState<T>();
}

class ButtonDropdownState<T> extends State<ButtonDropdown<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    // link the overlay to the button
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: style.width,
        height: style.height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: style.padding,
            backgroundColor: style.backgroundColor,
            elevation: style.elevation,
            primary: style.primaryColor,
          ),
          onPressed: _toggleDropdown,
          child: Wrap(
            direction: Axis.vertical,
            // mainAxisAlignment:
            //     style.mainAxisAlignment ?? MainAxisAlignment.center,
            textDirection:
                widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
            // mainAxisSize: MainAxisSize.max,
            children: [
              if (_currentIndex == -1) ...[
                widget.child,
              ] else ...[
                widget.items[_currentIndex],
              ],
              if (!widget.hideIcon)
                RotationTransition(
                  turns: _rotateAnimation,
                  child: widget.icon,
                ),
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  offset:
                      widget.dropdownStyle.offset ?? Offset(0, size.height + 5),
                  link: _layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    elevation: widget.dropdownStyle.elevation ?? 0,
                    borderRadius:
                        widget.dropdownStyle.borderRadius ?? BorderRadius.zero,
                    color: widget.dropdownStyle.color,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: ConstrainedBox(
                        constraints: widget.dropdownStyle.constraints ??
                            BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height -
                                  topOffset -
                                  15,
                            ),
                        child: ListView(
                          padding:
                              widget.dropdownStyle.padding ?? EdgeInsets.zero,
                          shrinkWrap: true,
                          children: widget.items.asMap().entries.map((item) {
                            return InkWell(
                              highlightColor: ColorUtils.colorOrange,
                              splashColor:ColorUtils.colorOrange,
                              onTap: () {
                               widget.isButton? null :setState(() => _currentIndex = item.key);
                                widget.onChange(item.value.value as T, item.key);
                                _toggleDropdown();
                              },
                              child: item.value,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.
class DropdownItem<T> extends StatelessWidget {
  final T? value;
  final Widget? child;

  const DropdownItem({Key? key, this.value, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox();
  }
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;
  final double? elevation;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final Color? primaryColor;
  const DropdownButtonStyle({
    this.mainAxisAlignment,
    this.backgroundColor,
    this.primaryColor,
    this.constraints,
    this.height,
    this.width,
    this.elevation,
    this.padding,
    this.shape,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset? offset;

  ///button width must be set for this to take effect
  final double? width;

  const DropdownStyle({
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius,
  });
}

import 'package:exo_vr/ui/theme/exo_theme.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onTap,
    this.padding,
    this.tooltip,
    this.enabled = true,
    this.iconColor,
    this.text,
    this.allowLoading = false,
    this.leading,
    this.trailing,
    this.externalLoading,
    this.onLoadingChanged,
  });

  final Future<void> Function() onTap;
  final IconData? leading;
  final IconData? trailing;
  final EdgeInsets? padding;
  final Color? iconColor;
  final String? text;
  final String? tooltip;
  final bool? allowLoading;
  final bool enabled;
  final bool? externalLoading;
  final void Function(bool)? onLoadingChanged;

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  late bool loading;

  @override
  void initState() {
    super.initState();
    loading = widget.externalLoading ?? false;
  }

  @override
  void didUpdateWidget(CustomOutlinedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.externalLoading != oldWidget.externalLoading && widget.externalLoading != null) {
      setLoadingState(widget.externalLoading!);
    }
  }

  void handleTap() async {
    if (widget.enabled && !loading) {
      if (widget.allowLoading == true) {
        setLoadingState(true);
      }
      await widget.onTap().whenComplete(() {
        setLoadingState(false);

        // if (widget.externalLoading == null) {
        //   // Only turn off loading if external control is not active
        // }
      });
    }
  }

  void setLoadingState(bool newState) {
    if (loading != newState) {
      setState(() {
        loading = newState;
      });
      widget.onLoadingChanged?.call(newState);
    }
  }

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
            padding: WidgetStatePropertyAll(widget.padding ?? const EdgeInsets.symmetric(vertical: 22, horizontal: 8)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: ExoTheme.borderRadius,
                side: BorderSide(
                  color: widget.enabled ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSurface.withOpacity(.5),
                ),
              ),
            ),
          ),
      onPressed: handleTap,
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: widget.text != null && (widget.leading != null || widget.trailing != null) && loading == false ? 10 : 0,
        children: [
          if (loading)
            const SizedBox(
              height: 20,
              width: 20,
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          widget.leading != null && loading == false
              ? Icon(
                  widget.leading,
                  size: 18,
                  color: widget.enabled
                      ? (widget.iconColor ?? Theme.of(context).colorScheme.onSurface)
                      : (widget.iconColor ?? Theme.of(context).colorScheme.onSurface).withOpacity(.5),
                )
              : const SizedBox.shrink(),
          if (widget.text != null && loading == false)
            Text(
              widget.text!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: widget.enabled ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSurface.withOpacity(.5)),
            ),
          widget.trailing != null && loading == false
              ? Icon(widget.trailing,
                  size: 18,
                  color: widget.enabled
                      ? (widget.iconColor ?? Theme.of(context).colorScheme.onSurface)
                      : (widget.iconColor ?? Theme.of(context).colorScheme.onSurface).withOpacity(.5))
              : const SizedBox.shrink(),
        ],
      ),
    );
    return widget.tooltip != null ? Tooltip(message: widget.tooltip!, child: button) : button;
  }
}

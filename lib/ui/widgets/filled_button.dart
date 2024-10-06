import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomFilledButton extends ConsumerStatefulWidget {
  const CustomFilledButton({
    super.key,
    required this.onTap,
    this.padding,
    this.tooltip,
    this.enabled = true,
    this.iconColor,
    this.textAlign,
    this.backgroundColor,
    this.textColor,
    this.text,
    this.allowLoading = false,
    this.leading,
    this.trailing,
    this.selected = true,
    this.externalLoading,
    this.onLoadingChanged,
    this.fontSize,
  });

  final Future<void> Function() onTap;
  final IconData? leading;
  final Color? textColor;
  final IconData? trailing;
  final EdgeInsets? padding;
  final Color? iconColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? backgroundColor;
  final bool selected;
  final String? text;
  final String? tooltip;
  final bool? allowLoading;
  final bool enabled;
  final bool? externalLoading;
  final void Function(bool)? onLoadingChanged;

  @override
  ConsumerState<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends ConsumerState<CustomFilledButton> {
  late bool loading;

  @override
  void initState() {
    super.initState();
    loading = widget.externalLoading ?? false;
  }

  @override
  void didUpdateWidget(CustomFilledButton oldWidget) {
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
    final button = ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 90,
        maxHeight: 100,
      ),
      child: FilledButton(
        onPressed: handleTap,
        style: Theme.of(context).filledButtonTheme.style!.copyWith(
              padding: WidgetStatePropertyAll(widget.padding ?? const EdgeInsets.symmetric(vertical: 22, horizontal: 8)),
              overlayColor: widget.selected
                  ? WidgetStatePropertyAll(Theme.of(context).colorScheme.onPrimary.withOpacity(.1))
                  : Theme.of(context).filledButtonTheme.style?.overlayColor,
              backgroundColor: WidgetStatePropertyAll(
                widget.selected ? (widget.backgroundColor ?? Theme.of(context).colorScheme.primary) : Theme.of(context).colorScheme.surface,
              ),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              const SizedBox(
                height: 20,
                width: 20,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            if (widget.leading != null && loading == false)
              Icon(
                widget.leading,
                size: 20,
                color: widget.enabled
                    ? (widget.iconColor ?? (widget.selected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface))
                    : (widget.iconColor ?? Theme.of(context).colorScheme.onSurface).withOpacity(.5),
              )
            else
              const SizedBox.shrink(),
            if (widget.text != null && loading == false)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    widget.text!,
                    maxLines: 1,
                    textAlign: widget.textAlign,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.bold,
                        color: !widget.enabled
                            ? Theme.of(context).colorScheme.onPrimary.withOpacity(.5)
                            : widget.textColor ?? (widget.selected ? Theme.of(context).colorScheme.onPrimary : null)),
                  ),
                ),
              ),
            widget.trailing != null && loading == false
                ? Icon(widget.trailing,
                    size: 20,
                    color: widget.enabled
                        ? (widget.iconColor ?? (widget.selected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface))
                        : (widget.iconColor ?? Theme.of(context).colorScheme.onSurface).withOpacity(.5))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
    return Tooltip(message: widget.tooltip ?? widget.text, child: button);
  }
}

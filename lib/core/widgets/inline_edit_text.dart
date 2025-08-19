import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A professional inline text editing widget that smoothly transitions between
/// display and edit modes. Click to edit, Enter to save, Escape to cancel.
class InlineEditText extends StatefulWidget {
  const InlineEditText({
    super.key,
    required this.text,
    required this.onSave,
    this.style,
    this.maxLines = 1,
    this.minLines = 1,
    this.isLoading = false,
    this.enabled = true,
    this.placeholder = 'Enter text...',
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.selectAllOnFocus = true,
    this.decoration,
  });

  /// The current text to display
  final String text;

  /// Callback when text is saved (Enter pressed or focus lost)
  final Future<bool> Function(String newText) onSave;

  /// Text style for both display and edit modes
  final TextStyle? style;

  /// Maximum number of lines for the text field
  final int maxLines;

  /// Minimum number of lines for the text field
  final int minLines;

  /// Whether the save operation is in progress
  final bool isLoading;

  /// Whether the widget is enabled for editing
  final bool enabled;

  /// Placeholder text when editing empty text
  final String placeholder;

  /// Text validator function
  final String? Function(String?)? validator;

  /// Text input action for the keyboard
  final TextInputAction textInputAction;

  /// Keyboard type
  final TextInputType keyboardType;

  /// Whether to autofocus when entering edit mode
  final bool autofocus;

  /// Whether to select all text when focusing
  final bool selectAllOnFocus;

  /// Custom input decoration
  final InputDecoration? decoration;

  @override
  State<InlineEditText> createState() => _InlineEditTextState();
}

class _InlineEditTextState extends State<InlineEditText>
    with SingleTickerProviderStateMixin {
  bool _isEditing = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;
  String _originalText = '';
  String? _errorText;
  bool _isSaving = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
    _focusNode = FocusNode();
    _originalText = widget.text;

    // Animation setup
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    // Focus listener
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize theme-dependent animations here
    _borderColorAnimation =
        ColorTween(
          begin: Colors.transparent,
          end: Theme.of(context).primaryColor,
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );
  }

  @override
  void didUpdateWidget(InlineEditText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text && !_isEditing) {
      _controller.text = widget.text;
      _originalText = widget.text;
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _animationController.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _isEditing) {
      _saveText();
    }
  }

  void _startEditing() {
    if (!widget.enabled || _isSaving) return;

    setState(() {
      _isEditing = true;
      _originalText = widget.text;
      _errorText = null;
    });

    _controller.text = widget.text;
    _animationController.forward();

    // Focus and select all if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      if (widget.selectAllOnFocus && _controller.text.isNotEmpty) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      }
    });
  }

  Future<void> _saveText() async {
    if (_isSaving) return;

    final newText = _controller.text.trim();

    // Validate text
    if (widget.validator != null) {
      final error = widget.validator!(newText);
      if (error != null) {
        setState(() {
          _errorText = error;
        });
        return;
      }
    }

    // If text hasn't changed, just cancel editing
    if (newText == _originalText) {
      _cancelEditing();
      return;
    }

    setState(() {
      _isSaving = true;
      _errorText = null;
    });

    try {
      final success = await widget.onSave(newText);
      if (success) {
        setState(() {
          _isEditing = false;
          _isSaving = false;
        });
        _animationController.reverse();
      } else {
        setState(() {
          _isSaving = false;
          _errorText = 'Failed to save changes';
        });
      }
    } catch (e) {
      setState(() {
        _isSaving = false;
        _errorText = 'Failed to save: ${e.toString()}';
      });
    }
  }

  void _cancelEditing() {
    setState(() {
      _isEditing = false;
      _errorText = null;
      _isSaving = false;
    });
    _controller.text = _originalText;
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!_isEditing) {
      // Display mode
      return GestureDetector(
        onTap: widget.enabled ? _startEditing : null,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _borderColorAnimation.value ?? Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        widget.text.isEmpty ? widget.placeholder : widget.text,
                        style: widget.style?.copyWith(
                          color: widget.text.isEmpty
                              ? theme.textTheme.bodyMedium?.color?.withOpacity(
                                  0.5,
                                )
                              : widget.style?.color,
                        ),
                        maxLines: widget.maxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (widget.enabled) ...[
                      const SizedBox(width: 4),
                      Icon(
                        Icons.edit,
                        size: 12,
                        color: theme.iconTheme.color?.withOpacity(0.5),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    // Edit mode
    return Focus(
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.enter) {
            _saveText();
            return KeyEventResult.handled;
          } else if (event.logicalKey == LogicalKeyboardKey.escape) {
            _cancelEditing();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: widget.style,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            enabled: !_isSaving,
            decoration:
                widget.decoration ??
                InputDecoration(
                  hintText: widget.placeholder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: theme.dividerColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: theme.primaryColor, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: theme.colorScheme.error,
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  isDense: true,
                  errorText: _errorText,
                  suffixIcon: _isSaving
                      ? Container(
                          margin: const EdgeInsets.all(8),
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.primaryColor,
                            ),
                          ),
                        )
                      : null,
                ),
            onSubmitted: (_) => _saveText(),
          ),

          // Helper text
          if (_isEditing && _errorText == null) ...[
            const SizedBox(height: 4),
            Text(
              'Press Enter to save, Escape to cancel',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                fontSize: 10,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

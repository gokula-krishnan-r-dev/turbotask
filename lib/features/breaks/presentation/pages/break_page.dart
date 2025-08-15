import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/services/floating_panel_manager.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../domain/entities/break_session.dart';
import '../bloc/break_bloc.dart';
import '../bloc/break_event.dart';
import '../bloc/break_state.dart';
import '../widgets/break_timer_widget.dart';

/// Break page with a floating window for break management
class BreakPage extends StatefulWidget {
  final BreakSession breakSession;
  final String projectId;
  final VoidCallback onClose;

  const BreakPage({
    super.key,
    required this.breakSession,
    required this.projectId,
    required this.onClose,
  });

  @override
  State<BreakPage> createState() => _BreakPageState();
}

class _BreakPageState extends State<BreakPage> {
  late BreakBloc _breakBloc;

  @override
  void initState() {
    super.initState();
    _breakBloc = getIt<BreakBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: 380,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.warning.withOpacity(0.95),
                  AppColors.warning.withOpacity(0.98),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.warning.withOpacity(0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                  offset: const Offset(0, 16),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: BlocProvider.value(
              value: _breakBloc,
              child: BreakTimerWidget(
                breakSession: widget.breakSession,
                onStopBreak: _stopBreak,
                onClose: widget.onClose,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Stop break and resize panel back to normal
  Future<void> _stopBreak({String notes = ''}) async {
    try {
      print('BreakPage: Stopping break and resizing panel back to normal');

      // Stop the break via bloc
      _breakBloc.add(StopBreak(notes: notes));

      // Resize panel back to normal height on macOS
      if (Platform.isMacOS) {
        await FloatingPanelManager.resizePanelForFocusMode(false);
      }

      // Navigate back
      if (mounted) {
        widget.onClose();
      }
    } catch (e) {
      print('BreakPage: Error stopping break: $e');

      // Still navigate back even if resize fails
      if (mounted) {
        widget.onClose();
      }
    }
  }
}

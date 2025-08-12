import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/services/floating_panel_settings.dart';
import '../../../../core/services/floating_panel_manager.dart';

/// Settings page for floating panel configuration
class FloatingPanelSettingsPage extends StatefulWidget {
  const FloatingPanelSettingsPage({super.key});

  @override
  State<FloatingPanelSettingsPage> createState() =>
      _FloatingPanelSettingsPageState();
}

class _FloatingPanelSettingsPageState extends State<FloatingPanelSettingsPage> {
  PanelPosition _currentPosition = PanelPosition.right;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCurrentSettings();
  }

  Future<void> _loadCurrentSettings() async {
    final position = await FloatingPanelSettings.getPanelPosition();
    if (mounted) {
      setState(() {
        _currentPosition = position;
        _isLoading = false;
      });
    }
  }

  Future<void> _updatePosition(PanelPosition newPosition) async {
    setState(() {
      _currentPosition = newPosition;
    });

    // Update the position and move the panel
    await FloatingPanelManager.updatePanelPosition(newPosition);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Panel position updated to ${newPosition.name}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              // Header
              _buildHeader(theme),

              if (_isLoading)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              else
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Panel Position Section
                        _buildSectionHeader(
                          theme,
                          'Panel Position',
                          'Choose which side of the screen the panel should appear on',
                        ),

                        const SizedBox(height: 16),

                        _buildPositionOptions(theme),

                        const SizedBox(height: 32),

                        // Preview Section
                        _buildSectionHeader(
                          theme,
                          'Preview',
                          'See how the panel will look on your screen',
                        ),

                        const SizedBox(height: 16),

                        _buildPreview(theme),

                        const SizedBox(height: 32),

                        // Additional Settings Section
                        _buildSectionHeader(
                          theme,
                          'Behavior',
                          'Configure how the panel behaves',
                        ),

                        const SizedBox(height: 16),

                        _buildBehaviorSettings(theme),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Icon(Icons.settings, color: theme.colorScheme.primary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: AutoSizeText(
                'Panel Settings',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 1,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    ThemeData theme,
    String title,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 4),
        AutoSizeText(
          description,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _buildPositionOptions(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          _buildPositionTile(
            theme,
            PanelPosition.left,
            'Left Side',
            'Panel appears on the left side of your screen',
            Icons.keyboard_arrow_left,
          ),
          Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.1)),
          _buildPositionTile(
            theme,
            PanelPosition.right,
            'Right Side',
            'Panel appears on the right side of your screen',
            Icons.keyboard_arrow_right,
          ),
        ],
      ),
    );
  }

  Widget _buildPositionTile(
    ThemeData theme,
    PanelPosition position,
    String title,
    String description,
    IconData icon,
  ) {
    final isSelected = _currentPosition == position;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _updatePosition(position),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primary.withOpacity(0.1)
                      : theme.colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline.withOpacity(0.2),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Icon(
                  icon,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withOpacity(0.6),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    AutoSizeText(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreview(ThemeData theme) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
      ),
      child: Stack(
        children: [
          // Screen representation
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Center(
              child: AutoSizeText(
                'Your Screen',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ),
          ),

          // Panel representation
          Positioned(
            left: _currentPosition == PanelPosition.left ? 16 : null,
            right: _currentPosition == PanelPosition.right ? 16 : null,
            top: 16,
            bottom: 16,
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Icon(
                  Icons.task_alt,
                  color: theme.colorScheme.onPrimary,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBehaviorSettings(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.layers,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AutoSizeText(
                    'Always stay on top',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: null, // Disabled for now
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Auto-hide when not in use',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Coming soon',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.5),
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: false,
                  onChanged: null, // Disabled for now
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

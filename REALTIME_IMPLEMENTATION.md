# Real-Time Kanban Board Updates Implementation

## Overview
This document describes the implementation of real-time updates for the kanban board in the TurboTask Flutter application. The system automatically refreshes the kanban board when WebSocket messages are received from the backend.

## Architecture

### Flow Diagram
```
Backend -> WebSocket Message -> RealtimeKanbanService -> KanbanBoardBloc -> UI Update
```

### Components

#### 1. RealtimeKanbanService
**File:** `turbotask/lib/core/services/realtime_kanban_service.dart`

**Purpose:** Manages real-time kanban board updates via WebSocket
- Listens for WebSocket notifications
- Maps project IDs to KanbanBoardBloc instances
- Triggers appropriate kanban board refreshes

**Key Features:**
- Project-specific listening (can handle multiple projects)
- Automatic WebSocket connection management
- Error handling and reconnection support

#### 2. Project Detail Page Integration
**File:** `turbotask/lib/features/projects/presentation/pages/project_detail_page.dart`

**Updates:**
- Added RealtimeKanbanService integration
- Real-time connection status indicator
- Automatic WebSocket connection on page load
- Cleanup on page disposal

**Visual Indicators:**
- **Green "Live" badge**: WebSocket connected and real-time updates active
- **Red "Live" badge**: WebSocket disconnected

#### 3. Task Card Widget Enhancement
**File:** `turbotask/lib/features/projects/presentation/widgets/task_card_widget.dart`

**Updates:**
- Added pulse animation for visual feedback
- AnimationController for smooth transitions
- Ready for real-time update notifications

## WebSocket Message Handling

### Supported Message Types
1. **task_created** - New task added
2. **task_updated** - Task modified
3. **task_deleted** - Task removed
4. **task_moved** - Task moved between columns
5. **ai_enhancement_completed** - AI enhancement finished
6. **project_updated** - Project metadata changed

### Message Flow
1. Backend sends WebSocket message with project context
2. RealtimeKanbanService receives and parses message
3. Service identifies affected project and triggers refresh
4. KanbanBoardBloc fetches fresh data from API
5. UI automatically updates with new data

## Configuration

### Dependency Injection
```dart
// Added to injection.dart
getIt.registerSingleton<RealtimeKanbanService>(
  RealtimeKanbanService(getIt<WebSocketService>()),
);
```

### WebSocket URL
Default: `ws://localhost:8080/api/v1/ws/connect?token={accessToken}`

## Usage Example

### In Project Detail Page
```dart
@override
void initState() {
  super.initState();
  _realtimeService = getIt<RealtimeKanbanService>();
  
  // Initialize WebSocket connection and real-time listening
  _initializeRealtimeServices();
}

Future<void> _initializeRealtimeServices() async {
  // Ensure WebSocket is connected
  await _realtimeService.ensureConnected();
  
  // Start listening for real-time updates for this project
  final kanbanBloc = context.read<KanbanBoardBloc>();
  _realtimeService.startListening(widget.project.id, kanbanBloc);
}
```

## Benefits

### 1. Real-Time Collaboration
- Multiple users can see changes instantly
- No need for manual refresh
- Consistent data across all clients

### 2. AI Enhancement Feedback
- Immediate notification when AI processing completes
- Automatic board refresh with enhanced tasks
- Visual feedback for user engagement

### 3. Performance Optimization
- Only affected projects receive updates
- Efficient WebSocket message routing
- Minimal API calls (only when changes occur)

### 4. User Experience
- Visual connection status indicator
- Smooth animations for updates
- No interruption to user workflow

## API Integration

### Kanban Board API
**Endpoint:** `GET /api/v1/todo/projects/{projectId}/kanban`

**When Called:**
- Manual refresh button click
- WebSocket message triggers automatic refresh
- Page load/reload

### WebSocket Events
The backend sends notifications in this format:
```json
{
  "type": "notification",
  "payload": {
    "type": "task_created",
    "project_id": "b462f9e0-6c2a-4d7c-b971-18765ffb0d06",
    "task_id": "...",
    "user_id": "..."
  }
}
```

## Future Enhancements

### 1. Granular Updates
- Update specific tasks instead of full board refresh
- Delta updates for better performance
- Optimistic UI updates

### 2. Conflict Resolution
- Handle concurrent edits
- Merge conflicts resolution
- User notification system

### 3. Offline Support
- Queue updates when offline
- Sync when connection restored
- Conflict resolution on reconnect

## Testing

### Manual Testing Steps
1. Open project in multiple browser tabs/devices
2. Create/update/delete tasks in one tab
3. Verify other tabs update automatically
4. Check connection status indicator
5. Test with poor network conditions

### WebSocket Connection Status
- Monitor the "Live" indicator in the header
- Green = Connected and receiving updates
- Red = Disconnected or connection issues

## Performance Considerations

### Memory Management
- Automatic cleanup when leaving project pages
- Efficient event listener management
- No memory leaks from animation controllers

### Network Efficiency
- WebSocket reuse across multiple projects
- Minimal payload sizes
- Connection pooling and reuse

## Error Handling

### Connection Failures
- Automatic reconnection attempts
- User feedback via status indicator
- Graceful degradation to manual refresh

### Message Processing Errors
- Robust error logging
- Fallback to manual refresh
- No crash or data corruption

## Monitoring and Debugging

### Logs
```dart
log('🔄 Starting real-time listening for project: $projectId');
log('📨 Received general notification: $notification');
log('🤖 Received AI enhancement notification: ${notification.type}');
log('✅ Kanban board refresh triggered for project: $projectId');
```

### Debug Tools
- WebSocket connection status in header
- Console logs for all real-time events
- Visual feedback for all updates

This implementation provides a robust, scalable foundation for real-time collaboration in the TurboTask application.

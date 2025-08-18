# Enhanced HoverButtonWidget

A comprehensive action button widget with smooth animations and API integration for todo management.

## Features

- **More Button**: Expandable menu with additional actions
- **Smooth Animations**: Scale, rotation, and fade animations
- **API Integration**: Full backend integration for all actions
- **Performance Optimized**: Efficient state management and animations
- **Professional UI**: Material Design 3 compliant

## Available Actions

### Primary Actions (Always Visible)
- **Subtasks**: Toggle subtask visibility
- **Notes**: Open notes dialog
- **More**: Expand additional actions menu

### Secondary Actions (Expandable)
- **Complete/Incomplete**: Mark todo as done or restore
- **Break**: Take different types of breaks (short, long, meal, personal, emergency)
- **Pause**: Put todo on hold
- **Skip**: Move todo to backlog
- **Pin**: Pin/unpin todo for priority

## Usage

### Basic Implementation

```dart
HoverButtonWidget(
  isSubtasksExpanded: false,
  isSubtasksVisible: todo.subtaskCount > 0,
  onSubtasksExpandToggle: () {
    // Handle subtask toggle
  },
  onNotesOpen: () {
    // Handle notes dialog
  },
  todo: todo, // Required for actions
  onTodoUpdated: (updatedTodo) {
    // Handle todo updates
  },
)
```

### With BLoC Provider

```dart
BlocProvider(
  create: (context) => TodoActionsBloc(
    context.read<TodoActionsUseCase>(),
  ),
  child: HoverButtonWidget(
    // ... widget parameters
  ),
)
```

## API Endpoints Used

The widget integrates with the following backend endpoints:

- `POST /api/v1/todo/todos/{id}/complete` - Mark todo complete
- `POST /api/v1/todo/todos/{id}/incomplete` - Mark todo incomplete
- `POST /api/v1/todo/todos/{id}/pin` - Pin/unpin todo
- `POST /api/v1/todo/breaks/start` - Start break
- `POST /api/v1/todo/breaks/stop` - Stop break
- `PUT /api/v1/todo/todos/{id}` - Update todo status (pause/skip)
- `GET /api/v1/todo/breaks/active` - Check break status

## Animations

### Button Interactions
- **Press Animation**: Scale down on tap
- **More Button**: Rotation animation (0.25 turns)
- **Actions Menu**: Elastic scale-in with fade

### Performance Optimizations
- **SingleTickerProvider**: Optimized animation controllers
- **AnimatedBuilder**: Efficient rebuilds
- **Conditional Rendering**: Actions only render when expanded

## Break Types

- **Short Break**: 5 minutes (coffee, stretch)
- **Long Break**: 15 minutes (walk, fresh air)
- **Meal Break**: 30 minutes (lunch, dinner)
- **Personal Break**: 10 minutes (calls, personal tasks)
- **Emergency Break**: No time limit (urgent matters)

## State Management

The widget uses BLoC pattern for state management:

- **TodoActionsBloc**: Handles all todo actions
- **TodoActionsState**: Loading, success, error states
- **TodoActionsEvent**: Action triggers

## Error Handling

- **Network Errors**: Automatic retry with exponential backoff
- **User Feedback**: SnackBar notifications for errors
- **Loading States**: Visual indicators during API calls

## Customization

### Themes
The widget automatically adapts to:
- Material Design 3 color schemes
- Light/dark theme variants
- Custom app colors (AppColors.mint)

### Animation Durations
- Button press: 100ms
- More rotation: 200ms
- Actions expand: 300ms (elastic curve)

## Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.3
  injectable: ^2.3.2
  equatable: ^2.0.5
  flutter_svg: ^2.0.9
```

## Example Implementation

See `todo_item_with_actions.dart` for a complete example of how to integrate the HoverButtonWidget in a todo list item.

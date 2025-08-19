# 🧪 Testing Auto-Refresh Feature

## 🚀 **Quick Test Guide**

### **Prerequisites**
1. Backend server running on `http://localhost:8080`
2. Flutter app running with project kanban board open
3. Valid JWT token for authentication

### **Test Scenario 1: Task Title Auto-Refresh**

#### **Step 1: Create a Test Task**
```bash
curl -X POST http://localhost:8080/api/v1/todo/todos \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{
    "project_id": "YOUR_PROJECT_ID",
    "task_name": "Original Task Title",
    "task_description": "Test task for auto-refresh",
    "status": "not_started",
    "priority": "medium"
  }'
```

#### **Step 2: Test Inline Editing**
1. Open Flutter app kanban board
2. Find the "Original Task Title" task
3. Click on the task title text
4. Edit to "Updated Task Title"
5. Press Enter

#### **Step 3: Verify Auto-Refresh**
✅ **Expected Results:**
- Success snackbar appears: "Task title updated successfully"
- Task title automatically changes to "Updated Task Title"
- No manual refresh needed
- Database reflects the change

### **Test Scenario 2: Subtask Name Auto-Refresh**

#### **Step 1: Create Task with AI Subtasks**
```bash
curl -X POST http://localhost:8080/api/v1/ai/tasks \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{
    "user_id": "YOUR_USER_ID",
    "project_id": "YOUR_PROJECT_ID",
    "column_id": "not_started",
    "task_name": "Test AI Task",
    "task_description": "Create a REST API",
    "project_context": "Backend development project"
  }'
```

#### **Step 2: Test Subtask Inline Editing**
1. Find the AI-generated task in kanban board
2. Expand the task to show subtasks
3. Click on any subtask name (with purple "AI" badge)
4. Edit the subtask name
5. Press Enter

#### **Step 3: Verify Auto-Refresh**
✅ **Expected Results:**
- Success snackbar appears: "Subtask name updated successfully"
- Subtask name automatically changes to new value
- AI badge remains visible
- No manual refresh needed
- Database reflects the change

## 🔍 **Verification Commands**

### **Check Task Update in Database**
```bash
curl -X GET http://localhost:8080/api/v1/todo/todos/TASK_ID \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### **Check Subtask Update in Database**
```bash
curl -X GET http://localhost:8080/api/v1/todo/todos/TASK_ID/subtasks \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### **Manual API Update Test**
```bash
# Update task title via API
curl -X PUT http://localhost:8080/api/v1/todo/todos/TASK_ID \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{
    "task_name": "API Updated Title"
  }'

# Update subtask name via API
curl -X PUT http://localhost:8080/api/v1/todo/subtasks/SUBTASK_ID \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{
    "name": "API Updated Subtask"
  }'
```

## 🎯 **Edge Case Testing**

### **Test 1: Network Error Handling**
1. Disconnect internet
2. Try to edit task/subtask
3. Verify error message appears
4. Reconnect internet
5. Try again - should work and auto-refresh

### **Test 2: Concurrent Edits**
1. Edit task title from Flutter app
2. Simultaneously edit same task from API
3. Verify UI shows latest state after refresh

### **Test 3: Long Text Handling**
1. Edit task/subtask with very long text (>255 chars)
2. Verify validation error appears
3. Edit with valid length text
4. Verify auto-refresh works

## 📊 **Performance Testing**

### **Test Rapid Edits**
1. Make multiple quick edits to different tasks
2. Verify each triggers appropriate refresh
3. Check for memory leaks or performance issues

### **Test Large Kanban Board**
1. Create board with many tasks and subtasks
2. Edit items and verify refresh performance
3. Monitor refresh speed and UI responsiveness

## 🐛 **Debugging Tips**

### **If Auto-Refresh Doesn't Work:**

1. **Check Console Logs:**
   ```bash
   flutter logs
   ```

2. **Verify Bloc Events:**
   - Look for `RefreshKanbanBoard` events
   - Look for `RefreshSubtasks` events

3. **Check API Responses:**
   - Verify 200 status codes for updates
   - Check for JWT token validity

4. **Inspect Network Tab:**
   - Confirm API calls are made
   - Verify refresh API calls happen after edits

### **Common Issues:**

- **Token Expired**: Refresh JWT token
- **Network Issues**: Check backend server status
- **State Management**: Verify Bloc is properly initialized
- **Widget Tree**: Ensure proper context for Bloc access

## ✅ **Success Criteria**

### **Task Title Editing:**
- [x] Click to edit works
- [x] Enter key saves changes  
- [x] API call succeeds
- [x] Success feedback appears
- [x] UI automatically refreshes
- [x] Database is updated

### **Subtask Name Editing:**
- [x] Click to edit works
- [x] Enter key saves changes
- [x] API call succeeds  
- [x] Success feedback appears
- [x] UI automatically refreshes
- [x] Database is updated
- [x] AI indicators preserved

---

## 🎉 **Expected User Experience**

Users should experience a **seamless, professional editing workflow** where:
1. ✨ Editing feels instant and responsive
2. ✨ Changes are immediately visible without manual refresh
3. ✨ Database and UI stay perfectly synchronized
4. ✨ Professional feedback confirms successful operations
5. ✨ No technical complexity is exposed to the user

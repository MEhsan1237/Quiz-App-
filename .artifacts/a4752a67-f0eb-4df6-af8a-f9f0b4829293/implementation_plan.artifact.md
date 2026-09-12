# Implementation Plan - UI Refinements & Navigation Fix

Update the application to have a "pro" fixed AppBar on the Home screen, center titles for Quiz and History screens, and fix the "Try Another Quiz" navigation flow.

## Proposed Changes

### Logic (MVVM)
- **[MODIFY]** [quiz_controller.dart](file:///C:/Quiz-App-/lib/app/modules/quiz/controllers/quiz_controller.dart):
    - In `finishQuiz()`, pass the entire `category` Map to the Result screen instead of just the name.
- **[MODIFY]** [result_controller.dart](file:///C:/Quiz-App-/lib/app/modules/result/controllers/result_controller.dart):
    - Change `category` type to `dynamic` (to handle the Map).
    - Update `onInit` to correctly extract the category Map.
    - Update `_saveResult` to use the category name for persistence.

### UI (Views)
- **[MODIFY]** [categories_tab.dart](file:///C:/Quiz-App-/lib/app/modules/home/views/tabs/categories_tab.dart):
    - Set `centerTitle: true` for the AppBar.
- **[MODIFY]** [history_tab.dart](file:///C:/Quiz-App-/lib/app/modules/home/views/tabs/history_tab.dart):
    - Ensure `centerTitle: true` (it already is, but verifying).
- **[MODIFY]** [result_view.dart](file:///C:/Quiz-App-/lib/app/modules/result/views/result_view.dart):
    - Update "Try Another Quiz" button to navigate to `AppRoutes.difficulty` with the stored `category` Map.
    - Display the category name correctly using `controller.category['name']`.
- **[MODIFY]** [dashboard_tab.dart](file:///C:/Quiz-App-/lib/app/modules/home/views/tabs/dashboard_tab.dart):
    - Ensure the fixed AppBar looks professional with the user greeting and profile avatar.

## Verification Plan

### Manual Verification
- **Navigation**: Complete a quiz, click "Try Another Quiz" on the result screen, and verify it takes you back to the Easy/Medium/Hard selection for the same category.
- **UI Alignment**: Verify that AppBar titles on Quiz, Categories, and History screens are centered.
- **Home UI**: Verify the Dashboard AppBar remains fixed at the top while scrolling the content.

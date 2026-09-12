# Implementation Plan - Home AppBar & Alignment Refinements

Add a fixed, colored `AppBar` to the Home Dashboard, moving header data into it for a professional look. Centrally align titles for Quiz and History screens as requested.

## Proposed Changes

### Home Dashboard
- **[MODIFY]** [dashboard_tab.dart](file:///C:/Quiz-App-/lib/app/modules/home/views/tabs/dashboard_tab.dart):
    - Add `AppBar` with `AppColors.primary` background.
    - Move greeting text and profile avatar from the body into the `AppBar`.
    - Remove the redundant `_buildHeader` method from the body.
    - Ensure the `AppBar` is fixed while the body content scrolls.

### History Screen
- **[MODIFY]** [history_tab.dart](file:///C:/Quiz-App-/lib/app/modules/home/views/tabs/history_tab.dart):
    - Set `centerTitle: true` in the `AppBar`.

### Quiz Screen
- **[MODIFY]** [quiz_view.dart](file:///C:/Quiz-App-/lib/app/modules/quiz/views/quiz_view.dart):
    - Ensure `centerTitle: true` is set (already implemented, but will verify).

## Verification Plan

### Manual Verification
- **Home Screen**:
    - Verify the colored `AppBar` is visible with the greeting and profile icon.
    - Verify the `AppBar` remains fixed when scrolling through stats and recent activity.
- **History Screen**:
    - Verify the title "Quiz History" is centered.
- **Quiz Screen**:
    - Verify the category title is centered in the `AppBar`.

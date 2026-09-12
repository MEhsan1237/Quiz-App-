# Walkthrough - UI Refinements & Visibility Fixes

The application has received several UI refinements to improve consistency, visibility, and professional look across all device themes.

## Key Changes

### 🎨 Global Theming Enhancements
- **Home Screen AppBars**: All home-related tabs (Categories, History, Profile) now feature the primary branded background in Light theme, matching the rest of the application.
- **ListTile Borders**: In Light theme, ListTiles now have a subtle, professional border, improving item separation and clarity.
- **Improved Contrast**: Updated the global `textTheme` to ensure `titleMedium` and other text elements have maximum contrast in both Light and Dark modes.

### 🏛️ Navigation & Alignment
- **Centered Titles**: The AppBar titles for the **Quiz Screen** and **Profile Screen** are now perfectly centered for a more focused, premium feel.
- **Smart Alignment**: Main home tabs (Categories, History) maintain their left-aligned titles to preserve a modern dashboard layout.

### 🧠 Category Visibility Fix
- **Dynamic Text Colors**: Fixed the visibility issue for "History", "Sports", "Science", and "Geography" in the Category tab. The text now dynamically adapts its color based on the current theme brightness, ensuring it's always readable against the card background.
- **Dark Theme Consistency**: Verified that all icons and text remain perfectly visible and well-vibranted in Dark mode.

## How to Verify
1.  **Light Theme Check**:
    *   Observe the `AppBar` in the Home screen tabs; they should now be colored.
    *   Look at the ListTiles (e.g., in Quiz History or Profile); they should have subtle borders.
    *   Verify the Category names are now clearly visible.
2.  **Alignment Check**:
    *   Go to the Quiz screen or Profile tab; the title should be centered.
    *   Go to Categories or History tabs; the title should be left-aligned.
3.  **Dark Theme Check**:
    *   Switch to Dark mode and ensure all elements (icons, category text, list items) remain highly visible and accessible.

> [!TIP]
> The `listTileTheme` was used to apply borders globally, ensuring that any future ListTiles added to the app will automatically follow this professional design.

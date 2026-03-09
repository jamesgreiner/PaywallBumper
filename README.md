## GitHub repository

- Repo: https://github.com/jamesgreiner/PaywallBumper

## How to run it

1. Open `PaywallBumper/PaywallBumper.xcodeproj` in Xcode
2. Select an iPhone simulator (or a connected device)
3. Build and run
4. Tap items in the feature list:
    - Basic features open a detail screen
    - Premium features open the paywall bumper sheet
        - Use the **X** button or swipe down to dismiss the sheet
        
**NOTE: I was having issues getting the unit tests to run in Xcode 26.3, but when using version 16.4 they ran and passesd successfully

## Architecture decisions

- Used MVVM with `FeatureViewModel` to keep view logic and analytics tracking out of the UI
- Added a small analytics abstraction (`AnalyticsTracking`) and console-based implementation (`AnalyticsTracker`) so event tracking can be swapped later
- Represented paywall variants through a `PaywallVariant` enum and `VariantConfiguration` value, which controls bumper title and message text in the view model

## How to switch between variants

In `PaywallBumper/PaywallBumperApp.swift`, change:

```
private let variantConfig = VariantConfiguration(paywallVariant: .featureLed)
to ->
private let variantConfig = VariantConfiguration(paywallVariant: .valueLed)
```

## What I'd do differently with more time

- Track additional events
    - Number or times each premium feature was tapped
    - Time spend on paywall bumper before upgrade or dismissal
- Use `AnalyticsTracking` to create an implemntation that tracks/persists events across app launches
- Add UI tests for core workflow paths (upgrade and dismissal)
- Track user type to ensure premium users can access all features

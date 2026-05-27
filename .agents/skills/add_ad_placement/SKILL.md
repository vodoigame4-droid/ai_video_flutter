---
name: add_ad_placement
description: Rules and steps for adding a new advertisement placement in the Dream Girl Flutter project. Use when Codex needs to add a new banner, interstitial, rewarded, or native ad key and wire it through constants, ad IDs, remote config, Havin SDK config, and optional preload flow.
---

# Agent Skill: Add Ad Placement

This skill provides a systematic approach to adding a new ad placement (Banner, Interstitial, Rewarded, or Native) to the project, ensuring all layers and configurations are updated correctly.

## Prerequisites
- Identify the Ad Key (e.g., `inter_survey_skip`)
- Identify the Ad Type (Banner, Interstitial, Rewarded, Native)
- Determine if Remote Config control is required (usually yes)

## Step-by-Step Implementation

### 1. Define the Ad Key
Update `lib/core/constants/ad_keys.dart` to include the new key.
- Use `snake_case` for the string value.
- Add it to the appropriate section (Banner, Interstitial, etc.).

### 2. Register Ad Unit IDs
Update the following files in `lib/core/environment/`:
- `ad_ids.dart`: Add a getter for the new ID (and optionally a `2floor` variant if needed).
- `ad_ids_android_release.dart`: Implement the getter with the production ID.
- `ad_ids_android_debug.dart`: Implement the getter with the test ID.
- `ad_ids_ios.dart`: Implement the getter for iOS.

### 3. Add Remote Config Control
Update `lib/data/datasources/remote/remote_config_service.dart`:
- Add a new entry to the `RemoteConfigKey` enum (e.g., `showInterSurveySkip<bool>('show_inter_survey_skip', false)`).

### 4. Register in Havin SDK Config
Update `lib/core/environment/havin_sdk_config.dart`:
- Add a new `HavinAdsUnit` to the `units` list in the `getUnitConfigs` method.
- Use the appropriate factory method: `HavinAdsUnit.banner()`, `HavinAdsUnit.interstitial()`, `HavinAdsUnit.rewarded()`, or `HavinAdsUnit.native()`.
- Link it to the `RemoteConfigKey` for enabling/disabling.

### 5. (Optional) Preload the Ad
If the ad needs to be shown quickly, preload it in the `initState` of the preceding page or a controller.
- Use `HavinAdsManager.instance.preloadInterstitial(adKey: AdKeys.yourKey)`.
- Or `HavinAdsManager.instance.preloadNativeAds(...)`.

## Verification
- Run `flutter analyze` to ensure no typos.
- Check the `Havin SDK Config` to ensure the mapping is correct.

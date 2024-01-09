<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/header-dark.png"><img src="https://raw.githubusercontent.com/exyte/media/master/common/header-light.png"></picture></a>

<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/our-site-dark.png" width="80" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/our-site-light.png" width="80" height="16"></picture></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://twitter.com/exyteHQ"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/twitter-dark.png" width="74" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/twitter-light.png" width="74" height="16">
</picture></a> <a href="https://exyte.com/contacts"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-dark.png" width="128" height="24" align="right"><img src="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-light.png" width="128" height="24" align="right"></picture></a>

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://github.com/exyte/FlagAndCountryCode/assets/9447630/07c4662f-9069-45d2-b8d8-5a7d7e3adeaa" />
            </td>
            <td>
                <img src="https://github.com/exyte/FlagAndCountryCode/assets/9447630/3ee60227-5cbf-431b-881f-33262eb25bdd" />
            </td>
            <td>
                <img src="https://github.com/exyte/FlagAndCountryCode/assets/9447630/e18f0e20-2738-410a-bfaa-69754bc86e7e" />
            </td>
        </tr>
    </tbody>
</table>

<p><h1 align="left">Flag And Country Code</h1></p>

<p><h4>FlagAndCountryCode provides phone codes and flags for every country. Works on UIKit and SwiftUI</h4></p>

![](https://img.shields.io/github/v/tag/exyte/FlagAndCountryCode?label=Version)
[![SPM Compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swiftpackageindex.com/exyte/FlagAndCountryCode)
[![Cocoapods Compatible](https://img.shields.io/badge/cocoapods-Compatible-brightgreen.svg)](https://cocoapods.org/pods/FlagAndCountryCode)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)

# Usage
Use the static variable `all` to get the list of `CountryFlagInfo` objects:
```swift
import FlagAndCountryCode

let countries = CountryFlagInfo.all
```

Each `CountryFlagInfo` contains:     
`name` - like "United States"         
`code` - 2 letter code ("US")    
`dialCode` - dial code ("+1")    

Use `getCountryImage` on a `CountryFlagInfo` of choice. It has both UIKit and SwiftUI implementations, returning a `UIImage` and a `View` respectively. Pass your desired flag style as a parameter.
```swift
country.getCountryImage(with: .roundedRect)
```

### Available flag types
`roundedRect` - 21 x 15 with rounded corners  
`square` - 15 x 15 with rounded corners  
`circle` - 15 x 15    

## Examples

To try the FlagAndCountryCode examples:
- Clone the repo `https://github.com/exyte/FlagAndCountryCode.git`
- Open Example/Example.xcodeproj
- Try it!

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
dependencies: [
    .package(url: "https://github.com/exyte/FlagAndCountryCode.git")
]
```

### [CocoaPods](http://cocoapods.org)

To install `FlagAndCountryCode`, simply add the following line to your Podfile:

```ruby
pod 'FlagAndCountryCode'
```

### [Carthage](http://github.com/Carthage/Carthage)

To integrate `FlagAndCountryCode` into your Xcode project using Carthage, specify it in your `Cartfile`

```ogdl
github "Exyte/FlagAndCountryCode"
```

## Requirements

* iOS 15+
* Xcode 15+ 

## Our other open source SwiftUI libraries
[PopupView](https://github.com/exyte/PopupView) - Toasts and popups library    
[Grid](https://github.com/exyte/Grid) - The most powerful Grid container    
[ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) - A scroll view with a sticky header which shrinks as you scroll.   
[AnimatedTabBar](https://github.com/exyte/AnimatedTabBar) - A tabbar with number of preset animations         
[MediaPicker](https://github.com/exyte/mediapicker) - Customizable media picker     
[Chat](https://github.com/exyte/chat) - Chat UI framework with fully customizable message cells, input view, and a built-in media picker    
[ConcentricOnboarding](https://github.com/exyte/ConcentricOnboarding) - Animated onboarding flow    
[FloatingButton](https://github.com/exyte/FloatingButton) - Floating button menu    
[ActivityIndicatorView](https://github.com/exyte/ActivityIndicatorView) - A number of animated loading indicators    
[ProgressIndicatorView](https://github.com/exyte/ProgressIndicatorView) - A number of animated progress indicators    
[SVGView](https://github.com/exyte/SVGView) - SVG parser    
[LiquidSwipe](https://github.com/exyte/LiquidSwipe) - Liquid navigation animation    

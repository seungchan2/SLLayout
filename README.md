SLLayout
===============
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/seungchan2/SLLayout?label=version&sort=semver)


**✨SLLayout** is A Swift Autolayout DSL for iOS


## How to get started

First, install **SLLayout** via [Swift Package Manager](https://swift.org/package-manager/) or manually.

 **SLLayout** simplifies Auto Layout in iOS by allowing you to add subviews and set constraints in a fluent and chainable manner. 

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build SnapKit using Swift Package Manager.

To integrate `ChanLog` into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`

```swift
dependencies: [
    .package(url: "https://github.com/seungchan2/SLLayout.git", branch: "main"))
]
```

## Swift Usage
you can `import SLLayout`
```swift
let label = UILabel()
let button = UIButton()

label.text = "SLLayout"
button.backgroundColor = .red

self.label.lay
    .addSubView(self.view)
    .center(.superview)

self.button.lay
    .addSubView(self.view)
    .centerX(.to(self.label).leading)
    .centerY(.to(self.label).centerY)
    .width(.equal(100))
    .height(.equal(100))
```
## More information
you can use `leading` `trailing` `top` `leading` `bottom` `centerX` `centerY` `width` `height`

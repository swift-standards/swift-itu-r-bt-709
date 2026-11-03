# swift-itu-r-bt-709

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Swift implementation of ITU-R BT.709, the HDTV parameter values: primaries, luma weights and Y′CbCr quantisation.

## Overview

The primaries and white point, the luma and colour-difference equations, and their digital code values at any bit depth, limited or full range.

```swift
import ITU_R_BT_709

ITU_R_BT_709.Signal(red: 1, green: 0, blue: 0).quantised()  // Y′ 63, Cb 102, Cr 240
```

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-itu-r-bt-709.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "ITU-R BT 709", package: "swift-itu-r-bt-709")
    ]
)
```

## License

This package is licensed under the Apache License 2.0. See [LICENSE.md](LICENSE.md) for details.

# CGMath

A Swift package that provides mathematical operators and convenient extensions for Core Graphics geometry types. CGMath makes working with `CGPoint`, `CGSize`, `CGRect`, and `CGVector` more intuitive by adding arithmetic operations and useful utility functions.

## Features

### 🧮 Mathematical Operators
- **Arithmetic Operations**: Add, subtract, multiply, and divide geometry types with scalars and other geometry types
- **Compound Assignment**: Use `+=`, `-=`, `*=`, `/=` operators for in-place modifications
- **Vector Mathematics**: Dot product, cross product, and normalization for `CGVector`
- **Component-wise Operations**: Multiply and divide geometry types by vectors

### 🔧 Convenience Extensions
- **Alternative Initializers**: Create geometry types from other types or with uniform values
- **Property Substitution**: Create new instances with modified individual components
- **Distance Calculations**: Calculate distances between points and vectors
- **Averaging Functions**: Calculate averages of multiple geometry instances
- **Rectangle Operations**: Center, offset, and aspect ratio fitting for rectangles

### 📐 Geometry Utilities
- **Point Operations**: Distance calculations, component substitution, averaging
- **Size Operations**: Half-size calculations, dimension substitution
- **Rectangle Operations**: Center point access, corner manipulation, transposition
- **Vector Operations**: Normalization, dot/cross products, component access

## Installation

### Swift Package Manager

Add CGMath to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/apparata/CGMath.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. File → Add Package Dependencies
2. Enter the repository URL
3. Choose your version requirements

## Quick Start

```swift
import CGMath

// Arithmetic operations with points
let point1 = CGPoint(x: 10, y: 20)
let point2 = CGPoint(x: 5, y: 15)
let sum = point1 + point2                    // CGPoint(x: 15, y: 35)
let scaled = point1 * 2.0                    // CGPoint(x: 20, y: 40)

// Vector operations
let vector1 = CGVector(dx: 3, dy: 4)
let vector2 = CGVector(dx: 1, dy: 2)
let dotProduct = vector1.dot(vector2)        // 11.0
let normalized = vector1.normalized          // Unit vector

// Rectangle operations  
let rect = CGRect(x: 0, y: 0, width: 100, height: 50)
let centered = rect.with(center: CGPoint(x: 50, y: 50))
let offset = rect.offset(CGPoint(x: 10, y: 10))

// Size operations
let size = CGSize(width: 100, height: 200)
let halfSize = size.halfSize                 // CGSize(width: 50, height: 100)
let square = CGSize(both: 50)                // CGSize(width: 50, height: 50)
```

## Usage Examples

### Basic Arithmetic

```swift
import CGMath

// Point arithmetic
let origin = CGPoint.zero
let offset = CGPoint(x: 10, y: 20)
let newPosition = origin + offset

// Size scaling
let originalSize = CGSize(width: 100, height: 50)
let doubledSize = originalSize * 2.0
let halfSize = originalSize / 2.0

// Rectangle translation
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let translatedRect = rect + CGPoint(x: 50, y: 50)
```

### Vector Mathematics

```swift
import CGMath

let velocity = CGVector(dx: 30, dy: 40)
let acceleration = CGVector(dx: 2, dy: 1)

// Vector operations
let magnitude = sqrt(velocity.dot(velocity))  // Vector length
let unitVector = velocity.normalized          // Direction only
let crossProduct = velocity.cross(acceleration)

// Component-wise multiplication
let scaled = velocity * CGVector(dx: 0.5, dy: 2.0)
```

### Advanced Rectangle Operations

```swift
import CGMath

let container = CGRect(x: 0, y: 0, width: 400, height: 300)
let content = CGSize(width: 16, height: 9)  // 16:9 aspect ratio

// Fit content inside container maintaining aspect ratio
let fitted = container.fitInsideWithAspectRatio(content)

// Create rectangle from two arbitrary points
let rect = CGRect.absolute(from: CGPoint(x: 50, y: 100), 
                          to: CGPoint(x: 200, y: 50))

// Center a rectangle within another
let centered = fitted.centerInRect(container)
```

### Averaging and Statistics

```swift
import CGMath

let points = [
    CGPoint(x: 0, y: 0),
    CGPoint(x: 100, y: 0),
    CGPoint(x: 50, y: 100)
]

let center = CGPoint.average(points)  // Centroid

let sizes = [CGSize(width: 10, height: 20), CGSize(width: 30, height: 40)]
let averageSize = CGSize.average(sizes)
```

### Distance Calculations

```swift
import CGMath

let point1 = CGPoint(x: 0, y: 0)
let point2 = CGPoint(x: 3, y: 4)

let distance = point1.distance(to: point2)           // 5.0
let distanceSquared = point1.distanceSquared(to: point2)  // 25.0 (more efficient)

// Same operations work for vectors
let vector1 = CGVector(dx: 1, dy: 1)
let vector2 = CGVector(dx: 4, dy: 5)
let vectorDistance = vector1.distance(to: vector2)
```

## API Reference

### Mathematical Operators

| Operator | Types | Description |
|----------|-------|-------------|
| `+` | All geometry types | Addition |
| `-` | All geometry types | Subtraction |
| `*` | All geometry types | Multiplication (scalar and vector) |
| `/` | All geometry types | Division (scalar and vector) |
| `+=` | All geometry types | Addition assignment |
| `-=` | All geometry types | Subtraction assignment |
| `*=` | All geometry types | Multiplication assignment |
| `/=` | All geometry types | Division assignment |

### CGPoint Extensions

- `init(size:)` - Create from CGSize
- `init(both:)` - Create with same x,y values
- `with(x:)`, `with(y:)` - Component substitution
- `distance(to:)`, `distanceSquared(to:)` - Distance calculations
- `average(_:)` - Calculate average of multiple points

### CGSize Extensions

- `halfSize` - Half dimensions
- `init(point:)` - Create from CGPoint
- `init(both:)` - Create square size
- `with(width:)`, `with(height:)` - Dimension substitution
- `average(_:)` - Calculate average of multiple sizes

### CGVector Extensions

- `normalized` - Unit vector
- `init(both:)` - Create with same dx,dy values
- `init(size:)` - Create from CGSize
- `with(dx:)`, `with(dy:)` - Component substitution
- `dot(_:)`, `cross(_:)` - Vector mathematics
- `distance(to:)`, `distanceSquared(to:)` - Distance calculations
- `average(_:)` - Calculate average of multiple vectors

### CGRect Extensions

- `center` - Get/set center point
- `min`, `max` - Get/set corner points
- `transposed` - Swap width/height
- `init(center:size:)` - Create from center point
- `with(x:)`, `with(y:)`, `with(width:)`, `with(height:)` - Property substitution
- `with(origin:)`, `with(size:)`, `with(center:)` - Component substitution
- `centerInRect(_:)` - Center within another rectangle
- `offset(_:)` - Translate by point, size, or vector
- `fitInsideWithAspectRatio(_:)` - Aspect ratio fitting
- `absolute(from:to:)` - Create from two points

## Platform Support

- **iOS 16.0+**
- **macOS 12+**
- **tvOS 16.0+**
- **visionOS 1.0+**

## Requirements

- Swift 5.10+
- Xcode 16.0+

## License

CGMath is available under the 0BSD license. See the [LICENSE](LICENSE) file for more info.

## Documentation

This package includes comprehensive DocC documentation. Build the documentation in Xcode using Product → Build Documentation, or generate it using Swift Package Manager:

```bash
swift package generate-documentation
```

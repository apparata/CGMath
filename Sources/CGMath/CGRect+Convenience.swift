//
// Copyright © 2021 Apparata AB. All rights reserved.
//

/// # CGRect Convenience Extensions
///
/// This module provides convenient extensions for `CGRect` that add useful properties,
/// initializers, and utility functions for working with rectangles and geometric operations.
///
/// ## Overview
///
/// The extensions include:
/// - Convenient properties for accessing rectangle centers, corners, and bounds
/// - Alternative initializers for creating rectangles from centers
/// - Methods for creating new rectangles with modified properties
/// - Geometric operations like centering, offsetting, and aspect ratio fitting
/// - Utility functions for rectangle manipulation and transformation

import Foundation
import CoreGraphics

/// Extensions providing convenience methods and properties for `CGRect`.
public extension CGRect {
    
    /// The center point of the rectangle.
    /// Getting returns the center point, setting moves the rectangle so its center is at the specified point.
    var center: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
        set {
            origin = CGPoint(x: newValue.x - size.width / 2.0, y: newValue.y - size.height / 2.0)
        }
    }
    
    /// The minimum corner (origin) of the rectangle.
    /// Getting returns the origin, setting moves the rectangle to the specified origin.
    var min: CGPoint {
        get {
            return origin
        }
        set {
            origin = newValue
        }
    }
    
    /// The maximum corner (bottom-right) of the rectangle.
    /// Getting returns the maximum corner, setting moves the rectangle so its maximum corner is at the specified point.
    var max: CGPoint {
        get {
            return CGPoint(x: self.maxX, y: self.maxY)
        }
        set {
            origin = CGPoint(x: newValue.x - size.width, y: newValue.y - size.height)
        }
    }
    
    /// Returns a rectangle with X and Y axes flipped.
    /// The resulting rectangle has its width and height swapped, and coordinates transposed.
    var transposed: CGRect {
        return CGRect(x: origin.y, y: origin.x, width: size.height, height: size.width)
    }
    
    // MARK: - Initializers
    
    /// Creates a rectangle with the specified center point and size.
    /// - Parameters:
    ///   - center: The center point of the rectangle
    ///   - size: The size of the rectangle
    init(center: CGPoint, size: CGSize) {
        self.init()
        self.size = size
        self.origin = CGPoint(x: center.x - size.width / 2.0, y: center.y - size.height / 2.0)
    }
    
    // MARK: - Property Substitution
    
    /// Creates a new rectangle with a different x coordinate.
    /// - Parameter x: The new x coordinate
    /// - Returns: A new rectangle with the specified x coordinate and same other properties
    func with(x: CGFloat) -> CGRect {
        return CGRect(x: x, y: origin.y, width: size.width, height: size.height)
    }

    /// Creates a new rectangle with a different y coordinate.
    /// - Parameter y: The new y coordinate
    /// - Returns: A new rectangle with the specified y coordinate and same other properties
    func with(y: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: y, width: size.width, height: size.height)
    }

    /// Creates a new rectangle with a different width.
    /// - Parameter width: The new width
    /// - Returns: A new rectangle with the specified width and same other properties
    func with(width: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: origin.y, width: width, height: size.height)
    }

    /// Creates a new rectangle with a different height.
    /// - Parameter height: The new height
    /// - Returns: A new rectangle with the specified height and same other properties
    func with(height: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: origin.y, width: size.width, height: height)
    }
    
    /// Creates a new rectangle with a different origin.
    /// - Parameter origin: The new origin point
    /// - Returns: A new rectangle with the specified origin and same size
    func with(origin: CGPoint) -> CGRect {
        return CGRect(origin: origin, size: size)
    }

    /// Creates a new rectangle with a different size.
    /// - Parameter size: The new size
    /// - Returns: A new rectangle with the specified size and same origin
    func with(size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }

    /// Creates a new rectangle with a different center point.
    /// - Parameter center: The new center point
    /// - Returns: A new rectangle centered at the specified point with the same size
    func with(center: CGPoint) -> CGRect {
        return CGRect(center: center, size: size)
    }
    
    // MARK: - Rectangle Operations
    
    /// Creates a new rectangle with the same size as this one, centered in another rectangle.
    /// - Parameter rect: The rectangle to center this rectangle within
    /// - Returns: A new rectangle with the same size, centered in the specified rectangle
    func centerInRect(_ rect: CGRect) -> CGRect {
        return CGRect(center: rect.center, size: size)
    }

    /// Returns a rectangle with an origin offset by the specified point.
    /// - Parameter point: The point to offset the origin by
    /// - Returns: A new rectangle offset by the point
    func offset(_ point: CGPoint) -> CGRect {
        return self.offsetBy(dx: point.x, dy: point.y)
    }

    /// Returns a rectangle with an origin offset by the specified size.
    /// - Parameter size: The size to offset the origin by (width→dx, height→dy)
    /// - Returns: A new rectangle offset by the size
    func offset(_ size: CGSize) -> CGRect {
        return self.offsetBy(dx: size.width, dy: size.height)
    }

    /// Returns a rectangle with an origin offset by the specified vector.
    /// - Parameter delta: The vector to offset the origin by
    /// - Returns: A new rectangle offset by the vector
    func offset(_ delta: CGVector) -> CGRect {
        return self.offsetBy(dx: delta.dx, dy: delta.dy)
    }
    
    /// Returns the largest rectangle with the specified aspect ratio that fits inside this rectangle.
    /// - Parameter aspectRatioSize: A size used only for its aspect ratio (width/height)
    /// - Returns: A new rectangle with the target aspect ratio, centered and fitted inside this rectangle
    func fitInsideWithAspectRatio(_ aspectRatioSize: CGSize) -> CGRect {
        let aspectRatio = size.width / size.height
        let targetAspectRatio = aspectRatioSize.width / aspectRatioSize.height
        if aspectRatio > targetAspectRatio {
            // Source rect is wider
            let targetWidth = targetAspectRatio * size.height
            return CGRect(center: center, size: CGSize(width: targetWidth, height: size.height))
        } else {
            // Source rect is taller
            let targetHeight = targetAspectRatio * size.width
            return CGRect(center: center, size: CGSize(width: targetHeight, height: size.width))
        }
    }

    /// Creates a rectangle from two arbitrary points, using the minimum coordinates as origin.
    /// - Parameters:
    ///   - from: The first point
    ///   - to: The second point
    /// - Returns: A rectangle with origin at the minimum x,y coordinates and size spanning both points
    static func absolute(from: CGPoint, to: CGPoint) -> CGRect {
        let x = Swift.min(from.x, to.x)
        let y = Swift.min(from.y, to.y)
        let width = abs(from.x - to.x)
        let height = abs(from.y - to.y)
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

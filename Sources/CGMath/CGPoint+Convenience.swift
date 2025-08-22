//
// Copyright © 2021 Apparata AB. All rights reserved.
//

/// # CGPoint Convenience Extensions
///
/// This module provides convenient extensions for `CGPoint` that add useful initializers,
/// mathematical operations, and utility functions for working with points in 2D space.
///
/// ## Overview
///
/// The extensions include:
/// - Alternative initializers for creating points from sizes or with uniform values
/// - Methods for creating new points with modified components
/// - Distance calculations between points
/// - Averaging functions for collections of points

import Foundation
import CoreGraphics

/// Extensions providing convenience methods and initializers for `CGPoint`.
public extension CGPoint {
    
    /// Creates a point from a size, using width as x and height as y.
    /// - Parameter size: The size to convert to a point
    init(size: CGSize) {
        self.init()
        x = size.width
        y = size.height
    }
    
    /// Creates a point with the same value for both x and y coordinates.
    /// - Parameter both: The value to use for both x and y coordinates
    init(both: CGFloat) {
        self.init()
        x = both
        y = both
    }

    // MARK: - Component Substitution
    
    /// Creates a new point with a different x coordinate.
    /// - Parameter x: The new x coordinate
    /// - Returns: A new point with the specified x coordinate and the same y coordinate
    func with(x: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }

    /// Creates a new point with a different y coordinate.
    /// - Parameter y: The new y coordinate
    /// - Returns: A new point with the same x coordinate and the specified y coordinate
    func with(y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    // MARK: - Point Averaging
    
    /// Calculates the average of multiple points.
    /// - Parameter points: Variable number of points to average
    /// - Returns: The average point of all input points
    static func average(_ points: CGPoint...) -> CGPoint {
        return average(points)
    }

    /// Calculates the average of an array of points.
    /// - Parameter points: Array of points to average
    /// - Returns: The average point of all input points
    static func average(_ points: [CGPoint]) -> CGPoint {
        var x: CGFloat = 0
        var y: CGFloat = 0
        for point in points {
            x += point.x
            y += point.y
        }
        let denominator = CGFloat(points.count)
        return CGPoint(x: x / denominator, y: y / denominator)
    }

    // MARK: - Distance Calculations

    /// Calculates the squared distance to another point.
    /// - Parameter to: The target point
    /// - Returns: The squared distance between this point and the target point
    /// - Note: This is more efficient than `distance(to:)` when you only need to compare distances
    func distanceSquared(to: CGPoint) -> CGFloat {
        (x - to.x) * (x - to.x) + (y - to.y) * (y - to.y)
    }

    /// Calculates the Euclidean distance to another point.
    /// - Parameter to: The target point
    /// - Returns: The distance between this point and the target point
    func distance(to: CGPoint) -> CGFloat {
        sqrt((x - to.x) * (x - to.x) + (y - to.y) * (y - to.y))
    }
}

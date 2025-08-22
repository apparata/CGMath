//
// Copyright © 2021 Apparata AB. All rights reserved.
//

/// # CGVector Convenience Extensions
///
/// This module provides convenient extensions for `CGVector` that add useful initializers,
/// mathematical operations, and utility functions for working with vectors in 2D space.
///
/// ## Overview
///
/// The extensions include:
/// - Alternative initializers for creating vectors from sizes or with uniform values
/// - Vector normalization for unit vectors
/// - Vector mathematics including dot and cross products
/// - Distance calculations between vectors
/// - Averaging functions for collections of vectors
/// - Methods for creating new vectors with modified components

import Foundation
import CoreGraphics

/// Extensions providing convenience methods and mathematical operations for `CGVector`.
public extension CGVector {
        
    /// Returns a normalized (unit) vector with the same direction.
    /// - Returns: A vector with length 1 pointing in the same direction
    /// - Note: The original vector must not be zero length to avoid division by zero
    var normalized: CGVector {
        let k = sqrt(dx * dx + dy * dy)
        return CGVector(dx: dx / k, dy: dy / k)
    }
    
    /// Creates a vector with the same value for both dx and dy components.
    /// - Parameter both: The value to use for both dx and dy components
    init(both: CGFloat) {
        self.init()
        dx = both
        dy = both
    }
    
    /// Creates a vector from a size, using width as dx and height as dy.
    /// - Parameter size: The size to convert to a vector
    init(size: CGSize) {
        self.init(dx: size.width, dy: size.height)
    }

    // MARK: - Component Substitution

    /// Creates a new vector with a different dx component.
    /// - Parameter dx: The new dx component
    /// - Returns: A new vector with the specified dx and the same dy component
    func with(dx: CGFloat) -> CGVector {
        return CGVector(dx: dx, dy: dy)
    }

    /// Creates a new vector with a different dy component.
    /// - Parameter dy: The new dy component
    /// - Returns: A new vector with the same dx and the specified dy component
    func with(dy: CGFloat) -> CGVector {
        return CGVector(dx: dx, dy: dy)
    }

    // MARK: - Vector Mathematics

    /// Calculates the dot product with another vector.
    /// - Parameter vector: The other vector
    /// - Returns: The dot product of the two vectors
    /// - Note: The dot product represents the cosine of the angle between vectors when both are normalized
    func dot(_ vector: CGVector) -> CGFloat {
        return dx * vector.dx + dy * vector.dy
    }
    
    /// Calculates the cross product with another vector.
    /// - Parameter vector: The other vector
    /// - Returns: The scalar cross product of the two vectors
    /// - Note: In 2D, the cross product returns a scalar representing the area of the parallelogram formed by the vectors
    func cross(_ vector: CGVector) -> CGFloat {
        return dx * vector.dy - dy * vector.dx
    }

    // MARK: - Vector Averaging
        
    /// Calculates the average of multiple vectors.
    /// - Parameter vectors: Variable number of vectors to average
    /// - Returns: The average vector of all input vectors
    static func average(_ vectors: CGVector...) -> CGVector {
        return average(vectors)
    }

    /// Calculates the average of an array of vectors.
    /// - Parameter vectors: Array of vectors to average
    /// - Returns: The average vector of all input vectors
    static func average(_ vectors: [CGVector]) -> CGVector {
        var dx: CGFloat = 0
        var dy: CGFloat = 0
        for vector in vectors {
            dx += vector.dx
            dy += vector.dy
        }
        let denominator = CGFloat(vectors.count)
        return CGVector(dx: dx / denominator, dy: dy / denominator)
    }

    // MARK: - Distance Calculations

    /// Calculates the squared distance to another vector.
    /// - Parameter to: The target vector
    /// - Returns: The squared distance between this vector and the target vector
    /// - Note: This is more efficient than `distance(to:)` when you only need to compare distances
    func distanceSquared(to: CGVector) -> CGFloat {
        (dx - to.dx) * (dx - to.dx) + (dy - to.dy) * (dy - to.dy)
    }

    /// Calculates the Euclidean distance to another vector.
    /// - Parameter to: The target vector
    /// - Returns: The distance between this vector and the target vector
    func distance(to: CGVector) -> CGFloat {
        sqrt((dx - to.dx) * (dx - to.dx) + (dy - to.dy) * (dy - to.dy))
    }
}


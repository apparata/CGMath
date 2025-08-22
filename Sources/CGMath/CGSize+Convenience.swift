//
// Copyright © 2021 Apparata AB. All rights reserved.
//

/// # CGSize Convenience Extensions
///
/// This module provides convenient extensions for `CGSize` that add useful initializers,
/// mathematical operations, and utility functions for working with sizes and dimensions.
///
/// ## Overview
///
/// The extensions include:
/// - Alternative initializers for creating sizes from points or with uniform dimensions
/// - Computed properties for common size operations
/// - Methods for creating new sizes with modified dimensions
/// - Averaging functions for collections of sizes

import Foundation
import CoreGraphics

/// Extensions providing convenience methods and initializers for `CGSize`.
public extension CGSize {
    
    /// Returns a size that is half the width and height of this size.
    /// - Returns: A new size with both dimensions divided by 2
    var halfSize: CGSize {
        return CGSize(width: self.width / 2.0, height: self.height / 2.0)
    }
    
    /// Creates a size from a point, using x as width and y as height.
    /// - Parameter point: The point to convert to a size
    init(point: CGPoint) {
        self.init()
        width = point.x
        height = point.y
    }
    
    /// Creates a square size with the same value for both width and height.
    /// - Parameter both: The value to use for both width and height
    init(both: CGFloat) {
        self.init()
        width = both
        height = both
    }

    // MARK: - Dimension Substitution

    /// Creates a new size with a different width.
    /// - Parameter width: The new width
    /// - Returns: A new size with the specified width and the same height
    func with(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }

    /// Creates a new size with a different height.
    /// - Parameter height: The new height
    /// - Returns: A new size with the same width and the specified height
    func with(height: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    // MARK: - Size Averaging
    
    /// Calculates the average of multiple sizes.
    /// - Parameter sizes: Variable number of sizes to average
    /// - Returns: The average size of all input sizes
    static func average(_ sizes: CGSize...) -> CGSize {
        return average(sizes)
    }

    /// Calculates the average of an array of sizes.
    /// - Parameter sizes: Array of sizes to average
    /// - Returns: The average size of all input sizes
    static func average(_ sizes: [CGSize]) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for size in sizes {
            width += size.width
            height += size.height
        }
        let denominator = CGFloat(sizes.count)
        return CGSize(width: width / denominator, height: height / denominator)
    }
}

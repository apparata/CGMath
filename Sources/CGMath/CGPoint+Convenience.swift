//
//  Copyright © 2021 Apparata AB. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGPoint {
    
    init(size: CGSize) {
        self.init()
        x = size.width
        y = size.height
    }
    
    init(both: CGFloat) {
        self.init()
        x = both
        y = both
    }

    // MARK: Substitute value

    func with(x: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }

    func with(y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    // MARK: Average Point
    
    static func average(_ points: CGPoint...) -> CGPoint {
        return average(points)
    }

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

    // MARK: Distance to Point

    func distanceSquared(to: CGPoint) -> CGFloat {
        (x - to.x) * (x - to.x) + (y - to.y) * (y - to.y)
    }

    func distance(to: CGPoint) -> CGFloat {
        sqrt((x - to.x) * (x - to.x) + (y - to.y) * (y - to.y))
    }
}

//
//  Copyright © 2021 Apparata AB. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGSize {
    
    var halfSize: CGSize {
        return CGSize(width: self.width / 2.0, height: self.height / 2.0)
    }
    
    init(point: CGPoint) {
        self.init()
        width = point.x
        height = point.y
    }
    
    init(both: CGFloat) {
        self.init()
        width = both
        height = both
    }

    // MARK: Substitute value

    func with(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }

    func with(height: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    // MARK: Average Size
    
    static func average(_ sizes: CGSize...) -> CGSize {
        return average(sizes)
    }

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

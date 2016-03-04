//  SambaTechMovied
//
//  Created by Elton Melo on 03/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.

import UIKit

class UtilColors: NSObject {
    
    class func colorFactory(color: String) -> UIColor{
        return UIColor.colorWithHexString(color)
    }
        
    class func colorNavigationBar() -> UIColor{
        return UIColor.colorWithHexString("#249787")
    }
    
    class func ColorWrite() -> UIColor {
        return UIColor.whiteColor()
    }
    
    class func ColorWrite(alpha: CGFloat) -> UIColor {
        return UIColor.whiteColor().colorWithAlphaComponent(alpha)
    }
    
    class func ColorRed() -> UIColor {
        return UIColor.colorWithHexString("#EE3100")
    }
    
}

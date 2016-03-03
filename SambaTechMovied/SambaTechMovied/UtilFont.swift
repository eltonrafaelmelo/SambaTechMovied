
import UIKit

class UtilFont: NSObject {
    
    class func fontNavigationBarTitle() -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: 17)!
    }
    
    class func fontSequenceTitle() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 17)!
    }
    
    class func fontItemSequenceTitle() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 11)!
    }
    
    class func fontItemSequencePrevious() -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: 12)!
    }
    
    class func fontTextNormalRegular() -> UIFont {
        return UIFont(name: "HelveticaNeue-Regular", size: 17)!
    }
    
    class func fontTextNormal() -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: 17)!
    }
    
    class func fontTextNormal(tamanho:CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: tamanho)!
    }
    
    class func fontTextNormalComTamanho(tamanho:CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: tamanho)!
    }
    
    class func fontTextNormalBold() -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: 17)!
    }
    
    class func fontTextNormalBold(tamanho:CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: tamanho)!
    }
    
    class func fontTextNormalBoldComTamanho(tamanho:CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: tamanho)!
    }
}

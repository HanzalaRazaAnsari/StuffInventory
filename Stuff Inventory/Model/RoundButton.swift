//
//
//  Created by HanZala RaZa on 7/3/18.
//  Copyright © 2018 HanZala RaZa. All rights reserved.
//

import UIKit
@IBDesignable

class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
}

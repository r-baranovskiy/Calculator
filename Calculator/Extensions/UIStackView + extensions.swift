

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 10
        self.distribution = .fillEqually
    }
}

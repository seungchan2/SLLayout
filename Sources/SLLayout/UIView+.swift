import UIKit

extension UIView {
    var lay: LayoutConfigurable {
        return LayoutProxy(view: self)
    }
}

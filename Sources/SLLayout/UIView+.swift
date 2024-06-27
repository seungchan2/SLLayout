import UIKit

extension UIView {
    public var lay: LayoutConfigurable {
        return LayoutProxy(view: self)
    }
}

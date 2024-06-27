import UIKit

public enum LayoutRelation {
    case superview
    case viewAttribute(UIView, NSLayoutConstraint.Attribute)
    
    public static func to(_ view: UIView) -> ViewAttributeWrapper {
        return ViewAttributeWrapper(view: view)
    }
}

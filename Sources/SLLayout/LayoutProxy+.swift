import UIKit

extension LayoutProxy {
        
    internal func applyXAxisConstraint(_ relation: LayoutRelation,
                              attribute: NSLayoutConstraint.Attribute,
                              type: LayoutConstraintType) {
        let targetAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>?
        switch relation {
        case .superview:
            guard let superview = self.view.superview else {
                fatalError("Superview must be set before adding constraints")
            }
            targetAnchor = xAxisAnchor(for: attribute, in: superview)
        case .viewAttribute(let relatedView, let relatedAttribute):
            targetAnchor = xAxisAnchor(for: relatedAttribute, in: relatedView)
        }
        
        guard let anchor = xAxisAnchor(for: attribute, in: view), let target = targetAnchor else {
            fatalError("Invalid anchor configuration")
        }
        
        switch type {
        case .equal(let constant):
            NSLayoutConstraint.activate([
                anchor.constraint(equalTo: target, constant: constant)
            ])
        case .greaterThanOrEqual(let constant):
            NSLayoutConstraint.activate([
                anchor.constraint(greaterThanOrEqualTo: target, constant: constant)
            ])
        case .lessThanOrEqual(let constant):
            NSLayoutConstraint.activate([
                anchor.constraint(lessThanOrEqualTo: target, constant: constant)
            ])
        }
    }
    
    internal func applyYAxisConstraint(_ relation: LayoutRelation,
                                      attribute: NSLayoutConstraint.Attribute,
                                      type: LayoutConstraintType) {
        let targetAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>?
        switch relation {
        case .superview:
            guard let superview = self.view.superview else {
                fatalError("Superview must be set before adding constraints")
            }
            targetAnchor = yAxisAnchor(for: attribute, in: superview)
        case .viewAttribute(let relatedView, let relatedAttribute):
            targetAnchor = yAxisAnchor(for: relatedAttribute, in: relatedView)
        }
        
        guard let anchor = yAxisAnchor(for: attribute, in: view), let target = targetAnchor else {
            fatalError("Invalid anchor configuration")
        }
        
        switch type {
        case .equal(let constant):
            NSLayoutConstraint.activate([
                anchor.constraint(equalTo: target, constant: constant)
            ])
        case .greaterThanOrEqual(let constant):
            NSLayoutConstraint.activate([
                anchor.constraint(greaterThanOrEqualTo: target, constant: constant)
            ])
        case .lessThanOrEqual(let constant):
            NSLayoutConstraint.activate([
                anchor.constraint(lessThanOrEqualTo: target, constant: constant)
            ])
        }
    }
    
    internal func applyDimensionConstraint(attribute: NSLayoutConstraint.Attribute, constant: CGFloat) {
        let anchor: NSLayoutDimension
        switch attribute {
        case .width:
            anchor = view.widthAnchor
        case .height:
            anchor = view.heightAnchor
        default:
            return
        }
        
        NSLayoutConstraint.activate([
            anchor.constraint(equalToConstant: constant)
        ])
    }
    
    internal func xAxisAnchor(for attribute: NSLayoutConstraint.Attribute, in view: UIView) -> NSLayoutAnchor<NSLayoutXAxisAnchor>? {
        switch attribute {
        case .leading:
            return view.leadingAnchor
        case .trailing:
            return view.trailingAnchor
        case .centerX:
            return view.centerXAnchor
        default:
            return nil
        }
    }
    
    internal func yAxisAnchor(for attribute: NSLayoutConstraint.Attribute, in view: UIView) -> NSLayoutAnchor<NSLayoutYAxisAnchor>? {
        switch attribute {
        case .top:
            return view.topAnchor
        case .bottom:
            return view.bottomAnchor
        case .centerY:
            return view.centerYAnchor
        default:
            return nil
        }
    }
}

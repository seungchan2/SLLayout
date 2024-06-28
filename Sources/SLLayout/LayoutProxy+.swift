import UIKit

extension LayoutProxy {
        
    /// xAxis - LayoutConstraintType
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
    
    /// yAxis - LayoutConstraintType
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
    
    /// LayoutConstraintType - constant for inset
    internal func applyConstraint(_ relation: LayoutRelation,
                                  attribute: NSLayoutConstraint.Attribute,
                                  constant: CGFloat) {
        switch attribute {
        case .leading, .trailing:
            applyXAxisConstraint(relation, attribute: attribute, constant: constant)
        case .top, .bottom:
            applyYAxisConstraint(relation, attribute: attribute, constant: constant)
        default:
            fatalError("Invalid attribute for applying constraint.")
        }
    }
    
    /// xAxis - constant
    internal func applyXAxisConstraint(_ relation: LayoutRelation,
                                       attribute: NSLayoutConstraint.Attribute, 
                                       constant: CGFloat) {
        let targetAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>
        switch relation {
        case .superview:
            guard let superview = self.view.superview else {
                fatalError("Superview must be set before adding constraints")
            }
            if attribute == .leading {
                targetAnchor = superview.leadingAnchor
            } else {
                targetAnchor = superview.trailingAnchor
            }
        case .viewAttribute(let relatedView, _):
            if attribute == .leading {
                targetAnchor = relatedView.leadingAnchor
            } else {
                targetAnchor = relatedView.trailingAnchor
            }
        }
        
        let anchor = (attribute == .leading) ? self.view.leadingAnchor : self.view.trailingAnchor
        NSLayoutConstraint.activate([
            anchor.constraint(equalTo: targetAnchor, constant: constant)
        ])
    }
    
    /// yAxis - constant
    internal func applyYAxisConstraint(_ relation: LayoutRelation, attribute: NSLayoutConstraint.Attribute, constant: CGFloat) {
        let targetAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>
        switch relation {
        case .superview:
            guard let superview = self.view.superview else {
                fatalError("Superview must be set before adding constraints")
            }
            if attribute == .top {
                targetAnchor = superview.topAnchor
            } else {
                targetAnchor = superview.bottomAnchor
            }
        case .viewAttribute(let relatedView, _):
            if attribute == .top {
                targetAnchor = relatedView.topAnchor
            } else {
                targetAnchor = relatedView.bottomAnchor
            }
        }
        
        let anchor = (attribute == .top) ? self.view.topAnchor : self.view.bottomAnchor
        NSLayoutConstraint.activate([
            anchor.constraint(equalTo: targetAnchor, constant: constant)
        ])
    }
    
    /// size - constant
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

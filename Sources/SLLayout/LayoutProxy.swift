import UIKit

public final class LayoutProxy: LayoutConfigurable {
  
    internal let view: UIView

    public init(view: UIView) {
        self.view = view
    }

    @discardableResult
    public func addSubView(_ subview: UIView) -> LayoutConfigurable {
        subview.addSubview(self.view)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    public func leading(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable {
        applyXAxisConstraint(relation, attribute: .leading, type: type)
        return self
    }

    @discardableResult
    public func trailing(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable {
        applyXAxisConstraint(relation, attribute: .trailing, type: type)
        return self
    }

    @discardableResult
    public func top(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable {
        applyYAxisConstraint(relation, attribute: .top, type: type)
        return self
    }

    @discardableResult
    public func bottom(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable {
        applyYAxisConstraint(relation, attribute: .bottom, type: type)
        return self
    }
    
    @discardableResult
    public func centerX(_ relation: LayoutRelation) -> LayoutConfigurable {
        guard let superview = self.view.superview else {
            fatalError("Superview must be set before adding constraints")
        }
        NSLayoutConstraint.activate([
            self.view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ])
        return self
    }
    
    @discardableResult
    public func centerY(_ relation: LayoutRelation) -> LayoutConfigurable {
        guard let superview = self.view.superview else {
            fatalError("Superview must be set before adding constraints")
        }
        NSLayoutConstraint.activate([
            self.view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
        return self
    }

    @discardableResult
    public func width(_ constant: CGFloat) -> LayoutConfigurable {
        applyDimensionConstraint(attribute: .width, constant: constant)
        return self
    }

    @discardableResult
    public func height(_ constant: CGFloat) -> LayoutConfigurable {
        applyDimensionConstraint(attribute: .height, constant: constant)
        return self
    }
    
    @discardableResult
    public func size(_ constant: CGFloat) -> LayoutConfigurable {
        return self.width(constant).height(constant)
    }

    @discardableResult
    public func center(_ relation: LayoutRelation) -> LayoutConfigurable {
        guard let superview = self.view.superview else {
            fatalError("Superview must be set before adding constraints")
        }
        NSLayoutConstraint.activate([
            self.view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
        return self
    }
}

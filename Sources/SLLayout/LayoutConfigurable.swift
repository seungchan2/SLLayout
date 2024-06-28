import UIKit

public protocol LayoutConfigurable {
    @discardableResult
    func addSubView(_ subview: UIView) -> LayoutConfigurable
    
    @discardableResult
    func leading(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable
    
    @discardableResult
    func trailing(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable

    @discardableResult
    func top(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable
    
    @discardableResult
    func bottom(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable
    
    @discardableResult
    func centerX(_ relation: LayoutRelation) -> LayoutConfigurable
    
    @discardableResult
    func centerY(_ relation: LayoutRelation) -> LayoutConfigurable
    
    @discardableResult
    func center(_ relation: LayoutRelation) -> LayoutConfigurable
    
    @discardableResult
    func width(_ constant: CGFloat) -> LayoutConfigurable
    
    @discardableResult
    func height(_ constant: CGFloat) -> LayoutConfigurable
    
    @discardableResult
    func size(_ constant: CGFloat) -> LayoutConfigurable
}

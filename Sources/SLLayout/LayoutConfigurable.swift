import UIKit

public protocol LayoutConfigurable {
    /// addSubView
    @discardableResult
    func addSubView(_ subview: UIView) -> LayoutConfigurable
    
    /// xAxis
    @discardableResult
    func leading(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable
    
    @discardableResult
    func leading(_ relation: LayoutRelation) -> LayoutConfigurable
    
    @discardableResult
    func trailing(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable
    
    @discardableResult
    func trailing(_ relation: LayoutRelation) -> LayoutConfigurable
    
    @discardableResult
    func centerX(_ relation: LayoutRelation) -> LayoutConfigurable
    
    /// yAxis
    @discardableResult
    func top(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable
    
    @discardableResult
    func top(_ relation: LayoutRelation) -> LayoutConfigurable
    
    
    @discardableResult
    func bottom(_ relation: LayoutRelation, _ type: LayoutConstraintType) -> LayoutConfigurable
    
    @discardableResult
    func bottom(_ relation: LayoutRelation) -> LayoutConfigurable
    
    @discardableResult
    func centerY(_ relation: LayoutRelation) -> LayoutConfigurable
    
    /// xAxis, yAxis
    @discardableResult
    func center(_ relation: LayoutRelation) -> LayoutConfigurable
    
    /// size
    @discardableResult
    func width(_ constant: CGFloat) -> LayoutConfigurable
    
    @discardableResult
    func height(_ constant: CGFloat) -> LayoutConfigurable
    
    @discardableResult
    func size(_ constant: CGFloat) -> LayoutConfigurable
    
    /// constant
    @discardableResult
    func inset(_ constant: CGFloat) -> LayoutConfigurable
}

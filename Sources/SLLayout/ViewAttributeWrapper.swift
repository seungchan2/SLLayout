import UIKit

public struct ViewAttributeWrapper {
    private let view: UIView
    
    public init(view: UIView) {
        self.view = view
    }
    
    /// xAxis
    public var leading: LayoutRelation {
        return .viewAttribute(view, .leading)
    }
    
    public var trailing: LayoutRelation {
        return .viewAttribute(view, .trailing)
    }
    
    public var centerX: LayoutRelation {
        return .viewAttribute(view, .centerX)
    }
    
    /// yAxis
    public var top: LayoutRelation {
        return .viewAttribute(view, .top)
    }
    
    public var bottom: LayoutRelation {
        return .viewAttribute(view, .bottom)
    }
    
    public var centerY: LayoutRelation {
        return .viewAttribute(view, .centerY)
    }
    
    /// size
    public var width: LayoutRelation {
        return .viewAttribute(view, .width)
    }
    
    public var height: LayoutRelation {
        return .viewAttribute(view, .height)
    }
}

import Foundation
import UIKit

public protocol ReusableViewType where Self: UIView {
  func prepareForReuse()
}

public protocol BackingViewMaker {
  associatedtype View : ReusableViewType
  static func makeBackedView() -> View
}

public final class WrapperCollectionViewCell<Maker: BackingViewMaker>: UICollectionViewCell {
  public let backed: Maker.View
  
  public override init(frame: CGRect) {
    let backingView = Maker.makeBackedView()
    self.backed = backingView
    super.init(frame: frame)
    self.contentView.addSubview(backingView)
    backingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    backingView.frame = bounds
  }
  
  public override func prepareForReuse() {
    backed.prepareForReuse()
  }
  
  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func update(_ closure: (Maker.View) -> Void) {
    closure(backed)
  }
}

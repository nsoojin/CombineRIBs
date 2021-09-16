import UIKit
import CombineRIBs

protocol ___VARIABLE_productName___PresentableListener: AnyObject {
  func presentableRemoved()
}

final class ___VARIABLE_productName___ViewController: UIViewController, ___VARIABLE_productName___Presentable, ___VARIABLE_productName___ViewControllable {

  weak var listener: ___VARIABLE_productName___PresentableListener?
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    if self.isBeingRemoved {
      self.listener?.presentableRemoved()
    }
  }
}

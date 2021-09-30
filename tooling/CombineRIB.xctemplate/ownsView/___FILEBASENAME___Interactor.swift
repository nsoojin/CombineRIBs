import CombineRIBs

protocol ___VARIABLE_productName___Routing: ViewableRouting {
  
}

protocol ___VARIABLE_productName___Presentable: Presentable {
  var listener: ___VARIABLE_productName___PresentableListener? { get set }
}

public protocol ___VARIABLE_productName___Listener: AnyObject {
  
}

protocol ___VARIABLE_productName___InteractorDependency {
  
}

final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable, ___VARIABLE_productName___PresentableListener {
  
  weak var router: ___VARIABLE_productName___Routing?
  weak var listener: ___VARIABLE_productName___Listener?
  
  private let dependency: ___VARIABLE_productName___InteractorDependency
  
  init(presenter: ___VARIABLE_productName___Presentable, dependency: ___VARIABLE_productName___InteractorDependency) {
    self.dependency = dependency
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  // MARK: - ___VARIABLE_productName___PresentableListener
  
  func presentableRemoved() {
    
  }
}

import CombineRIBs

protocol ___VARIABLE_productName___Interactable: Interactable {
  var router: ___VARIABLE_productName___Routing? { get set }
  var listener: ___VARIABLE_productName___Listener? { get set }
}

protocol ___VARIABLE_productName___RouterDependency {
  
}

final class ___VARIABLE_productName___Router: Router<___VARIABLE_productName___Interactable>, ___VARIABLE_productName___Routing {
  
  private let dependency: ___VARIABLE_productName___RouterDependency
  
  init(interactor: ___VARIABLE_productName___Interactable, viewController: ViewControllable, dependency: ___VARIABLE_productName___RouterDependency) {
    self.viewController = viewController
    self.dependency = dependency
    super.init(interactor: interactor)
    interactor.router = self
  }
  
  func cleanupViews() {
    
  }
  
  // MARK: - Private
  
  private let viewController: ViewControllable
}

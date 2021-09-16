import CombineRIBs

protocol ___VARIABLE_productName___Interactable: Interactable {
  var router: ___VARIABLE_productName___Routing? { get set }
  var listener: ___VARIABLE_productName___Listener? { get set }
}

protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
  
}

protocol ___VARIABLE_productName___RouterDependency {
  
}

final class ___VARIABLE_productName___Router: Router<___VARIABLE_productName___Interactable>, ___VARIABLE_productName___Routing {
  
  private let dependency: ___VARIABLE_productName___RouterDependency
  
  init(interactor: ___VARIABLE_productName___Interactable, viewController: ___VARIABLE_productName___ViewControllable, dependency: ___VARIABLE_productName___RouterParams) {
    self.viewController = viewController
    self.dependency = dependency
    super.init(interactor: interactor)
    interactor.router = self
  }
  
  func cleanupViews() {
    // TODO: Since this router does not own its view, it needs to cleanup the views
    // it may have added to the view hierarchy, when its interactor is deactivated.
  }
  
  // MARK: - Private
  
  private let viewController: ___VARIABLE_productName___ViewControllable
}

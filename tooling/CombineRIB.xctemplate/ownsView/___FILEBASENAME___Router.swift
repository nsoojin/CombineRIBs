import CombineRIBs

protocol ___VARIABLE_productName___Interactable: Interactable {
  var router: ___VARIABLE_productName___Routing? { get set }
  var listener: ___VARIABLE_productName___Listener? { get set }
}

protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
  
}

protocol ___VARIABLE_productName___RouterDependency {
  
}

final class ___VARIABLE_productName___Router: ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable>, ___VARIABLE_productName___Routing {
  
  private let dependency: ___VARIABLE_productName___RouterDependency
  
  init(interactor: ___VARIABLE_productName___Interactable, viewController: ___VARIABLE_productName___ViewControllable, dependency: ___VARIABLE_productName___RouterDependency) {
    self.dependency = dependency
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}

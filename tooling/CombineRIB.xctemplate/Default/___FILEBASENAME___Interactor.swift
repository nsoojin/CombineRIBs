import CombineRIBs

public protocol ___VARIABLE_productName___Routing: Routing {
  func cleanupViews()
}

public protocol ___VARIABLE_productName___Listener: AnyObject {
  
}

protocol ___VARIABLE_productName___InteractorDependency {
  
}

final class ___VARIABLE_productName___Interactor: Interactor, ___VARIABLE_productName___Interactable {
  
  weak var router: ___VARIABLE_productName___Routing?
  weak var listener: ___VARIABLE_productName___Listener?
  
  private let dependency: ___VARIABLE_productName___InteractorDependency
  
  init(dependency: ___VARIABLE_productName___InteractorDependency) {
    self.dependency = dependency
    super.init()
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    // TODO: Implement business logic here.
  }
  
  override func willResignActive() {
    super.willResignActive()
    
    router?.cleanupViews()
    // TODO: Pause any business logic.
  }
}

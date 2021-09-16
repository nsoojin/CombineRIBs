import XCTest

@testable import ___PROJECTNAME___

final class ___VARIABLE_productName___DependencyMock: ___VARIABLE_productName___Dependency {
  
}

final class ___VARIABLE_productName___ParentInteractorMock: ___VARIABLE_productName___Listener {
  
}

final class ___VARIABLE_productName___Tests: XCTestCase {
  
  private var dependency: ___VARIABLE_productName___DependencyMock!
  private var parentInteractor: ___VARIABLE_productName___ParentInteractorMock!
  private var router: ___VARIABLE_productName___Router!
  private var interactor: ___VARIABLE_productName___Interactor! { self.router.interactor as? ___VARIABLE_productName___Interactor }
  private var presenter: ___VARIABLE_productName___Presentable! { self.interactor.presenter }
  
  // TODO: declare other objects and mocks you need as private vars
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.dependency = ___VARIABLE_productName___DependencyMock()
    let builder = ___VARIABLE_productName___Builder(dependency: self.dependency)
    self.parentInteractor = ___VARIABLE_productName___ParentInteractorMock()
    self.router = builder.build(withListener: self.parentInteractor) as? ___VARIABLE_productName___Router
    
    // TODO: instantiate objects and mocks
  }
}

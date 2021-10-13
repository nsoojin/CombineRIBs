import CombineRIBs

public protocol ___VARIABLE_productName___Dependency: Dependency {
  // TODO: Make sure to convert the variable into lower-camelcase.
  var ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewControllable { get }
  // TODO: Declare the set of dependencies required by this RIB, but won't be
  // created by this RIB.
}

final class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___InteractorDependency, ___VARIABLE_productName___RouterDependency {
  
  // TODO: Make sure to convert the variable into lower-camelcase.
  fileprivate var ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewControllable {
    return self.dependency.___VARIABLE_productName___ViewController
  }
}

// MARK: - Builder

public protocol ___VARIABLE_productName___Buildable: Buildable {
  func build(withListener listener: ___VARIABLE_productName___Listener) -> Routing
}

public final class ___VARIABLE_productName___Builder: Builder<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___Buildable {
  
  public override init(dependency: ___VARIABLE_productName___Dependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: ___VARIABLE_productName___Listener) -> Routing {
    let component = ___VARIABLE_productName___Component(dependency: self.dependency)
    let interactor = ___VARIABLE_productName___Interactor(dependency: component)
    interactor.listener = listener
    return ___VARIABLE_productName___Router(interactor: interactor, viewController: component.___VARIABLE_productName___ViewController, dependency: component)
  }
}

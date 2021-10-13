import CombineRIBs

public protocol ___VARIABLE_productName___Dependency: Dependency {
  
}

final class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___InteractorDependency, ___VARIABLE_productName___RouterDependency {
  
}

// MARK: - Builder

public protocol ___VARIABLE_productName___Buildable: Buildable {
  func build(withListener listener: ___VARIABLE_productName___Listener) -> ViewableRouting
}

public final class ___VARIABLE_productName___Builder: Builder<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___Buildable {
  
  public override init(dependency: ___VARIABLE_productName___Dependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: ___VARIABLE_productName___Listener) -> ViewableRouting {
    let component = ___VARIABLE_productName___Component(dependency: self.dependency)
    let viewController = ___VARIABLE_productName___ViewController()
    let interactor = ___VARIABLE_productName___Interactor(presenter: viewController, dependency: component)
    interactor.listener = listener
    return ___VARIABLE_productName___Router(interactor: interactor, viewController: viewController, dependency: component)
  }
}

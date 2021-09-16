//
//  Copyright (c) 2017. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit

/// Basic interface between a `Router` and the UIKit `UIViewController`.
public protocol ViewControllable: AnyObject {

    var uiviewController: UIViewController { get }
}

/// Default implementation on `UIViewController` to conform to `ViewControllable` protocol
public extension ViewControllable where Self: UIViewController {

    var uiviewController: UIViewController {
        return self
    }
}

public extension ViewControllable {
    
    var ui: UIViewController { self.uiviewController }
    
    var isBeingRemoved: Bool {
        return self.ui.isBeingDismissed ||
            self.ui.isMovingFromParent ||
            (self.ui.navigationController?.isBeingDismissed == true)
    }
    
    func presentViewControllable(_ viewControllable: ViewControllable, animated: Bool, style: UIModalPresentationStyle? = nil, completion: (() -> Void)? = nil) {
        let presenting = self.ui
        let viewController = viewControllable.ui
        if let modalPresentationStyle = style {
            viewController.modalPresentationStyle = modalPresentationStyle
        }
        presenting.present(viewController, animated: animated, completion: completion)
    }
    
    func dismissViewControllableIfNeeded(_ viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)? = nil) {
        guard viewControllable.isBeingRemoved == false else { return }
        let viewController = viewControllable.ui
        guard let presenting = viewController.presentingViewController else { return }
        presenting.dismiss(animated: animated, completion: completion)
    }
    
    func pushViewControllable(_ viewControllable: ViewControllable, animated: Bool) {
        guard let navigation = self.ui.navigationController else { return }
        let viewController = viewControllable.ui
        navigation.pushViewController(viewController, animated: animated)
    }
    
    func popViewControllableIfNeeded(_ viewControllable: ViewControllable, animated: Bool) {
        guard viewControllable.isBeingRemoved == false else { return }
        let viewController = viewControllable.ui
        guard let navigation = viewController.navigationController else { return }
        let viewControllerIndex = navigation.children.lastIndex(of: viewController)
        let targetViewControllerIndex = (viewControllerIndex ?? 0) - 1
        guard targetViewControllerIndex >= 0 else { return }
        let targetViewController = navigation.children[targetViewControllerIndex]
        navigation.popToViewController(targetViewController, animated: animated)
    }
}

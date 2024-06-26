import UIKit

import RxFlow

import Core
import Presentation

public class LoginFlow: Flow {
    
    public var root: Presentable {
        return rootViewController
    }
    
    private let rootViewController = BaseNavigationController()
    private let container = StepperDI.shared
    
    public init() {}

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? PiCKStep else { return .none }
        
        switch step {
            case .loginRequired:
                return navigateToLogin()
            case .mainRequired:
                return navigateToMain()
            default:
                return .none
        }
    }

    private func navigateToLogin() -> FlowContributors {
        let viewModel = container.loginViewModel
        let loginViewController = LoginViewController(
            viewModel: viewModel
        )
        self.rootViewController.pushViewController(loginViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: loginViewController,
            withNextStepper: loginViewController.viewModel
        ))
    }
    
    private func navigateToMain() -> FlowContributors {
        return .end(forwardToParentFlowWithStep: PiCKStep.mainRequired)
    }

}

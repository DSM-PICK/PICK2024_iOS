import UIKit

import RxSwift
import RxCocoa
import RxFlow

import Core
import DesignSystem
import Presentation

public class ProfileFlow: Flow {
    
    public var root: Presentable {
        return rootViewController
    }

    private let rootViewController: ProfileViewController
    private let container = StepperDI.shared
    
    public init() {
        self.rootViewController = ProfileViewController(
            viewModel: container.profileViewModel
        )
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? PiCKStep else { return .none }
        
        switch step {
            case .profileRequired:
                return navigateToProfile()
            case .logoutRequired:
                return .end(forwardToParentFlowWithStep: PiCKStep.onBoardingRequired)
            default:
                return .none
        }
    }
    
    private func navigateToProfile() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.viewModel
        ))
    }
    
}

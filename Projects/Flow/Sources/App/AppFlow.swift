import UIKit
import RxFlow
import Core

public class AppFlow: Flow {
    
    private var window: UIWindow
    
    public var root: RxFlow.Presentable {
        return window
    }
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? PickStep else { return .none }
        
        switch step {
            case .onBoardingRequired:
                return navigateToOnboarding()
            case .loginRequired:
                return navigateToLogin()
        }
    }
    
    private func navigateToOnboarding() -> FlowContributors {
        let onboardingFlow = OnboardingFlow()
        
        Flows.use(onboardingFlow, when: .created) { [weak self] root in
            self?.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: onboardingFlow,
            withNextStepper: OneStepper(withSingleStep: PickStep.onBoardingRequired)
        ))
    }
    
    private func navigateToLogin() -> FlowContributors {
        let authFlow = AuthFlow()
        Flows.use(authFlow, when: .created) { [weak self] root in
            self?.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: authFlow,
            withNextStepper: OneStepper(withSingleStep: PickStep.loginRequired)
        ))
    }
    
}

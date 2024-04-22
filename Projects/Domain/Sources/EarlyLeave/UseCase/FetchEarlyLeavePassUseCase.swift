import Foundation

import RxSwift

public class FetchEarlyLeavePassUseCase {
    
    let repository: EarlyLeaveRepository
    
    public init(repository: EarlyLeaveRepository) {
        self.repository = repository
    }
    
    public func execute() -> Single<EarlyLeavePassEntity> {
        return repository.fetchEarlyLeavePass()
    }
    
}
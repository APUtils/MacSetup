//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import AnimatableStackView
import APExtensions
import APPropertyWrappers
import Foundation
import RxCocoa
import RxSwift

final class ___FILEBASENAME___: ClassName {
    
    // ******************************* MARK: - Properties
    
    @BehaviorRelayProjected
    fileprivate var vms: [AnimatableView_ViewModel] = []
    
    // ******************************* MARK: - Initialization and Setup
    
    init() {
        
    }
    
    deinit {
        logDebug("Deinit \(className)")
    }
}

// ******************************* MARK: - Rx

extension ___FILEBASENAME___: ReactiveCompatible {}

extension Reactive where Base == ___FILEBASENAME___ {
    var vms: Driver<[AnimatableView_ViewModel]> {
        base.$vms.asDriver()
    }
}

//
//  AdditionIntentHandler.swift
//  SiriShortcutIntent
//
//  Created by Javier Azuara on 2/13/22.
//

import Foundation

class AdditionIntentHandler: NSObject, AdditionIntentIntentHandling {
    
    func handle(intent: AdditionIntentIntent, completion: @escaping (AdditionIntentIntentResponse) -> Void) {
        
        guard let first = intent.first, let second = intent.second else {
            completion(AdditionIntentIntentResponse(code: AdditionIntentIntentResponseCode.failure, userActivity: nil))
            return;
        }
        
        let result = first.intValue + second.intValue
        
        let number = NSNumber(integerLiteral: result)
        completion(AdditionIntentIntentResponse.success(result: number))
    }
    
//    func handle(intent: AdditionIntentIntent) async -> AdditionIntentIntentResponse {
//    }
    
    func resolveFirst(for intent: AdditionIntentIntent, with completion: @escaping (AdditionIntentFirstResolutionResult) -> Void) {
        
        guard let number = intent.first else {
            completion(AdditionIntentFirstResolutionResult.unsupported(forReason: .invalidNumber))
            return
        }
        
        if number.intValue < 0 {
            completion(AdditionIntentFirstResolutionResult.unsupported(forReason: .negativeNumbersNotSupported))
            return
        } else if number.intValue > 100 {
            completion(AdditionIntentFirstResolutionResult.unsupported(forReason: .greaterThanMaximumValue))
            return
        } else if number.intValue == 1 {
            completion(AdditionIntentFirstResolutionResult.unsupported(forReason: .lessThanMinimumValue))
            return
        }
        
        completion(AdditionIntentFirstResolutionResult.success(with: number.doubleValue))
    }
    
//    func resolveFirst(for intent: AdditionIntentIntent) async -> AdditionIntentFirstResolutionResult {
//        <#code#>
//    }
    
    func resolveSecond(for intent: AdditionIntentIntent, with completion: @escaping (AdditionIntentSecondResolutionResult) -> Void) {
        guard let number = intent.second else {
            completion(AdditionIntentSecondResolutionResult.unsupported(forReason: .invalidNumber))
            return
        }
        
        if number.intValue < 0 {
            completion(AdditionIntentSecondResolutionResult.unsupported(forReason: .negativeNumbersNotSupported))
            return
        } else if number.intValue > 100 {
            completion(AdditionIntentSecondResolutionResult.unsupported(forReason: .greaterThanMaximumValue))
            return
        } else if number.intValue == 1 {
            completion(AdditionIntentSecondResolutionResult.unsupported(forReason: .lessThanMinimumValue))
            return
        }
        
        completion(AdditionIntentSecondResolutionResult.success(with: number.doubleValue))
    }
    
//    func resolveSecond(for intent: AdditionIntentIntent) async -> AdditionIntentSecondResolutionResult {
//        <#code#>
//    }
    

}

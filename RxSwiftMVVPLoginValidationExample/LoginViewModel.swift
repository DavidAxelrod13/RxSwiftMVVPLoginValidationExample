//
//  ViewModel.swift
//  RxSwiftMVVPLoginValidationExample
//
//  Created by David on 27/02/2018.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel {
    
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable(), resultSelector: { (email, password) -> Bool in
            return email.count >= 3 && password.count >= 3
        })
    }
}

//
//  Observable.swift
//  MVVM_TextField
//
//  Created by 도헌 on 2022/11/02.
//

import Foundation

class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) { // 연동
        closure(value)
        listener = closure
    }
}

//
//  textFieldViewModel.swift
//  MVVM_TextField
//
//  Created by 도헌 on 2022/11/02.
//

import Foundation
// VM에는 UIKit 임포트 하지 않기

class textFieldViewModel {
    
    var price: Observable<String> = Observable("")
    
    func changePriceFormat(price: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let deletedCommaPrice = price.replacingOccurrences(of: ",", with: "")
        
        guard let formatedPrice = Int(deletedCommaPrice) else { return }
        let result = numberFormatter.string(for: formatedPrice)!
        
        self.price.value = result
    }
}

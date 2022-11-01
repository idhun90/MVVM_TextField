//
//  ViewController.swift
//  MVVM_TextField
//
//  Created by 도헌 on 2022/11/02.
//

// MVVM_텍스트필드_실시간 콤마 구현
// 출시 앱 아이템 추가화면에 적용하면 좋을 것 같음

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    let textField: UITextField = {
       let view = UITextField()
        view.placeholder = "실시간 콤마 구현"
        view.borderStyle = .roundedRect
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemFill.cgColor
        
        return view
    }()
    
    // VM 객체 가져오기 (price)
    var viewModel = textFieldViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(textField)
        setupConstraints()
        
        // V <-> VM 데이터 연동
        // 초기값 및 변화값
        viewModel.price.bind { price in
            self.textField.text = price
        }
        
        // 텍스트필드 실시간 값 변화 체크
        self.textField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingChanged)
    }
    
    @objc func textFieldValueChanged() {
        // 입력값을 받아 VM으로 전달 -> VM에서 콤마 추가하는 연산 진행
        // VM에 연산을 맡을 메소드 생성
        guard let text = textField.text else { return } // 텍스트필드는 nil 값이 될 수 없음, 그저 옵셔널을 제거하기 위함
        self.viewModel.changePriceFormat(price: text)
        
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints {
            let space = 20
            $0.top.leading.equalTo(self.view.safeAreaLayoutGuide).offset(space)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-space)
            $0.height.equalTo(44)
        }
    }
}


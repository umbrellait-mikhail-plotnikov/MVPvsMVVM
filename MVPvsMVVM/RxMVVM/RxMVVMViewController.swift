//
//  RxMVVMViewController.swift
//  MVPvsMVVM
//
//  Created by Plotnikov Mikhail on 29.06.2022.
//

import UIKit
import RxSwift

class RxMVVMViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    private let viewModel = RxViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindUI()
    }

    private func bindUI() {
        viewModel.text
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.date
            .bind(to: dateLabel.rx.text)
            .disposed(by: disposeBag)

        textField.rx.text
            .distinctUntilChanged()
            .bind(to: viewModel.inputText)
            .disposed(by: disposeBag)
    }
}



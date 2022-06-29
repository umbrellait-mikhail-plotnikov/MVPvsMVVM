//
//  RxViewModel.swift
//  MVPvsMVVM
//
//  Created by Plotnikov Mikhail on 29.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class RxViewModel {
    var actualModel = PublishSubject<MVVMModel>()
    var text = PublishSubject<String>()
    var date = PublishSubject<String>()
    var inputText = PublishSubject<String?>()

    private let disposeBag = DisposeBag()

    init() {
        bindData()

        self.actualModel.onNext(MVVMModel(text: ""))
    }

    private func bindData() {
        actualModel.map { [weak self] in
                guard let self = self else { return "" }
                return "Date from RxViewModel: \(self.dateFormatter.string(from: $0.time))"
            }
            .bind(to: date)
            .disposed(by: disposeBag)

        actualModel.map {
                return "String from RxViewModel: \($0.text)"
            }
            .bind(to: text)
            .disposed(by: disposeBag)

        inputText.subscribe(onNext: { [weak self] in
                self?.actualModel.onNext(MVVMModel(text: $0 ?? ""))
            })
            .disposed(by: disposeBag)
    }

    private let dateFormatter: DateFormatter = {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "HH:mm:ss"

        return dateFormmater
    }()
}

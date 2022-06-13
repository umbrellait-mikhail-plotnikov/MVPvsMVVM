//
//  ViewController.swift
//  MVPvsMVVM
//
//  Created by Plotnikov Mikhail on 13.06.2022.
//

import Foundation
import UIKit

class MVVMViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBAction func textFieldDidChange(_ sender: Any) {
        guard let text = textField.text else { return }

        viewModel?.text = text
    }

    private var viewModel: ViewModel? {
        didSet {
            viewModel?.bindTextLabel = { [weak self] text in
                self?.textLabel.text = text
            }
            viewModel?.bindDateLabel = { [weak self] date in
                self?.dateLabel.text = date
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel()
        viewModel?.setActualModel(text: "")
        viewModel?.startRefresh()
    }
}

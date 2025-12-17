//
//  ViewController.swift
//  Counter
//
//  Created by ted on 15.12.2025.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var counterButtonUp: UIButton!
    @IBOutlet private weak var counterButtonDown: UIButton!
    @IBOutlet private weak var counterButtonReset: UIButton!
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        historyTextView.text = "История изменений:\n"
        historyTextView.layer.cornerRadius = 15
        historyTextView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        
        counterLabel.layer.cornerRadius = 15
        counterLabel.layer.masksToBounds = true
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        return formatter
    }()
    
    private func addHistoryText(_ message: String) {
        let timestamp = dateFormatter.string(from: Date())
        
        historyTextView.text += "[\(timestamp)]: \(message)\n"
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count - 1, length: 0))
    }
    
    @IBAction private func counterButtonUpDidTap(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        addHistoryText("значение изменено на +1")
    }
    
    @IBAction private func counterButtonDownDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateCounterLabel()
            addHistoryText("значение изменено на -1")
        } else {
            addHistoryText("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func counterButtonResetDidTap(_ sender: Any) {
        counter = 0
        updateCounterLabel()
        addHistoryText("значение сброшено")
    }
}

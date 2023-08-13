//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var emojiResultLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)

        guard let animal = getMostFrequentAnimal() else { return }
        emojiResultLabel.text = "Вы - \(animal.rawValue)"
        resultLabel.text = animal.definition
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getMostFrequentAnimal() -> Animal? {
        var result: Animal?
        var dictionary: [Animal: Int] = [:]
        var max = 0
        
        answersChosen.forEach() { (element) in
            if let count = dictionary[element.animal] {
                dictionary[element.animal] = count + 1
            } else {
                dictionary[element.animal] = 1
            }
        }
        
        for (key, value) in dictionary {
            if value > max {
                max = value
                result = key
            }
        }
        
        return result
    }
}

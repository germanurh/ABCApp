//
//  LeaernHowToCountViewController.swift
//  ABCproject
//
//  Created by Герман Юрченко on 20.03.21.
//

import UIKit

class LearnHowToCountViewController: UIViewController {
    
    //коллекция аутлетов кнопок
    @IBOutlet var allBtns: [UIButton]! {
        didSet{
            for buttons in allBtns {
                for item in 0...24 {
                    if buttons.tag == item {
                        buttons.setTitleColor(UIColor.systemBlue, for: .normal)
                        buttons.layer.borderWidth = 5
                        buttons.layer.borderColor = UIColor.systemBlue.cgColor
                        buttons.titleLabel?.font = .systemFont(ofSize: 40)
                        buttons.setTitle("\(buttons.tag)", for: .normal)
                        buttons.layer.shadowRadius = 10
                        buttons.layer.shadowOffset = CGSize(width: 3, height: 3)
                        buttons.layer.shadowColor = UIColor.systemBlue.cgColor
                        buttons.layer.shadowOpacity = 0.7
                        buttons.layer.cornerRadius = 18
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //переход на другой экран по нажатию определенной кнопки
    @IBAction func buttonsToLevelsVC(_ sender: UIButton) {
        for openVC in 1...24 {
            if sender.tag == openVC {
                let storyBoard : UIStoryboard = UIStoryboard(name: "LevelsViewController", bundle:nil)
                let LevelsViewController = storyBoard.instantiateViewController(withIdentifier: "LevelsViewController") as! LevelsViewController
                LevelsViewController.modalPresentationStyle = .fullScreen
                self.present(LevelsViewController, animated:true, completion:nil)
            
                var openedViewController = openVC
                LevelsViewController.upperLevelLabel.text = "Уровень \(openedViewController)"
                
                
                if openedViewController == 1 {
                    LevelsViewController.exampleImageView.image = UIImage(named: "Level1")
//                  условия в примере 2+2=4
                    LevelsViewController.firstLabelInExample.text = "2"
                    LevelsViewController.symbolInExample.text = "+"
                    LevelsViewController.answerInExample.text = "4"
                    
//                  выбрать числа для ответа
                    LevelsViewController.oneButtonLabel.text = "1"
                    LevelsViewController.twoButtonLabel.text = "3"
                    LevelsViewController.threeButtonLabel.text = "4"
                    LevelsViewController.rightAnswerButtonLabel.text = "2"
                    
                    
                } else if openedViewController == 2 {
                    LevelsViewController.exampleImageView.image = UIImage(named: "Level2")
//                  условия в примере 3+3=6
                    LevelsViewController.firstLabelInExample.text = "3"
                    LevelsViewController.symbolInExample.text = "+"
                    LevelsViewController.answerInExample.text = "6"
                    
//                  выбрать числа для ответа
                    LevelsViewController.oneButtonLabel.text = "4"
                    LevelsViewController.twoButtonLabel.text = "7"
                    LevelsViewController.threeButtonLabel.text = "2"
                    LevelsViewController.rightAnswerButtonLabel.text = "3"
                } else if openedViewController == 3 {
                    LevelsViewController.exampleImageView.image = UIImage(named: "Level3")
//                  условия в примере 2+5=7
                    LevelsViewController.firstLabelInExample.text = "2"
                    LevelsViewController.symbolInExample.text = "+"
                    LevelsViewController.answerInExample.text = "7"
                    
//                  выбрать числа для ответа
                    LevelsViewController.oneButtonLabel.text = "6"
                    LevelsViewController.twoButtonLabel.text = "1"
                    LevelsViewController.threeButtonLabel.text = "4"
                    LevelsViewController.rightAnswerButtonLabel.text = "5"
                }
            }
        }
    }
    
//возврат на предыдущий экран
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

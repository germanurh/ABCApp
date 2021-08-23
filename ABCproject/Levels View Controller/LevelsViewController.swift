//
//  LevelsViewController.swift
//  ABCproject
//
//  Created by Герман Юрченко on 21.03.21.
//

import UIKit

class LevelsViewController: UIViewController {
//    экран для подставления чисел для обучающих примеров (пример: 2 + _ = 4)
    @IBOutlet weak var upperLevelLabel: UILabel!
    @IBOutlet weak var exampleImageView: UIImageView!
    
    @IBOutlet weak var firstLabelInExample: UILabel!
    @IBOutlet weak var symbolInExample: UILabel!
    @IBOutlet weak var answerInExample: UILabel!
    

    @IBOutlet weak var oneButtonLabel: UILabel!
    
    @IBOutlet weak var twoButtonLabel: UILabel!
    @IBOutlet weak var rightAnswerButtonLabel: UILabel!
    @IBOutlet weak var threeButtonLabel: UILabel!
    @IBOutlet weak var viewWhite: UIView!
    @IBOutlet weak var intersectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rightAnswerButtonLabelAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y)
        
        sender.setTranslation(.zero, in: view)
        
        if self.rightAnswerButtonLabel.frame.intersects(self.intersectView.frame) == true {
                rightAnswerButtonLabel.frame = CGRect(x: 166, y: 48, width: rightAnswerButtonLabel.frame.width, height: rightAnswerButtonLabel.frame.height)
                rightAnswerButtonLabel.isUserInteractionEnabled = false
        sender.state = .ended
        } else {
            if sender.state == .ended {
                rightAnswerButtonLabel.frame = CGRect(x: 214, y: 188, width: twoButtonLabel.frame.width, height: twoButtonLabel.frame.height)
            }
        }
    }
    
    @IBAction func oneButtonLabelAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y)
        
        sender.setTranslation(.zero, in: view)
        
        if self.oneButtonLabel.frame.intersects(self.intersectView.frame) == true {
                oneButtonLabel.frame = CGRect(x: 20, y: 188, width: oneButtonLabel.frame.width, height: oneButtonLabel.frame.height)
            sender.state = .ended
        } else if sender.state == .ended {
                oneButtonLabel.frame = CGRect(x: 20, y: 188, width: twoButtonLabel.frame.width, height: oneButtonLabel.frame.height)
        }
    }
    
    @IBAction func twoButtonLabelAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y)
        
        sender.setTranslation(.zero, in: view)
        
        if self.twoButtonLabel.frame.intersects(self.intersectView.frame) == true {
            twoButtonLabel.frame = CGRect(x: 119, y: 188, width: twoButtonLabel.frame.width, height: twoButtonLabel.frame.height)
            sender.state = .ended
        } else if sender.state == .ended {
            twoButtonLabel.frame = CGRect(x: 119, y: 188, width: twoButtonLabel.frame.width, height: twoButtonLabel.frame.height)
        }
    }
    
    
    @IBAction func threeButtonLabelAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y)
        
        sender.setTranslation(.zero, in: view)
        
        if self.threeButtonLabel.frame.intersects(self.intersectView.frame) == true {
            threeButtonLabel.frame = CGRect(x: 305, y: 188, width: threeButtonLabel.frame.width, height: threeButtonLabel.frame.height)
            sender.state = .ended
        } else if sender.state == .ended {
            threeButtonLabel.frame = CGRect(x: 305, y: 188, width: threeButtonLabel.frame.width, height: threeButtonLabel.frame.height)
        }
    }
}





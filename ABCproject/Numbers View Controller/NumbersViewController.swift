//
//  NumbersViewController.swift
//  ABCproject
//
//  Created by Герман Юрченко on 26.03.21.
//

import UIKit

class NumbersViewController: UIViewController {
    
    var numberInNumbersVC = 0
    var vc = ViewController()

    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var imageViewOutletForCatsPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberTapped(_ sender: UITapGestureRecognizer) {
        vc.soundPlayer("n\(numberInNumbersVC)")
    }
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func swipeOnView(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            goesRight()
            vc.soundPlayer("n\(numberInNumbersVC)")
        case .right:
            goesLeft()
            vc.soundPlayer("n\(numberInNumbersVC)")
        default:
            return
        }
    }
    @IBAction func swipeOnImageView(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left :
            goesRight()
            vc.soundPlayer("n\(numberInNumbersVC)")
        case .right:
            goesLeft()
            vc.soundPlayer("n\(numberInNumbersVC)")
        default:
            return
        }
    }
    @IBAction func btnToRight(_ sender: UIButton) {
        goesRight()
        vc.soundPlayer("n\(numberInNumbersVC)")
    }
    @IBAction func btnToLeft(_ sender: UIButton) {
        goesLeft()
        vc.soundPlayer("n\(numberInNumbersVC)")
    }
    
    func goesRight() {
        numberInNumbersVC += 1
        
        if numberInNumbersVC == 0 {
            numberInNumbersVC = 10
        } else if numberInNumbersVC == 10 {
            numberInNumbersVC = 1
        }
        imageViewOutlet.image = UIImage(named: "N\(numberInNumbersVC)")
        imageViewOutletForCatsPicture.image = UIImage(named: "cat\(numberInNumbersVC)")
    }
    
    func goesLeft() {
        numberInNumbersVC -= 1
        
        if numberInNumbersVC ==  0 {
            numberInNumbersVC = 9
        } else if numberInNumbersVC == 10 {
            numberInNumbersVC = 1
        }
        imageViewOutlet.image = UIImage(named: "N\(numberInNumbersVC)")
        imageViewOutletForCatsPicture.image = UIImage(named: "cat\(numberInNumbersVC)")
    }
    
}

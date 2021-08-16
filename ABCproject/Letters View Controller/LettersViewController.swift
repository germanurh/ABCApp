//
//  LettersViewController.swift
//  ABCproject
//
//  Created by Герман Юрченко on 15.03.21.
//

import UIKit

class LettersViewController: UIViewController {
    
    let vc = ViewController()
    var numberInLettersVC = 0 
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var imageOutletLeft: UIImageView!
    @IBOutlet weak var imageOutletRight: UIImageView!
    @IBOutlet weak var imageOutletCenter: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rightSwipeGestureAction(_ sender: UISwipeGestureRecognizer) {
        goesLeft()
        vc.soundPlayer("A\(numberInLettersVC)")
    }
    
    @IBAction func leftSwipeGestureAction(_ sender: UISwipeGestureRecognizer) {
        goesRight()
        vc.soundPlayer("A\(numberInLettersVC)")
    }
    @IBAction func btnToRight(_ sender: UIButton) {
        goesRight()
        vc.soundPlayer("A\(numberInLettersVC)")
       
    }
    @IBAction func btnToLeft(_ sender: UIButton) {
        goesLeft()
        vc.soundPlayer("A\(numberInLettersVC)")
    }
    
    @IBAction func letterTapped(_ sender: UITapGestureRecognizer) {
        vc.soundPlayer("A\(numberInLettersVC)")
    }
    @IBAction func pictureLeftAction(_ sender: UITapGestureRecognizer) {
        vc.soundPlayer("AI\(numberInLettersVC)1")
        
       
    }
    @IBAction func pictureCentralAction(_ sender: UITapGestureRecognizer) {
        vc.soundPlayer("AI\(numberInLettersVC)3")
        
    }
    @IBAction func pictureRightAction(_ sender: UITapGestureRecognizer) {
        vc.soundPlayer("AI\(numberInLettersVC)2")
    }
    
    func goesRight() {
        numberInLettersVC += 1
        
        if numberInLettersVC == 0 {
            numberInLettersVC = 33
        } else if numberInLettersVC == 34 {
            numberInLettersVC = 1
        }
        imageViewOutlet.image = UIImage(named: "L\(numberInLettersVC)")
        imageOutletLeft.image = UIImage(named: "P\(numberInLettersVC)1")
        imageOutletCenter.image = UIImage(named: "P\(numberInLettersVC)2")
        imageOutletRight.image = UIImage(named: "P\(numberInLettersVC)3")
    }
    
    func goesLeft() {
        numberInLettersVC -= 1
        
        if numberInLettersVC == 0 {
            numberInLettersVC = 33
        } else if numberInLettersVC == 34 {
            numberInLettersVC = 1
        }
        imageViewOutlet.image = UIImage(named: "L\(numberInLettersVC)")
        imageOutletLeft.image = UIImage(named: "P\(numberInLettersVC)1")
        imageOutletCenter.image = UIImage(named: "P\(numberInLettersVC)2")
        imageOutletRight.image = UIImage(named: "P\(numberInLettersVC)3")
    }
}

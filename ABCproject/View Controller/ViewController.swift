//
//  ViewController.swift
//  ABCproject
//
//  Created by Герман Юрченко on 14.03.21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var numberOfPicture : Int = 0
    
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var numbersView: UIView!
    @IBOutlet weak var lettersView: UIView!
    // аутлет и сразу присваиваем настройки через didSet
    @IBOutlet weak var btnLearnHowToCount: UIButton! {
        didSet{
            let borderWidth:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
            borderWidth.fromValue = 0
            borderWidth.toValue = 3
            borderWidth.duration = 1
            btnLearnHowToCount.layer.borderWidth = 0.9
            btnLearnHowToCount.layer.borderColor = UIColor.white.cgColor
            btnLearnHowToCount.layer.add(borderWidth, forKey: "Width")
            btnLearnHowToCount.layer.borderWidth = 0.0
//            self.btnLearnHowToCount.backgroundColor = .systemBlue
            self.btnLearnHowToCount.layer.cornerRadius = 10
            self.btnLearnHowToCount.layer.shadowOffset = CGSize(width: 5, height: 5)
            self.btnLearnHowToCount.layer.shadowOpacity = 0.7
            self.btnLearnHowToCount.layer.shadowRadius = 16
        }
    }
    // аутлет и сразу присваиваем настройки через didSet
    @IBOutlet weak var btnLearnHowToCountTwo: UIButton! {
        didSet{
            let borderWidth:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
            borderWidth.fromValue = 0
            borderWidth.toValue = 3
            borderWidth.duration = 1
            btnLearnHowToCountTwo.layer.borderWidth = 0.9
            btnLearnHowToCountTwo.layer.borderColor = UIColor.white.cgColor
            btnLearnHowToCountTwo.layer.add(borderWidth, forKey: "Width")
            btnLearnHowToCountTwo.layer.borderWidth = 0.0
//            self.btnLearnHowToCountTwo.backgroundColor = .systemBlue
            self.btnLearnHowToCountTwo.layer.cornerRadius = 10
            self.btnLearnHowToCountTwo.layer.shadowOffset = CGSize(width: 5, height: 5)
            self.btnLearnHowToCountTwo.layer.shadowOpacity = 0.7
            self.btnLearnHowToCountTwo.layer.shadowRadius = 16
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // экшн нажатий кнопок с буквами
    @IBAction func lettersButtonsAction(_ sender: UIButton) {
        numberOfPicture = sender.tag
        
        for item in 1...33 {
            if item == sender.tag {
                segueToLetterVC()
                soundPlayer("A\(numberOfPicture)")
            }
        }
    }
    // экшн нажатий кнопок с цифрами
    @IBAction func numbersButtonsAction(_ sender: UIButton) {
        numberOfPicture = sender.tag
        
        for item in 0...9 {
            if item == sender.tag {
                segueToNumberVC()
                soundPlayer("n\(numberOfPicture)")
            }
        }
    }
    // переход по кнопке "Учимся считать"
    @IBAction func learnHowToCount(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "LearnHowToCountViewController", bundle:nil)
        let LearnHowToCountViewController = storyBoard.instantiateViewController(withIdentifier: "LearnHowToCountViewController") as! LearnHowToCountViewController
        LearnHowToCountViewController.modalPresentationStyle = .fullScreen
        self.present(LearnHowToCountViewController, animated:true, completion:nil)
    }
    //переключение экранов буквы/цифры
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            numbersView.isHidden = true
            lettersView.isHidden = false
            
        } else if sender.selectedSegmentIndex == 1 {
            lettersView.isHidden = true
            numbersView.isHidden = false
        }
    }
    //переход на экран с буквами
    func segueToLetterVC() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "LettersViewController", bundle: nil)
        let letterViewController = storyBoard.instantiateViewController(withIdentifier: "LettersViewController") as! LettersViewController
        letterViewController.modalPresentationStyle = .fullScreen
        letterViewController.numberInLettersVC = numberOfPicture
        self.present(letterViewController, animated: true, completion: nil)
        
        for item in 1...33 {
            if item == numberOfPicture {
                letterViewController.imageViewOutlet.image = UIImage(named: "L\(numberOfPicture)")
                letterViewController.imageOutletLeft.image = UIImage(named: "P\(numberOfPicture)1")
                letterViewController.imageOutletCenter.image = UIImage(named: "P\(numberOfPicture)2")
                letterViewController.imageOutletRight.image = UIImage(named: "P\(numberOfPicture)3")
            }
        }
    }
    //переход на экран с цифрами
    func segueToNumberVC() {
        let storyboard : UIStoryboard = UIStoryboard(name: "NumbersViewController", bundle: nil)
        let numberViewController = storyboard.instantiateViewController(withIdentifier: "NumbersViewController") as! NumbersViewController
        numberViewController.modalPresentationStyle = .fullScreen
        numberViewController.numberInNumbersVC = numberOfPicture
        self.present(numberViewController, animated: true, completion: nil)
        
        for item in 0...9 {
            if item == numberOfPicture {
                numberViewController.imageViewOutlet.image = UIImage(named: "N\(numberOfPicture)")
                numberViewController.imageViewOutletForCatsPicture.image = UIImage(named: "cat\(numberOfPicture)")
            }
        }
    }
    
    func soundPlayer(_ assetLetter : String){
        
        guard let audioData = NSDataAsset(name: assetLetter)?.data else {
            fatalError("Unable to find asset \(assetLetter)")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: audioData)
            audioPlayer.play()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}


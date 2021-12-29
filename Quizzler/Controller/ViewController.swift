//
//  ViewController.swift
//  Quizzler
//
//  Created by Joao daniel on 20/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ProgressTime: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRigth = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = (userGotItRigth) ? UIColor.green: UIColor.red
        
        quizBrain.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        ProgressTime.progress = quizBrain.getProgress()
       
        
    }
  
}


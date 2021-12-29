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
    
    let quizQuestions = [
        Question(text:"O sangue de uma lesma é verde.", answer:"Verdadeiro"),
        Question(text:"Aproximadamente um quarto dos ossos humanos estão nos pés.", answer:"Verdadeiro"),
        Question(text:"A área de superfície total de dois pulmões humanos é de aproximadamente 70 metros quadrados.", answer:"Verdadeiro"),
        Question(text:"Em Londres, Reino Unido, se por acaso você morrer na Câmara do Parlamento, você tem direito técnico a um funeral de estado, porque o prédio é considerado um lugar muito sagrado.", answer:"Falso"),
        Question(text:"É ilegal fazer xixi no oceano em Portugal.", answer:"Verdadeiro"),
        Question(text:"Você pode conduzir uma vaca escada abaixo, mas não escada acima.", answer:"Falso"),
        Question(text:"O Google era originalmente chamado de 'Backrub'.", answer:"Verdadeiro"),
        Question(text:"O som mais alto produzido por qualquer animal é de 188 decibéis. Esse animal é o elefante africano.", answer:"Verdadeiro"),
        Question(text:"Nenhum pedaço de papel quadrado seco pode ser dobrado ao meio mais de 7 vezes.", answer:"Falso"),
        Question(text:"O chocolate afeta o coração e o sistema nervoso de um cão; alguns gramas são suficientes para matar um cão pequeno.", answer:"Verdadeiro")
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quizQuestions[questionNumber].answer
        
        sender.backgroundColor = (userAnswer == actualAnswer) ? UIColor.green: UIColor.red
        
        
        if questionNumber + 1 < quizQuestions.count{
            questionNumber += 1
        } else{
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizQuestions[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        ProgressTime.progress = Float(questionNumber + 1) / Float(quizQuestions.count)
    }
  
}


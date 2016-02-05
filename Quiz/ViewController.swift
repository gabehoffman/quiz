//
//  ViewController.swift
//  Quiz
//
//  Created by Gabe Remote Office on 1/18/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let quiz = QuizModel()
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        quiz.next()
        nextQuestionLabel.text = quiz.currentQuestion
        answerLabel.text = "???"
        animateLabelTransitions()
    }
    
    @IBAction func swipeNextQuestion(sender: AnyObject) {
        quiz.next()
        nextQuestionLabel.text = quiz.currentQuestion
        answerLabel.text = "???"
    }
    
    @IBAction func swipePreviousQuestion(sender: AnyObject) {
        quiz.previous()
        nextQuestionLabel.text = quiz.currentQuestion
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        answerLabel.text = quiz.currentAnswer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestionLabel.text = quiz.questions[0]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenwidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenwidth
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateLabelTransitions() {
        view.layoutIfNeeded()
        
        // Animate the alpha
        // and the center X contraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
       
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.5,
            options: [.CurveLinear],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
        })
    }

}


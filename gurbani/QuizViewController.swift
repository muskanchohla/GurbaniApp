import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var ansStack: UIStackView!
    
    var questions = ["Who was the founder of Sikhism?",
                     "What is the holy book of Sikhism called?",
                     "Which city is considered the spiritual and cultural center of Sikhism?",
                     "What is the Sikh place of worship called?",
                     "What does the word 'Sikh' mean in Punjabi?"]
    var options = [["Guru Nanak Dev Ji", "Guru Gobind Singh JI", "Guru Arjan Dev ji", "Guru Tegh Bahadur ji"],
                    ["Bhagavad Gita", "Quran", "Guru Granth Sahib JI", "Bible"],
                   ["Amritsar Sahib", "Delhi", "Lahore", "Varanasi"],
                   [ "Temple", "Gurdwara", "Mosque", "Church"],
                   ["Disciple", "Warrior", "Teacher", "Seeker"]]
    var correctAnswers = [0, 2, 0, 1, 3]
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = questions[currentQuestionIndex]
        scoreLabel.text = "Score: \(score)"
        progressBar.progress = Float(currentQuestionIndex + 1) / Float(questions.count)
        
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(options[currentQuestionIndex][index], for: .normal)
            button.backgroundColor = .white
        }
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let selectedAnswerIndex = answerButtons.firstIndex(of: sender)!
        
        if selectedAnswerIndex == correctAnswers[currentQuestionIndex] {
            sender.backgroundColor = .green
            score += 1
        } else {
            sender.backgroundColor = .red
            // Highlight correct answer
            answerButtons[correctAnswers[currentQuestionIndex]].backgroundColor = .green
        }
        
        // Disable buttons after selection
        for button in answerButtons {
            button.isEnabled = false
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            updateUI()
            // Enable buttons for the new question
            for button in answerButtons {
                button.isEnabled = true
            }
        } else {
            // End of quiz, display final score
            questionLabel.text = "Quiz Complete!"
            scoreLabel.text = "Final Score: \(score)/\(questions.count)"
            nextButton.setTitle("Final", for: .normal)
            nextButton.isEnabled = false
            ansStack.isHidden = true
        }
    }
}


//
//  QuestionViewController.swift
//  Millionaire
//
//  Created by ddd on 18.08.2022.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var button50persent: UIButton!
    @IBOutlet weak var buttonHall: UIButton!
    @IBOutlet weak var buttonCall: UIButton!
    
    @IBOutlet weak var labelQuestionNumber: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelSumm: UILabel!
    @IBOutlet weak var buttonAnswer1: UIButton!
    @IBOutlet weak var buttonAnswer2: UIButton!
    @IBOutlet weak var buttonAnswer3: UIButton!
    @IBOutlet weak var buttonAnswer4: UIButton!
    var arrAnswerButton = [UIButton]() // массив кнопок с ответами
    var arrQuestionNumberAndSumm = [Int]() //массив номера вопроса и суммы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Настройка рисунков для кнопок "Звонок другу", "50/50", "Помощь зала" **********************************
        button50persent.setBackgroundImage( UIImage(named: "Advice-50"), for: .normal)
        button50persent.layoutIfNeeded()
        button50persent.subviews.first?.contentMode = .scaleAspectFit
        
        buttonHall.setBackgroundImage( UIImage(named: "Advice-hall"), for: .normal)
        buttonHall.layoutIfNeeded()
        buttonHall.subviews.first?.contentMode = .scaleAspectFit
        
        buttonCall.setBackgroundImage( UIImage(named: "Advice-call"), for: .normal)
        buttonCall.layoutIfNeeded()
        buttonCall.subviews.first?.contentMode = .scaleAspectFit
        
        // вывод вопроса *******************************
        labelQuestion.text = getQuestion()
        // вывод номера вопроса и суммы ***************************
        arrQuestionNumberAndSumm = getQuestionNumberAndSumm()
        labelQuestionNumber.text = "Вопрос №" + String(arrQuestionNumberAndSumm[0])
        labelSumm.text = String(arrQuestionNumberAndSumm[1]) + " РУБ"
        
        // вывод 4-х ответов ***************************
        var arrAnswers = getArrAnswers() //массив ответов
        //создаем массив кнопок
        arrAnswerButton.append(contentsOf: [buttonAnswer1, buttonAnswer2, buttonAnswer3, buttonAnswer4])
        //сопоставляем случайный ответ каждой кнопке
        for button in arrAnswerButton {
            guard let rndAnswer = arrAnswers.randomElement() else {
                print("Error: there are no answers")
                return
            }
            let indexElementForRemove = arrAnswers.firstIndex(of: rndAnswer)
            arrAnswers.remove(at: indexElementForRemove!) // удаляем ответ, который уже внесли на кнопку
            button.setTitle(rndAnswer, for: .normal) // устанавливаем надпись на кнопке
        }
        
        // MARK: TODO - старт 30 секундного таймера, обновление LabelTimerToEnd, проигрывание музыки, после 30 сек - экран окончания игры
    }

    @IBAction func giveMyMoney(_ sender: UIButton) {
        // MARK: TODO(dmitrii_er) - сделать переход на экран окончания игры
    }
    
    @IBAction func buttonsAnswerPressed(_ sender: UIButton) {
        // MARK: TODO(dmitrii_er) - сделать начисление денег и переход на экран, который показывает все вопросы
        let correctAnswer = getCorrectAnswer(questionNumber: arrQuestionNumberAndSumm[0])
        if sender.title(for: .normal) == correctAnswer {
            // верный ответ
        }
        else {
            // неверный ответ
        }
    }
    
    
    @IBAction func adviceButtonPressed(_ sender: UIButton) {
        if sender.tag == 1 { //50:50 нажата
            
        } else if sender.tag == 2 { //помощь зала
            
        } else if sender.tag == 3 { // звонок другу
            
        }
        else {
            print("Error: unknown tag for advice buttons")
        }
    }
    
    
    
    // Функция получение вопроса
    func getQuestion() -> String {
        // MARK: TODO(dmitrii_er) - сделать реальное получение вопроса
        return "Здесь будет вовзращаться вопрос"
    }
    
    // Функция получения массива ответов (для кнопок)
    func getArrAnswers() -> [String] {
        // MARK: TODO(dmitrii_er) - сделать реальное получение ответов
        return ["Answer1", "Answer2", "Answer3", "Answer4"]
        
    }
    
    // Функция получает правильный ответ
    func getCorrectAnswer(questionNumber: Int) -> String {
        //MARK: TODO(dmitrii_er) - сделать реальную функцию получения верного ответа
        return "Answer1"
    }
    
    // Функция получает массив, состоящий из номера вопроса и суммы
    func getQuestionNumberAndSumm() -> [Int] {
        //MARK: TODO(dmitrii_er) - сделать реальное возвращение номера вопроса, первый элемент - номер вопроса, второй элемент - сумма
        return [1, 100]
    }
    
    // MARK: TODO function answerButtonPress
    
    
    //MARK: TODO function helpForAnswerButtomPressed
    
    //MARK: TODO function geveMyMoney

}

//
//  main.swift
//  Practica
//
//  Created by Бектур Каримов on 25/1/23.
//

import Foundation

//
//Практическое задание: Используя инструменты ООП написать программу "Кто хочет стать миллионером" Как должна проходить игра. Программа должна запросить имя пользователя, вы вводите и начинаете играть до первого неправильного ответа, за каждый ответ начисляются очки. Результаты всех пользователей сохранять в массив историй. Вопросы и о тветы заполните сами. Реализация произвольная. Попытайтесь, это не итоговое тестирование, проверьте себя!




var history: [Player] = []


class Quastion{
    var rightAnswer: String
    var A: String
    var B: String
    var C: String
    var D: String
    var question: String
    init(rightAnswer: String, A: String, B: String, C: String, D: String, question: String) {
        self.rightAnswer = rightAnswer
        self.A = A
        self.B = B
        self.C = C
        self.D = D
        self.question = question
    }
}



class Player{
    var name: String
    var surname: String
    var answers: [String]
    var result: Int //сколько заработал за 1 игру
    init(name: String, surname: String, answers: [String], result: Int) {
        self.name = name
        self.surname = surname
        self.answers = answers
        self.result = result
    }
    func showInfo(){
        print("\(name), \(surname), \(answers), \(result)")
    }
}

var questions: [Quastion] = [
    Quastion(rightAnswer: "B", A: "A) Messi", B: "B) Ronaldo", C: "C) Neymar", D: "D) Mbappe", question: "Who is this player has a 5 Chempions League?"),
    Quastion(rightAnswer: "D", A: "A) 1992", B: "B) 1989", C: "C) 1995", D: "D) 1991", question: "When Kyrgyzstan become independent country?"),
    Quastion(rightAnswer: "C", A: "A) South America", B: "B) Europe", C: "C) North America", D: "D) Asia", question: "Where is Mexico?"),
    Quastion(rightAnswer: "A", A: "A) Sadyr Japarov", B: "B) Almazbek Atambaev", C: "C) Askar Akaev", D: "D) Kurmanbek Bakiev", question: "Who is president of Kyrgyzstan")
]

func whoWantsToBeABillionaire () {
    print("Welcome to game who want to be a Billioner")
    print("Type your name")
    var nameReadline = readLine()!
    print("Type your surname")
    var surnameReadline = readLine()!
    
    
    var money = 0
    
    let player = Player(name: nameReadline, surname: surnameReadline, answers: [], result: money)
    
    for question in questions {
        print(question.question)
        print(question.A)
        print(question.B)
        print(question.C)
        print(question.D)

        let userAnswer = readLine()!
        player.answers.append(userAnswer)
        
        if userAnswer == question.rightAnswer {
            money += 1000
            player.result = money
            //выводишь в консоль что правильный ответ
            continue
        } else {
            print("Incorrect!")
            //неправильный ответ, игра закончилась. Ваш результат: money
            //история всех игроков:
            history.append(player)
            print("Players history: ")
            for player in history {
                player.showInfo()
            }
            break
        }
    }
    
    //начать игру с другим игроком?
    print("Continue? (yes/no)")
    let answer = readLine()!
    
    if answer == "yes"{
        whoWantsToBeABillionaire()
    } else {
        print("Programm has finished!")
    }
}


whoWantsToBeABillionaire()



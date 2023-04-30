//
//  Animals.swift
//  HW16.MVP
//
//  Created by Admin on 24/04/2023.
//

import Foundation

class Animals {
    static let animals: [[Animal]] = [
        [
            Animal(image: "dogs", name: "Dogs"),
            Animal(image: "cats", name: "Cats"),
            Animal(image: "fishes", name: "Fishes"),
            Animal(image: "birds", name: "Birds")
        ],
        [
            Animal(image: "dog", name: "Dog", description: "Хороший и добрый верный друг!", price: "100", age: 2, sex: "Male", color: "Black"),
            Animal(image: "cat", name: "Cat", description: "Очень красивый но ночью кусает за ноги :)", price: "49", age: 1, sex: "Male", color: "White"),
            Animal(image: "fish", name: "Fish", description: "Продаю потому-что кот сходит с ума :(", price: "5", age: 3, sex: "Female", color: "Yellow"),
            Animal(image: "bird", name: "Bird", description: "Иногда несет яйца.", price: "10", age: 1, sex: "Female", color: "Grey")
        ]
    ]
}


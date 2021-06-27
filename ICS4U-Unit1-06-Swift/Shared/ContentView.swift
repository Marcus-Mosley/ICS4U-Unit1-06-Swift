//
// ContentView.swift
// ICS4U-Unit1-06-Swift
//
// Created by Marcus A. Mosley on 2021-01-22
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var maxValue: String = ""
    @State private var showingAlert = false
    @State private var randomNumber = 0
    
    var body: some View {
        VStack {
            Text("The Random Number is \(String(randomNumber))")
                .font(.title)
            TextField("Enter a max value: ", text: $maxValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .keyboardType(.numberPad)
            Button(action: {
                if Int(maxValue) != nil && Int(maxValue)! > 0 {
                    
                    randomNumber = rollDie(Int(maxValue)!)
                } else {
                    showingAlert = true
                }
            }) {
                Text("Click Here")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"), dismissButton: .default(Text("Got It!")))
            }
        }
    }
    
    func rollDie(_ max: Int) -> Int{
        
        return Int.random(in: 0...max)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

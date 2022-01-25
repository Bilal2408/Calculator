//
//  ContentView.swift
//  Calculator_Bilal
//
//  Created by Bilal Gökpinar / BBS2H20A on 24.01.22.
//

import SwiftUI

enum AlleButtons: String { // CalcButton
    case eins = "1"
    case zwei = "2"
    case drei = "3"
    case vier = "4"
    case fünf = "5"
    case sechs = "6"
    case sieben = "7"
    case acht = "8"
    case neun = "9"
    case null = "0" // zero
    case addieren = "+"   // add
    case subtrahieren = "-"
    case dividieren = "÷"
    case multiplikation = "x"
    case gleich = "="   // equal
    case löschen = "AC"  // Clear
    case komma = "."
    case prozent = "%"
    case negativWert = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .addieren, .subtrahieren, .multiplikation, .dividieren, .gleich:
        return .orange
        case .löschen, .negativWert, .prozent:
            return Color (.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}


enum Operation {
    case addieren, subtrahieren, multiplikation, dividieren, gleich, none
}


struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[AlleButtons]] = [
        [.löschen, .negativWert, .prozent, .dividieren],
        [.sieben, .acht, .neun, .multiplikation],
        [.vier, .fünf, .sechs, .subtrahieren],
        [.eins, .zwei, .drei, .addieren],
        [.null, .komma, .gleich],
    ]
    

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // Text display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
                
                // Out Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func didTap(button: AlleButtons){
    
        switch button {
        case .addieren, .subtrahieren, .multiplikation, .dividieren, .gleich:
            if button == .addieren {
                self.currentOperation = .addieren
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtrahieren {
                self.currentOperation = .subtrahieren
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiplikation {
                self.currentOperation = .multiplikation
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .dividieren {
                self.currentOperation = .dividieren
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .gleich {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .addieren: self.value = "\(runningValue + currentValue)"
                case .subtrahieren: self.value = "\(runningValue - currentValue)"
                case .multiplikation: self.value = "\(runningValue * currentValue)"
                case .dividieren: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }

            if button != .gleich {
                self.value = "0"
            }
        case .löschen:
            self.value = "0"
        case .komma, .negativWert, .pr:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    
    
    
    
    

    func buttonWidth(item: AlleButtons) -> CGFloat {
        if item == .null {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    
    func buttonHeight(item: AlleButtons) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

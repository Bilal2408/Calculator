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
    case loschen = "AC"  // Clear
    case komma = ","
    case prozent = "%"
    case negativWert = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .addieren, .subtrahieren, .multiplikation, .dividieren, .gleich:
        return .orange
        case .loschen, .negativWert, .prozent:
            return Color (.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

struct ContentView: View {

    let buttons: [[AlleButtons]] = [
        [.loschen, .negativWert, .prozent, .dividieren],
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
                HStack {
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                
                              
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
    
    
    func buttonWidth(item: AlleButtons) -> CGFloat {
        if item == .null {
            return((UIScreen.main.bounds.width - (4*12)) / 4) *  2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    
    func buttonHeight()-> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
} // von der Content View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

  

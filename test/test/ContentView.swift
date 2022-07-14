//
//  ContentView.swift
//  test
//
//  Created by Macbook on 2022-07-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
       
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  ContentView.swift
//  My First App (Calculator)
//
//  Created by Macbook on 2022-07-10.
//

import SwiftUI
enum CalButtons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case decimal = "."
    case equal = "="
    case clear = "Clear"
      
    var butColor: Color{
        switch self {
        case .add, .subtract, .multiply, .divide:
            return.orange
        case .decimal, .equal:
            return Color(.lightGray)
        case .clear:
            return.white
        default:
            return Color.cyan
        }
    }
}
enum Operation {
    case add, subtract, multiply, divide, equal, none
    
}
struct ContentView: View {
    
    @State var value = "0"
    @State var currentOperation: Operation = .none
    // two dementional array for setting ap the values of buttons
    let buttons: [[CalButtons]]=[
        [.decimal, .zero, .equal, .add],
        [.seven, .eight, .nine, .subtract],
        [ .four, .five, .six, .multiply],
        [.three, .two, .one, .divide],
        [.clear]
    ]
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                //setting a text display
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }
                // .padding()
                // setting buttons on display
                ForEach (buttons, id: \.self) {row in
                    HStack (spacing: 14){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button : item)
                                
                            }, label: {
                                Text(item.rawValue)
                                    .frame(width: self.buttonWidth(item: item), height: 75)
                                    .font(.system(size: 28))
                                    .foregroundColor(.black)
                                    .background(item.butColor)
                                    .cornerRadius(40)
                        })
                    }
                }
                    //.padding()
            }
        }
           // .padding()
    }

    }
    // fuction for setting the width of button
    func buttonWidth (item: CalButtons) -> CGFloat{
        // case for making clear button wider
        if item == .clear {
            return (( UIScreen.main.bounds.width) - (4 * 12) / 4) * 2
        }
        return (UIScreen.main.bounds.width - ( 5*12))/4
    }
    // creating a function to perform an action on tapping buttons
    func didTap(button: CalButtons){
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                
            }
           else if button == .subtract {
                self.currentOperation = .subtract
            }
            else if button == .multiply {
                self.currentOperation = .multiply
            }
            else if button == .divide
            {
                self.currentOperation = .divide
            }
            else if button == .equal {
                self.currentOperation = .equal
            }
            break
        case .clear:
            self.value = "0"
        case .decimal:
          break
        default :
            let num = button.rawValue
            if self.value == "0" {
                value = num
            }
            else {
                self.value = "\(self.value)\(num)"
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

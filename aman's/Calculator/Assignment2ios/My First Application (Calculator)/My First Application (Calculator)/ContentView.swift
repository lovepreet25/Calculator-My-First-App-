//
//  ContentView.swift
//  My First Application (Calculator)
//
//  Created by Macbook on 2022-07-14.
//
import SwiftUI
import UIKit
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
    case cube = "x^3"
    case square = "x^2"
    case squareRoot = "√x"
    case log = "log"
    case Xpart = "1/x"
    case reminder = "%"
      // setting the colors for bottons
    var butColor: Color{
        switch self {
        case .add, .subtract, .multiply, .divide, .reminder, .square, .cube, .squareRoot, .log, .Xpart:
            return.orange
        
        case .clear, .equal:
            return.white
        default:
            return Color(.lightGray)
        }
    }
    
    
}

enum mathOperations {
   case add, subtract, multiply, divide, reminder , square, cube, squareRoot, log , Xpart , none
}

struct ContentView: View {
    @State var value = "0"
    @State var curtOperation: mathOperations = .none
    @ State var runningnum = 0
    
    // two dementional array for setting ap the values of buttons
    let buttons: [[CalButtons]]=[
        [.cube, .square, .zero, .reminder, .add], // adding additional functionals
        [.squareRoot,.seven, .eight, .nine, .subtract],
        [ .log, .four, .five, .six, .multiply],
        [.Xpart, .three, .two, .one, .divide, ],
        [.clear, .equal]
    ]
    var body: some View {
        ZStack{
            Spacer()
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
              Spacer()
                //setting a text display
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                 .padding()
                // setting buttons on display
                ForEach (buttons, id: \.self) {row in
                    HStack (spacing: 11){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                                
                                
                            }, label: {
                                Text(item.rawValue)
                                    .bold()
                                    .frame(width: self.buttonWidth(item: item), height:55)
                                    
                                    .font(.system(size: 28))
                                    .foregroundColor(.black)
                                    .background(item.butColor)
                                    .cornerRadius(40)
                        })
                    }
                }
                    
            }
        }
           .padding()
    }

    }
   // adding fuctionallity to the buttons
    func didTap (button: CalButtons){
        switch button {
        case .add, .subtract, .divide, .multiply,.reminder, .square, .cube, .squareRoot, .log, .Xpart, .equal:
            if button == .add {
                self.curtOperation = .add
                self.runningnum = Int (self.value) ?? 0
            }else if button == .subtract {
                self.curtOperation = .subtract
                self.runningnum = Int (self.value) ?? 0
            }else if button == .multiply{
                self.curtOperation = .multiply
                self.runningnum = Int (self.value) ?? 0
            }else if button == .divide {
                self.curtOperation = .divide
                self.runningnum = Int (self.value) ?? 0
            }else if button == .reminder{
                self.curtOperation = .reminder
                self.runningnum = Int (self.value) ?? 0
            }else if button == .square {
                self.curtOperation = .square
                self.runningnum = Int (self.value) ?? 0
            }else if button == .cube {
                self.curtOperation = .cube
                self.runningnum = Int (self.value) ?? 0
            }else if button == .squareRoot {
                self.curtOperation = .squareRoot
                self.runningnum = Int (self.value) ?? 0
            }else if button == .log {
                self.curtOperation = .log
                self.runningnum = Int (self.value) ?? 0
            }else if button == .Xpart {
                self.curtOperation = .Xpart
                self.runningnum = Int (self.value) ?? 0
            }else if button == .equal {
                let runningnum = self.runningnum
                let curtvalue = Int(self.value) ?? 0
                switch self.curtOperation {
                case .add:
                    self.value = "\(runningnum + curtvalue)"
                case .subtract:
                    self.value = "\(runningnum - curtvalue)"
                case .multiply:
                    self.value = "\(runningnum * curtvalue)"
                case .divide:
                    self.value = "\(runningnum / curtvalue)"
                case .reminder:
                    self.value =  "\(runningnum % curtvalue)"
                case .square :
                    self.value = "\(pow( Decimal(curtvalue), 2))"
                case .cube:
                    self.value = "\(pow( Decimal(curtvalue), 3))"
                case .squareRoot:
                    self.value = "\( sqrt(Double(curtvalue)))"
                case .log:
                    self.value = "\(log(Double(curtvalue)))"
                case .Xpart:
                    self.value = "\(Double(1 / ( curtvalue)))"
                case .none:
                    break
                    }
            }
            if button != .equal && button != .cube && button != .square && button != .squareRoot && button != .log && button != .Xpart {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        default:
            let num = button.rawValue
            if self.value == "0"{
                value = num
            }
            else {
                self.value = "\(self.value)\(num)"
            }
        }
            
        
    }
    // fuction for setting the width of button
    func buttonWidth (item: CalButtons) -> CGFloat{
        // case for making clear  and equal button wider
        if item == .clear{
            return (( UIScreen.main.bounds.width) - ((5 * 12))/5 ) * 0.5
            
    }
        if item == .equal{
            return (( UIScreen.main.bounds.width) - ((5 * 12))/5 ) * 0.5
        }
        return (UIScreen.main.bounds.width - ( 5*12))/5
    }


    
   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

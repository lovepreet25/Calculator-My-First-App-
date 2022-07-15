//
//  ContentView.swift
//  My First Application (Calculator)
//
//  Created by Macbook on 2022-07-14.
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
    case cube = "x^3"
    case square = "x^2"
    case squareRoot = "√x"
    case cubeRoot = "∛x"
    case Xpart = "1/x"
    case percent = "%"
      // setting the colors for bottons
    var butColor: Color{
        switch self {
        case .add, .subtract, .multiply, .divide, .percent, .square, .cube, .squareRoot, .cubeRoot, .Xpart:
            return.orange
        
        case .clear, .equal:
            return.white
        default:
            return Color(.lightGray)
        }
    }
    
    
}
enum mathOperations {
   case add, subtract, multiply, divide, percent, square, cube, squareRoot, cubeRoot, Xpart , none
}

struct ContentView: View {
    @State var value = "0"
    @State var curtOperation: mathOperations = .none
    @ State var runningnum = 0
    
    // two dementional array for setting ap the values of buttons
    let buttons: [[CalButtons]]=[
        [.cube, .square, .zero, .percent, .add], // adding additional functionals
        [.squareRoot,.seven, .eight, .nine, .subtract],
        [ .cubeRoot, .four, .five, .six, .multiply],
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
    // fuction for setting the width of button
    func didTap (button: CalButtons){
        switch button {
        case .add, .subtract, .divide, .multiply,.percent, .square, .cube, .squareRoot, .cubeRoot, .Xpart, .equal:
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
            }else if button == .percent {
                self.curtOperation = .percent
                self.runningnum = Int (self.value) ?? 0
            }else if button == .square {
                self.curtOperation = .square
                self.runningnum = Int (self.value) ?? 0
                let runningnum = self.runningnum
                let curtvalue = Int(self.value) ?? 0
                self.value = "\(pow( Decimal(curtvalue), 2))"
            }else if button == .cube {
                self.curtOperation = .cube
                self.runningnum = Int (self.value) ?? 0
            }else if button == .squareRoot {
                self.curtOperation = .squareRoot
                self.runningnum = Int (self.value) ?? 0
            }else if button == .cubeRoot {
                self.curtOperation = .cubeRoot
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
                case .percent:
                    self.value =  "\(curtvalue / 100)"
                case .square:
                    break
                case .cube:
                    self.value = "\(pow( Decimal(curtvalue), 3))"
                case .squareRoot:
                    self.value = "\( sqrt(Double(curtvalue)))"
                case .cubeRoot:
                    self.value = "\(runningnum + curtvalue)"
                case .Xpart:
                    self.value = "\(1 / curtvalue)"
                case .none:
                    break
                    }
            }
            //if button != .equal{
                //self.value = "0"
            //}
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
    public func calculatePercentage()->Double{
        let val = runningnum
        return Double(val) / 100.0
    }
    func buttonWidth (item: CalButtons) -> CGFloat{
        // case for making clear button wider
        if item == .clear{
            return (( UIScreen.main.bounds.width) - ((5 * 12))/5 ) * 0.5
            
    }
        if item == .equal{
            return (( UIScreen.main.bounds.width) - ((5 * 12))/5 ) * 0.5
        }
        return (UIScreen.main.bounds.width - ( 5*12))/5
    }

    // adding a function to perform task
    
   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

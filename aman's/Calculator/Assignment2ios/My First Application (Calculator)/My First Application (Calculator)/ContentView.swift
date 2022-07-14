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


struct ContentView: View {
    
    
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
                        .frame(width:250.0, height: 0.0)
                    Text("0")
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                 .padding()
                // setting buttons on display
                ForEach (buttons, id: \.self) {row in
                    HStack (spacing: 14){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                
                                
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

   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

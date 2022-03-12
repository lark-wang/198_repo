//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    
    var body: some View {
            //YOUR CODE HERE (NavView)//
        NavigationView{
            
                //YOUR CODE HERE (TabView)//
        
            TabView{
                    ZStack {
                        //YOUR CODE HERE (background)//
                        Image("calculate_background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.top)
                        VStack {
                            Spacer()
                            Text("WILL YOU GET OFF THE WAITLIST?")
                                .font(.largeTitle)
                                .bold()
                                .italic()
                                .foregroundColor(.blue)
                                .padding(.trailing,10)
                                .padding(.leading,10)

                            Spacer()
                            
                            HStack {
                                Text("Place on Waitlist (1 to Infinity - no, 200): \(waitlistPlace ,specifier:"%.f")")
                                .padding(.leading, 20).padding(.trailing, 20)
                                Spacer()
                            }
                            Slider(
                              value: $waitlistPlace,
                              in: 0...200,
                              step: 1)
                                .padding().border(Color.black).padding(.leading, 20).padding(.trailing, 20)
                           
                            HStack {
                                Text("Class Size: \(classSize ,specifier:"%.f")")
                                .padding(.leading, 20).padding(.trailing, 20)
                                Spacer()
                            }
                            Slider(
                              value: $classSize,
                              in: 0...1000,
                              step: 1)
                                .padding().border(Color.black).padding(.leading, 20).padding(.trailing, 20)
                            NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                            
                            Button("CALCULATE") {
                                //YOUR CODE HERE (calculate)//
                                calculateProbability(waitlistPlace: waitlistPlace, classSize: classSize)
                                text = getFeedbackText()
                                calculate = true
                            } .buttonStyle(CustomButton())
                            
                            Spacer()
                            
                        } .padding()
                        
                    }
//                    .navigationBarTitle("Home")
//                    .navigationBarHidden(false)
            
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    
                ZStack {
                    //YOUR CODE HERE (background)//
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)
                    VStack {
                        Spacer()
                        Text("Helpful Links")
                            .font(.largeTitle)
                            .bold()
                            .italic()
                            .foregroundColor(.blue)
                            .padding(.trailing,10)
                            .padding(.leading,10)
                        Spacer()
                        Text("Link 1")
                        Text("Link 2")
                        Text("Link 3")
                            .padding(.bottom, 100)
                        Spacer()
                    
        }
                }
                    .tabItem{
                        Image(systemName: "link")
                        Text("Links")
                    }
                
        }
            }
        }
        
    func calculateProbability(waitlistPlace: Double, classSize: Double) {
        let tenth = classSize / 10
                if  (waitlistPlace <= tenth) {
                    probability = 100
                } else if (waitlistPlace > tenth * 2) {
                    probability = 0
                } else {
                    probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth))*100))
                }
        
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                         self.presentation.wrappedValue.dismiss()
                       }) {
                       Image(systemName: "arrow.down.heart.fill")
                           .foregroundColor(.green)
                       }
                       .navigationBarHidden(true)
                    
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
        
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //YOUR CODE HERE (button style)//
            .padding()
            .background(Color.green)
            .foregroundColor(.black)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

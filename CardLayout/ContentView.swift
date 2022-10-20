//
//  ContentView.swift
//  CardLayout
//
//  Created by zoya me on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var person: Model
    
    @State var isPresented: Bool = false
    @State private var disableSubmit: Bool = false
    @State private var popieButton: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(self.person.newPerson) { item in
                        RowList(data: item)
                            .scaleEffect(x: 1, y: -1, anchor: .center)
                        
                    }
                    
                }
                .scaleEffect(x: 1, y: -1, anchor: .center)
                .navigationTitle(Text("People"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            withAnimation {
                                self.isPresented.toggle()
                                self.popieButton = false
                            }
                        }, label: {
                            Image(systemName: "plus")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .frame(width: 30, height: 30)
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        })
                        .fullScreenCover(isPresented: $isPresented) {
                            UserDetails(dismissedView: $isPresented, person: { data in
                                self.person.newPerson.append(data)
                            })
                        }
                    }
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}

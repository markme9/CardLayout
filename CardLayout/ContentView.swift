//
//  ContentView.swift
//  CardLayout
//
//  Created by zoya me on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchName: String = ""
    
    @EnvironmentObject var person: Model
    
    @State var isPresented: Bool = false
    @State private var disableSubmit: Bool = false
    @State private var popieButton: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(self.filterArray) { item in
                        RowList(data: item)
                            .scaleEffect(x: 1, y: -1, anchor: .center)
                        
                    }
                    .searchable(text: $searchName, placement: .toolbar)
                    
                    
                }.scaleEffect(x: 1, y: -1, anchor: .center)
                
            }
            .navigationTitle(Text("People"))
            
            .navigationBarItems(trailing: Button(action: {
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
            }))
            .fullScreenCover(isPresented: $isPresented) {
                UserDetails(dismissedView: $isPresented, person: { data in
                    self.person.newPerson.append(data)
                })
                
            }
        }
    }
    var filterArray: [Person] {
        if searchName.isEmpty {
            return person.newPerson
        }else {
            return person.newPerson.filter{$0.name.localizedCaseInsensitiveContains(searchName)}
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}

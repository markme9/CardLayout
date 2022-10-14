//
//  RosList.swift
//  CardLayout
//
//  Created by zoya me on 10/13/22.
//

import SwiftUI

struct RowList: View {
    
    @State var isPresented: Bool = false
    
    var data: Person
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.blue)
                .frame(width: UIScreen.main.bounds.width - 15, height: 110, alignment: .center)
            
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding(.top,0)
                .shadow(radius: 10)
            
                .overlay {
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 20) {
                            
                            if data.image != nil {
                                NavigationLink(
                                    destination: ImageDetail(image: data, isPresented: $isPresented),
                                    label: {
                                        Image(uiImage: data.image ?? UIImage())
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipShape(Circle())
                                            .frame(width: 60, height: 60)
                                            .overlay(RoundedRectangle(cornerRadius: 60).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 2)))
                                            .padding([.leading, .top], 12)
                                    })
                                
                            }
                            if data.image != nil {
                                Text(data.name)
                                    .font(.title2.bold())
                                    .foregroundColor(Color.white)
                                    //.padding(.top, 5)
                                    .padding(.leading, -5)
                                    
                                
                                Spacer()
                                
                            } else {
                                Text(data.name)
                                    .font(.title2.bold())
                                    .foregroundColor(Color.white)
                                    .padding(.leading, 18)
                                    
                                
                                Spacer()
                            }
                        }
                        
                        if data.image != nil {
                            Text(data.moreAboutYou)
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                                .padding(.leading)
                                .padding(.bottom, 15)
                        } else {
                            Text(data.moreAboutYou)
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                                .padding(.leading, 15)
                                .padding(.top, 12)
                            
                        }
                        
                    }
                    
                }
        }
    }
}

struct RowCell_Previews: PreviewProvider {
    static var previews: some View {
        RowList(data: Person(name: "Zoya", moreAboutYou: "how was your day?"))
    }
}

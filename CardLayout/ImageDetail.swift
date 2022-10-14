//
//  ImageDetail.swift
//  CardLayout
//
//  Created by zoya me on 10/13/22.
//

import SwiftUI

struct ImageDetail: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var image: Person
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black
                .ignoresSafeArea()
            VStack {
               Spacer()
                GeometryReader { geo in
                Image(uiImage: image.image ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 1.0)
                        .frame(width: geo.size.width, height: geo.size.height)
                   
                }
                Spacer()
                
            }.navigationBarHidden(true)

            Button(action: {
                withAnimation() {
                self.presentationMode.wrappedValue.dismiss()
                }
            }, label: {
               
                Image(systemName: "xmark")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .frame(width: 30, height: 30)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                    
        })
        }
    }
}

struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetail(image: Person(name: "Kian", image: UIImage(), moreAboutYou: ""), isPresented: .constant(false))
    }
}

//
//  Rectangle.swift
//  CardLayout
//
//  Created by zoya me on 10/14/22.
//

import SwiftUI
import Combine

struct UserDetails: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    // Dismiss View
    @Binding var dismissedView: Bool
    
    @State private var name: String = ""
    @State private var moreAboutYou: String = ""
    
    
    // Image
    @State var image: UIImage?
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    // Call Back function
    var person: (Person) -> ()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button {
                withAnimation() {
                self.presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .frame(width: 30, height: 30)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.trailing)

                
            }
           
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 380)
                    .padding([.leading, .trailing], 32)
                    .shadow(radius: 10)
                    .overlay(
                        VStack {
                            Image(uiImage: (image ?? UIImage(named: "image"))!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 80, height: 80)
                                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                            
                                .onTapGesture {
                                    self.showSheet.toggle()
                                    
                                }
                            Text("Profile Photo")
                                .font(.caption)
                                .foregroundColor(Color(.blue))
                            
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .frame(maxWidth: .infinity)
                                .frame(height: 8)
                                .foregroundStyle(LinearGradient(colors: [Color.mint, Color.green], startPoint: .leading, endPoint: .trailing))
                                .padding(.bottom, 10)
                                .padding([.leading, .trailing], 120)
                            
                                .actionSheet(isPresented: $showSheet) {
                                    ActionSheet(title: Text(""), message: Text("Seclect Photo to add Profile"), buttons: [
                                        .default(Text("Photo Library")) {
                                            self.showImagePicker = true
                                            self.sourceType = .photoLibrary
                                        },
                                        
                                            .cancel()
                                    ])
                                    
                                    
                                }
                                .sheet(isPresented: $showImagePicker) {
                                    ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
                                }
                            
                            
                            TextField("User name...", text: $name)
                                .padding(.leading, 15)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .foregroundColor(Color.white)
                                .background(LinearGradient(colors: [Color.mint.opacity(0.8), Color.green.opacity(0.4)], startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(60)
                                .padding([.leading, .trailing], 42)
                            
                                .onReceive(Just(name)) { value in
                                    name = String(value.prefix(16))
                                }
                            
                            
                            TextField("Write about you...", text: $moreAboutYou)
                                .padding(.leading, 15)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .foregroundColor(Color.white)
                                .background(LinearGradient(colors: [Color.mint.opacity(0.8), Color.green.opacity(0.4)], startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(60)
                                .padding([.leading, .trailing], 42)
                                
                                .onReceive(Just(moreAboutYou)) { value in
                                    moreAboutYou = String(value.prefix(30))
                                }
                            
                            
                            
                            Button {
                                withAnimation {
                                    dismissedView.toggle()
                                    self.person(.init(name: name, image: image, moreAboutYou: moreAboutYou))
                                }
                                
                            } label: {
                                Text("Submit")
                                    .font(.title.bold())
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .foregroundColor(Color.white)
                                    .background(LinearGradient(colors: [Color.mint, Color.green], startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(60)
                                    .padding([.leading, .trailing], 42)
                                    .padding(.top)
                                
                                
                            }
                            
                        }
                        
                )
                Spacer()
            }
        }
        
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserDetails(dismissedView: .constant(false), person: {_ in })
    }
}

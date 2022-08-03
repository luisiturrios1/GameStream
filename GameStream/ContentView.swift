//
//  ContentView.swift
//  GameStream
//
//  Created by Luis Iturrios on 02/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Spacer()
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                .ignoresSafeArea()
            VStack {
                Image("app logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 42)
                LoginSignUpView()
            }
        }
    }
}

struct LoginSignUpView:View {
    @State var login = true
    var body: some View {
        VStack {
            HStack() {
                Spacer()
                Button("INICIA SESIÓN") {
                    login = true
                }.foregroundColor(login ? .white : .gray)
                Spacer()
                Button("REGÍSTRATE") {
                    login = false
                }.foregroundColor(login ? .gray: .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if login {
                LoginView()
            } else {
                SignUpView()
            }
        }
    }
}

struct LoginView:View {
    
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                Text("Correo Electrónico")
                    .foregroundColor(Color("Dark cian"))
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("email", text: $email)
                        .foregroundColor(.white)
                }
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark cian"))
                    .padding(.bottom)
                Text("Contraseña")
                    .foregroundColor(.white)
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("password", text: $password)
                        .foregroundColor(.white)
                }
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark cian"))
                    .padding(.bottom)
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark cian"))
                Button(action: {}, label: {
                    Text("INICIAR SESSIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("Dark cian"), lineWidth: 1.0)
                                .shadow(color: .white, radius: 6)
                        )
                }).padding(.bottom)
                Text("Inicia sessión con redes sociales")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                HStack {
                    Button(action: {}){
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue gray"))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 4.0)
                            )
                    }.padding()
                    Button(action: {}){
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue gray"))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 4.0)
                            )
                    }.padding()
                }
            }.padding(.horizontal, 77)
        }
    }
}

struct SignUpView:View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var passwordConfirm : String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment:.center) {
                Text("Elige una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Puedes cambiar o elegirla mas adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                Button(action: {}, label: {
                    ZStack {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                }).padding(.bottom)
                VStack {
                    VStack(alignment:.leading) {
                        Text("Correo Electrónico*")
                            .foregroundColor(Color("Dark cian"))
                        ZStack(alignment: .leading) {
                            if email.isEmpty {
                                Text("ejemplo@gmail.com")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            TextField("email", text: $email)
                                .foregroundColor(.white)
                        }
                        Divider()
                            .frame(height: 1)
                            .background(Color("Dark cian"))
                            .padding(.bottom)
                        Text("Contraseña")
                            .foregroundColor(.white)
                        ZStack(alignment: .leading) {
                            if password.isEmpty {
                                Text("Escribe tu contraseña")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            SecureField("password", text: $password)
                                .foregroundColor(.white)
                        }
                        Text("Confirmar contraseña")
                            .foregroundColor(.white)
                        ZStack(alignment: .leading) {
                            if passwordConfirm.isEmpty {
                                Text("Vuelve a escribir tu contraseña")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            SecureField("password", text: $passwordConfirm)
                                .foregroundColor(.white)
                        }
                        Divider()
                            .frame(width:300, height: 1)
                            .background(Color("Dark cian"))
                            .padding(.bottom)
                    }
                    Button(action: {}, label: {
                        Text("REGÍSTRATE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("Dark cian"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6)
                            )
                    }).padding(.bottom)
                    Text("Regístrate con redes sociales")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                    HStack {
                        Button(action: {}){
                            Text("Facebook")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color("Blue gray"))
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 4.0)
                                )
                        }.padding()
                        Button(action: {}){
                            Text("Twitter")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color("Blue gray"))
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 4.0)
                                )
                        }.padding()
                    }
                }.padding(.horizontal, 77)
            }.padding(.horizontal, 77)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

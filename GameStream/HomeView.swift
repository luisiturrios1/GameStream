//
//  HomeView.swift
//  GameStream
//
//  Created by Luis Iturrios on 03/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var tabSelected : Int = 2
    
    var body: some View {
        TabView(selection: $tabSelected) {
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            Text("Juegos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            HomeScreenView().font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            Text("Favoritos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(.white)
    }
    
    init() {
        print("HomeView.init()")
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
    }
}

struct HomeScreenView : View {
    
    @State var searchText : String = ""
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                Image("app logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                HStack {
                    Button(action: search, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(
                            searchText.isEmpty ? .yellow : Color("Dark cian")
                        )
                    })
                    ZStack(alignment: .leading) {
                        if searchText.isEmpty {
                            Text("Buscar un video")
                                .foregroundColor(Color(red:174/256, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        TextField("", text: $searchText)
                            .foregroundColor(.white)
                    }
                }
                .padding([.top, .leading, .bottom],11)
                .background(Color("Blue gray"))
                .clipShape(Capsule())
            }.padding(.horizontal, 18)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func search() {
        print("search: \(searchText)")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

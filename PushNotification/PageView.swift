//
//  PageView.swift
//  PushNotification
//
//  Created by Barış Şaraldı on 11.11.2021.
//

import SwiftUI

struct PageView: View {
    @State private var selection  = 0
    @State private var localSelectionState = 0
    var body: some View {
        
        
        TabView(selection: $selection) {
            ForEach(0..<30) { i in
                ZStack {
                    Color.secondary
                    Text("Row: \(i)").foregroundColor(Color(UIColor.systemBackground))
                }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                //.scaleEffect((selection == i) ? 1.0 :  0.8)
            }
            .padding(.all, 10)
        }.onChange(of: selection, perform: { value in
            withAnimation {
                localSelectionState  = value
            }
        })
            .frame(width: UIScreen.main.bounds.width - 200, height: 200)
            .tabViewStyle(PageTabViewStyle())
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}

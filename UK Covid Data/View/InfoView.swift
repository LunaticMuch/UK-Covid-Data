//
//  SettingsView.swift
//  UK Covid Data
//
//  Created by Stefano Cislaghi on 09/01/2022.
//

import SwiftUI

let instagramURL = URL(string: "https://instagram.com/theyarestefano")!
let linkedinURL = URL(string: "https://linkedin.com/in/stefanocislaghi")!
let githubURL = URL(string: "https://github.com/lunaticmuch")!

struct InfoView: View {
    var body: some View {
        VStack {
            Text("UK Covid Data")
                .font(.system(size: 28, weight: .bold))
            VStack(spacing: 20) {

                Text("UK Covid Data is a free application that allows you to see UK Government official statistics on your phone. This application has been created a learning project on how to build iOS apps. If you wish to get in touch, report a bug, or request an additional feature, please use on the social link at the bottom.")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(UIColor.systemGray5)))
            Text("Disclaimer")
                .padding(.top, 40)
                .font(.system(size: 20, weight: .bold))
            VStack(spacing: 20) {
                Text("The application is provided as-is and it does not reflect at any time my personal view on the pandemic or vaccination program. Moreover, the application does not want to address, at any time, my personal view on politics.")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(UIColor.systemGray5)))
         Spacer()
            Divider()
            HStack {
                Link(destination: instagramURL, label: {
                    Image("instagram").padding()})
                Link(destination: linkedinURL, label: {
                    Image("linkedin").padding()})
                Link(destination: githubURL, label: {
                    Image("github").padding()})

            }
            .padding(.bottom, 30)
        }.padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

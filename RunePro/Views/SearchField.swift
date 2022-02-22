//
//  SearchField.swift
//  RunePro
//
//  Created by Hunter Green on 2/21/22.
//

import SwiftUI

struct SearchField: View {
    @State var text = ""

    var body: some View {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("HiScore Lookup")
                        .font(.title2)
                        .foregroundColor(.yellow)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        VStack {
                            TextField("Username", text: $text)
                                Divider()
                                .frame(height: 1)
                                .padding(.horizontal, 30)
                                .background(.yellow)
                        }
                    }
                }
            }
        }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField()
    }
}

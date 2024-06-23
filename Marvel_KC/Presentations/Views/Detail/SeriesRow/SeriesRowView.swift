//
//  SeriesRowView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - SeriesRowView
struct SeriesRowView: View {
    
    // MARK: Properties
    @Environment(\.colorScheme) var colorScheme
    private var serie: Serie
    
    #if os(watchOS)
        private let height = WKInterfaceDevice.current().screenBounds.height / 4
        private let width = WKInterfaceDevice.current().screenBounds.width / 3
    #else
        private let height = UIScreen.main.bounds.height/4
        private let width = UIScreen.main.bounds.width/3
    #endif
    
    // MARK: Init
    init(serie: Serie) {
        self.serie = serie
    }
    
    // MARK: View
    var body: some View {
        ZStack {
            if let urlString = serie.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .id(0)
                } placeholder: {
                    PlaceHolderImage()
                }
            } else {
                PlaceHolderImage()
            }
            
            LinearGradient(
                colors: [AppColors(colorScheme: colorScheme).whiteBlack, .clear],
                startPoint: .bottom,
                endPoint: .center
                )
            .id(1)
            
            VStack {
                
                Spacer()
                
                Text(serie.title)
                    .font(AppFonts().textXS)
                    .bold()
                    .padding()
                .foregroundStyle(AppColors(colorScheme: colorScheme).blackWhite)
                .id(3)
            }
        }
        .frame(width: width, height: height)
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}

// MARK: - Preview
#Preview {
    SeriesRowView(serie: serie1)
}

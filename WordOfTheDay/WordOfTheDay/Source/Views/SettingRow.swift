//
//  SettingRow.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 19/01/2021.
//

import SwiftUI

struct SettingRow: View {

    let item: SettingItem

    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(systemName: item.systemImageName)
                .thumbnailImageModifier(tintColor: item.color)

            VStack(alignment: .leading, spacing: 3.0) {
                Text(item.title)
                    .modifier(TitleStyle())

                Text(item.subtitle)
                    .modifier(SubTitleStyle())
            }
        }
        .padding(.vertical, 5.0)
    }

}

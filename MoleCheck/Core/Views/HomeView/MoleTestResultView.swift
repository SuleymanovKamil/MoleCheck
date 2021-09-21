//
//  MoleTestResultView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct MoleTestResultView: View {
    
    let mole: MoleTestsResult
    let index: Int
    var body: some View {
        
        HStack {
                Image(uiImage: (mole.moleImage != nil ? UIImage(data: mole.moleImage!) : UIImage(named: "MoleImage"))!)
                    .resizable()
                    .cornerRadius(18)
                    .frame(width: 79, height: 79)
                    .padding(.horizontal)
            
            VStack (alignment: .leading, spacing: 10){
                
                Text((mole.moleDescription ?? "") + " №\(index + 1)")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.colors.black)
                
                Text(mole.testDate ?? "")
                    .font(.system(size: 13))
                    .bold()
                    .foregroundColor(.colors.gray)
                
                Text(mole.status.rawValue)
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .frame(width: 91, height: 20)
                    .background(mole.status.statusColor.cornerRadius(5))
            }
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .font(.title3)
                .foregroundColor(.colors.black)
                .padding(.trailing)
        }
        .frame(width: screen.width - 30, height: 114)
        .background(Color.white.cornerRadius(18)
                        .shadow(color: Color.colors.black.opacity(0.1), radius: 5))
    }
}

struct MoleCheckView_Previews: PreviewProvider {
    static var previews: some View {
        MoleTestResultView(mole: someMole, index: 1)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

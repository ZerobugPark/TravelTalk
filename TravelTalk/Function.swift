//
//  Function.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/10/25.
//

import Foundation

let dateFormatter = DateFormatter()

func formatStringToDate(stringDate: String, inputFormat: String, outputFormat: String) -> String? {
    
    dateFormatter.dateFormat = inputFormat //"yyyy-MM-dd HH:mm"
    guard let date = dateFormatter.date(from: stringDate) else {
        print("변환 오류")
        return nil
    }
    dateFormatter.locale = Locale(identifier: "ko_KR")
    
    dateFormatter.dateFormat = outputFormat //"yy.MM.dd"
    return dateFormatter.string(from: date)
    
}

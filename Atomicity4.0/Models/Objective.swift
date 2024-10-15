//
//  Objective.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/12/24.
//

import SwiftUI
import SwiftData

@Model
final class Objective: Identifiable {
    
    var objectiveTitle: String
    var remarks: String
    var isCompleted: Bool = false
    var tint: String
    var creationDate: Date
    
    init(
        objectiveTitle: String,
        remarks: String,
        isCompleted: Bool,
        tint: String,
        creationDate: Date
    ) {
        self.objectiveTitle = objectiveTitle
        self.remarks = remarks
        self.isCompleted = isCompleted
        self.tint = tint
        self.creationDate = creationDate
    }
    var tintColor: Color {
        switch tint {
        case "taskColor1": return .taskColor1
        case "taskColor2": return .taskColor2
        case "taskColor3": return .taskColor3
         case "taskColor4": return .taskColor4
            case "taskColor5": return .taskColor5
            case "taskColor6": return .taskColor6
            case "taskColor7": return .taskColor7
            case "taskColor8": return .taskColor8
            case "taskColor9": return .taskColor9
            case "taskColor10": return .taskColor10
            case "taskColor11": return .taskColor11
            case "taskColor12": return .taskColor12
            case "taskColor13": return .taskColor13
            case "taskColor14": return .taskColor14
            case "taskColor15": return .taskColor15
            case "taskColor16": return .taskColor16
            case "taskColor17": return .taskColor17
            case "taskColor18": return .taskColor18
            case "taskColor19": return .taskColor19
            case "taskColor20": return .taskColor20
            case "taskColor21": return .taskColor21
            case "taskColor22": return .taskColor22
            case "taskColor23": return .taskColor23
            case "taskColor24": return .taskColor24
            case "taskColor25": return .taskColor25
            case "taskColor26": return .taskColor26
            case "taskColor27": return .taskColor27
            case "taskColor28": return .taskColor28
            case "taskColor29": return .taskColor29
            case "taskColor30": return .taskColor30
        default: return .primary
            
        }
    }


    var sampleObjectives: [Objective] {
        [
            .init(objectiveTitle: "WRMG Weld Maps Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor2", creationDate: Date.distantFuture),
            .init(objectiveTitle: "Weld Tactics Blog Site Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor3", creationDate: Date.distantFuture),
            .init(objectiveTitle: "WRMG Weld Maps Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor6", creationDate: Date.distantFuture),
            .init(objectiveTitle: "Weld Tactics Blog Site Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor7", creationDate: Date.distantFuture),
            .init(objectiveTitle: "Update Room.   Make Modern and Enhance", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor3", creationDate: Date.distantFuture),
            .init(objectiveTitle: "Develop Workout Routine for 3 Month Cycle", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor12", creationDate: Date.distantFuture),
        ]
    }
}
        extension Date{
            static func updateHour(_ value: Int) -> Date{
               let calendar = Calendar.current
                return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
            }
        }
    

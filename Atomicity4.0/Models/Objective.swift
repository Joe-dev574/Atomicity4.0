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
    var timestamp: Date
    
    init(
        objectiveTitle: String,
        remarks: String,
        isCompleted: Bool,
        tint: String,
        timestamp: Date
    ) {
        self.objectiveTitle = objectiveTitle
        self.remarks = remarks
        self.isCompleted = isCompleted
        self.tint = tint
        self.timestamp = timestamp
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
            default: return .taskColor1
            
        }
    }


    var sampleObjectives: [Objective] {
        [
            .init(objectiveTitle: "WRMG Weld Maps Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor2", timestamp: Date.now),
            .init(objectiveTitle: "Weld Tactics Blog Site Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor3", timestamp: Date.now),
            .init(objectiveTitle: "WRMG Weld Maps Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor6", timestamp: Date.now),
            .init(objectiveTitle: "Weld Tactics Blog Site Initiative", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor7", timestamp: Date.now),
            .init(objectiveTitle: "Update Room.   Make Modern and Enhance", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor3", timestamp: Date.now),
            .init(objectiveTitle: "Develop Workout Routine for 3 Month Cycle", remarks: "Lorem ipsum odor amet, consectetuer adipiscing elit. Rutrum ridiculus at et quis primis mattis.", isCompleted: false, tint: "taskColor12", timestamp: Date.now),
        ]
    }
}
        extension Date{
            static func updateHour(_ value: Int) -> Date{
                let calendar = Calendar.current
                return Calendar.current.date(byAdding: .hour, value: value, to: .now)!
            }
        }
    

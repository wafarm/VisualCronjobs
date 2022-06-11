//
//  CronJob.swift
//  Visual Cronjobs
//
//  Created by qinyuyao on 6/10/22.
//

import Foundation

enum WeekDay: Int {
    case Sunday, Monday, Tuesday, Wednesday,
         Thursday, Friday, Saturday
}

enum Month: Int {
    case January = 1, Febrary, March, April, May, June,
         July, Augest, September, October, November, December
}

class CronJob: ObservableObject, Hashable {
    static func == (lhs: CronJob, rhs: CronJob) -> Bool {
        return lhs.id == rhs.id
    }
    
    var minutes: [Int]
    var hours: [Int]
    var days: [Int]
    var weekDays: [WeekDay]
    var months: [Month]
    
    var id: Int
    var command: String
    var name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func fromString(_ string: String, id: Int) -> CronJob {
        func constructList(_ stringList: [Substring]) -> [Int] {
            var result: [Int] = []
            for i in stringList {
                if i == "*" {
                    return result
                }
                result.append(Int(i)!)
            }
            return result
        }
        
        let splited = string.split(separator: " ", maxSplits: 6)
        let minutes = constructList(splited[0].split(separator: ","))
        let hours = constructList(splited[1].split(separator: ","))
        let days = constructList(splited[2].split(separator: ","))
        let weekDaysInt = constructList(splited[3].split(separator: ","))
        let monthsInt = constructList(splited[4].split(separator: ","))
        
        var weekDays: [WeekDay] = []
        var months: [Month] = []
        
        for i in weekDaysInt {
            weekDays.append(WeekDay(rawValue: i)!)
        }
        
        for i in monthsInt {
            months.append(Month(rawValue: i)!)
        }
        
        return CronJob(minutes: minutes, hours: hours, days: days, weekDays: weekDays, months: months, id: id, command: String(splited[5]), name: "Unnamed")
    }
    
    init(minutes: [Int], hours: [Int], days: [Int], weekDays: [WeekDay], months: [Month], id: Int, command: String, name: String) {
        self.minutes = minutes
        self.hours = hours
        self.days = days
        self.months = months
        self.weekDays = weekDays
        self.id = id
        self.command = command
        self.name = name
    }
}

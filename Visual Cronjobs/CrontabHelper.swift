//
//  CrontabHelper.swift
//  Visual Cronjobs
//
//  Created by qinyuyao on 6/11/22.
//

import Foundation


func getCronJobs() -> (Bool, [CronJob]) {
    var result: [CronJob] = []
    var data: Data
    var id = 0
    
    // Read from "crontab -l"
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.arguments = ["-l"]
    task.executableURL = URL(fileURLWithPath: "/usr/bin/crontab")
    task.standardInput = nil
    
    do {
        try task.run()
        data = try pipe.fileHandleForReading.readToEnd()!
    } catch {
        return (false, [])
    }
    
    let output = String(data: data, encoding: .utf8)!
    let lines = output.split(whereSeparator: \.isNewline)
    
    for line in lines {
        let trimmedLine = line.trimmingCharacters(in: .whitespaces)
        if trimmedLine.starts(with: "#") || trimmedLine.isEmpty {
            continue
        } else {
            result.append(CronJob.fromString(trimmedLine, id: id))
            id += 1
        }
    }
    
    return (true, result)
}

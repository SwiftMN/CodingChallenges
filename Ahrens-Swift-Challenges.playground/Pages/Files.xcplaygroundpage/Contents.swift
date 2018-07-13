//: [Previous](@previous)

import Foundation
import PlaygroundSupport

// Log messages to a file

playgroundSharedDataDirectory
func logger(message: String, file: String) {
  let url = URL(fileURLWithPath: "~/Documents", isDirectory: true)
  let urlPath = url.appendingPathComponent(file)
  let fileManger = FileManager()
  guard fileManger.createFile(atPath: urlPath.absoluteString, contents: nil) else {
    fatalError("Couldn't create the file")
  }

  // Update
  var log = try! String(contentsOfFile: urlPath.absoluteString)
  log.append("\(Date().description)- \(message)\n\n------\n\n")

  // Save
  try! log.write(toFile: urlPath.absoluteString, atomically: true, encoding: .utf8)
}

logger(message: "Hello World", file: "logs.txt")

//: [Next](@next)

import Foundation

struct HostsProfile: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var content: String
    var lastModified: Date
    
    init(id: UUID = UUID(), name: String, content: String) {
        self.id = id
        self.name = name
        self.content = content
        self.lastModified = Date()
    }
    
    mutating func updateContent(_ newContent: String) {
        self.content = newContent
        self.lastModified = Date()
    }
    
    mutating func updateName(_ newName: String) {
        self.name = newName
        self.lastModified = Date()
    }

    var previewText: String {
        let lines = content.components(separatedBy: .newlines)
            .filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
            .prefix(3)
        return lines.joined(separator: "\n")
    }
}

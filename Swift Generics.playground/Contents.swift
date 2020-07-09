import Foundation

enum Arrow {
    case iron, wooden, elven, dwarvish, magic, silver, blue, coffin, plank, rock
}

var aCountedSet = CountedSet<Arrow>()
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron, .plank, .magic, .plank]

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral  {
    init(arrayLiteral: Element...) {
        result.removeAll()
        for item in arrayLiteral {
            self.insert(item)
        }
    }
    
    var result: [Element: Int] = [:]
    
    mutating func insert(_ member: Element) {
        let duplicate = result[member] != nil
        if !duplicate {
            result[member] = 0
        }
        result[member]! += 1
    }
    
    mutating func remove(_ member: Element) -> Int {
        
        guard let value = result[member], value > 1 else { return 0}
    
        if value == 0 {
           result[member] = nil
            return 0
        } else {
            result[member]! -= 1
        }
        return value - 1
    }
}
myCountedSet.insert(.dwarvish)
myCountedSet.remove(.magic)
print(myCountedSet)
myCountedSet.insert(.magic)
print(myCountedSet)

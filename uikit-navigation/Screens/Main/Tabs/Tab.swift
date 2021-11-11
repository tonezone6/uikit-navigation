
enum Tab: String, CaseIterable {
    case first, second, third
}

extension Tab {
    init(tag: Int) {
        switch tag {
        case 0: self = .first
        case 1: self = .second
        default: self = .third
        }
    }
    
    var tag: Int {
        Tab.allCases.firstIndex(of: self) ?? 0
    }
    
    var icon: String {
        switch self {
        case .first:
            return "a.circle"
        case .second:
            return "b.circle"
        case .third:
            return "c.circle"
        }
    }
}

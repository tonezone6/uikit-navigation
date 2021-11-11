
enum Tab: String, CaseIterable {
    case A, B, C
}

extension Tab {
    init(tag: Int) {
        switch tag {
        case 0: self = .A
        case 1: self = .B
        default: self = .C
        }
    }
    
    var tag: Int {
        Tab.allCases.firstIndex(of: self) ?? 0
    }
    
    var icon: String {
        switch self {
        case .A: return "a.circle"
        case .B: return "b.circle"
        case .C: return "c.circle"
        }
    }
}

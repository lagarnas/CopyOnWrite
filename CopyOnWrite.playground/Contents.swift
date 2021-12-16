import Foundation


final class Reference<T> {
    var value: T
    init(_ value: T) {
        self.value = value
    }
}

struct Boxed<T> {
     
    var reference: Reference<T>
    
    init(_ x: T) {
        self.reference = Reference(x)
    }
    
    var value: T {
        get { return reference.value }
        set {
            if (!isKnownUniquelyReferenced(&reference)) {
                reference = Reference(newValue)
            } else {
                reference.value = newValue
            }
        }
    }
}

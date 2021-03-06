import Foundation

// Collection of stanardised mapping funtions for RAC work

func stringIsEmailAddress(text:AnyObject!) -> AnyObject! {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    let testPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)!
    let stringContainsPlus:Bool = (text as NSString).containsString("+")
    return testPredicate.evaluateWithObject(text) && !stringContainsPlus
}

func centsToPresentableDollarsString(cents:AnyObject!) -> AnyObject! {
    if let dollars = NSNumberFormatter.currencyStringForCents(cents as? Int) {
        return dollars
    }
    return ""
}

func isZeroLengthString(string: AnyObject!) -> AnyObject! {
    return countElements(string as String) == 0
}

func isStringLengthIn(range: Range<Int>)(string: AnyObject!) -> AnyObject! {
    return contains(range, countElements(string as String))
}

func isStringOfLength(length: Int)(string: AnyObject!) -> AnyObject! {
    return countElements(string as String) == length
}

func isStringLengthAtLeast(length: Int)(string: AnyObject!) -> AnyObject! {
    return countElements(string as String) >= length
}

func isStringLengthOneOf(lengths: [Int])(string: AnyObject!) -> AnyObject! {
    return contains(lengths, countElements(string as String))
}

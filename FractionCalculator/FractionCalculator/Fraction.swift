//
//  Fraction.swift
//  prog5.2
//
//  Created by Sweta Kumari on 8/15/18.
//  Copyright © 2018 Sweta Kumari. All rights reserved.
//

import Foundation

/**
 Represent a number as a fraction of two integers
 
 */
final class Fraction : CustomStringConvertible, StringConvertibleNum {
    
    // STORED PROPERTIES
    private let num: Int;   // Numerator
    private let den: Int;   // Denominator
    
    
    // COMPUTED PROPERTIES
    
    /**
     Converts fraction to a Float value
     
     - returns: Float Decimal value of the fraction
     */
    var decimal: Float {
        get {
            // num and den are of type Int, therefore,
            // they need to be explicitly converted to Floats
            return Float(self.num)/Float(self.den);
        }
    }
    
    /**
     Converts object to a string description
     
     - returns: String String representation of a fraction
     */
    var description: String{
        if (self.den == 1) {
            return "\(self.num)";
        } else if (self.num == 0) {
            return "\(self.num)"
        }
        return "\((self.den),(self.num % self.den))/\(self.den)"
        //return "\(self.num)"
    }
    
    /**
     Default initialiser
     
     Numerator gets set to 0 and denominator gets set to 1
     */
    init() {
        // Setting numerator to 0 and
        // denominator to 1 is equivalent
        // to setting the fraction to zero
        self.num = 0
        self.den = 1
    }
    
    
    /**
     Designated initialiser
     
     Numerator and denominator values are passed in the arguments of the initialiser.
     
     - parameter num: Fraction's numerator
     - parameter den: Fraction's denominator
     */
    init(num : Int, den : Int) {
        
        // Check the denominator...
        assert(den != 0, "Denominator cannot be zero")
        
        var num = num
        var den = den
        
        /**
         Reduce self by greatest common denominator found.
         */
        if(den < 0) {
            // If the denominator is negative
            // multiply the numerator and
            // denominator by -1 - this
            // ensures the denominator is
            // always positive, and numerator
            // carries the appropriate sign
            num = -num
            den = -den
        }
        // Find greatest common denominator
        for gcd in (1...den).reversed() {
            if(num%gcd == 0 && den%gcd==0) {
                // Common denominator found,
                // divide numerator and denominator
                num /= gcd
                den /= gcd
                break
            }
        }
        
        self.num = num
        self.den = den
        
        
    }
    
    
    
    
    /**
     Convenience initialiser
     
     Numerator is set to some value, denominator
     is set to 1.
     
     - parameter num: Fraction's numerator
     */
    convenience init(num : Int) {
        self.init(num: num, den: 1);
    }
    
    // METHODS
    
    /**
     Adds a fraction to self.
     
     - parameter f: Fraction to add to self
     
     - returns: Fraction The result of adding f to self.
     */
    func add(_ f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den + self.den*f.num,
                        den: self.den*f.den)
    }
    
    /**
     Subtracts fraction from self.
     
     - parameter f: Fraction to subtract from self
     
     - returns: Fraction The result of subtracting f from self.
     */
    func subtract(_ f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den - self.den*f.num,
                        den: self.den*f.den)
    }
    
    /**
     Multiplies self by a fraction.
     
     - parameter f: Fraction to multiply self by
     
     - returns: Fraction The result of multiplying self by f.
     */
    func multiply(_ f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.num, den: self.den*f.den)
    }
    
    /**
     Divides self by a fraction.
     
     - parameter f: Fraction to divide self by
     
     - returns: Fraction The result of dividing self by f.
     */
    func divide(_ f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den, den: self.den*f.num)
    }
    //STATIC FUNCTION
    /**
     Add a fraction to fraction.
     
     - parameter f1: Fraction to add to
     - parameter f2: Fraction to be added
     
     - returns: The result of f1 + f2.
     */
    static func add(_ f1: Fraction, to f2: Fraction) -> Fraction {
        return Fraction(num: f1.num*f2.den + f1.den*f2.num,
                        den: f1.den*f2.den)
    }
    
    /**
     Subtract a fraction from fraction.
     
     - parameter f1: Fraction to subtract
     - parameter f2: Fraction to subtract from
     
     - returns: The result of f2 - f1.
     */
    static func subtract(_ f1: Fraction, from f2: Fraction) -> Fraction {
        return f2.subtract(f1);
    }
    
    /**
     Multiply a fraction by fraction.
     
     - parameter f1: Fraction to multiply
     - parameter f2: Fraction to multiply by
     
     - returns: The result of f1*f2.
     */
    static func multiply(_ f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.multiply(f2)
    }
    
    /**
     Divide a fraction by fraction.
     
     - parameter f1: Fraction to divide
     - parameter f2: Fraction to divide by
     
     - returns: The result of f1/f2.
     */
    static func divide(_ f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.divide(f2)
    }
    
    //METHOD OVERLOADING
    /**
     Adds an integer to self.
     
     - parameter x: Integer to add to self
     
     - returns: Fraction The result of adding x to self.
     */
    func add(_ x: Int) -> Fraction {
        return Fraction(num: self.num + self.den*x,
                        den: self.den)
    }
    
    /**
     Subtracts an integer from self.
     
     - parameter x: Integer to subtract from self
     
     - returns: Fraction The result of subtracting x from self.
     */
    func subtract(_ x: Int) -> Fraction {
        return Fraction(num: self.num - self.den*x,
                        den: self.den)
    }
    
    /**
     Multiplies self by an integer.
     
     - parameter x: Integer to multiply self by
     
     - returns: Fraction The result of multiplying self by x.
     */
    func multiply(_ x: Int) -> Fraction {
        return Fraction(num: self.num*x, den: self.den)
    }
    
    /**
     Divides self by an integer.
     
     - parameter x: Integer to divide self by
     
     - returns: Fraction The result of dividing self by x.
     */
    func divide(_ x: Int) -> Fraction {
        return Fraction(num: self.num, den: self.den*x)
    }
    
    
    /**
     Converts string to a Fraction object.  Supports string
     syntax of the following format:
     "a" - converts it to fraction a/1
     "a/b" - converts it to fraction a/b
     
     - parameter string: String to convert
     - returns: Fraction? Fraction read from string, nil if
     syntax error in the string
     */
    static func readFromString(_ string: String) -> Fraction? {
        // Default values for numerator
        // and denomintor
        var num: Int = 0;
        var den: Int = 1;
        
        // Break the string into tokens separated by / symbol
        var tokens = string.components(separatedBy: "/")
        
        // If there is at least one token, then there is
        // a numerator value
        if tokens.count > 0 {
            // Try to convert numerator string to integer -
            // if not successful, return nil
            if let n = Int(tokens[0]) {
                num = n
            } else {
                return nil
            }
        }
        
        // If there is a second token, then there is
        // a denominator value
        if tokens.count > 1 {
            // Try to convert denominator string to integer -
            // if not successful, return nil
            if let d = Int(tokens[1]) {
                den = d
            } else {
                return nil
            }
        }
        // Return new fraction initialising its
        // numerator and denominator to values
        // read from the string
        return Fraction(num: num, den: den)
    }
}

//OPERATOR OVERLOADING
/**
 + operator between two Fractions
 */
func +(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.add(f2)
}

/**
 - operator between two Fractions
 */
func -(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.subtract(f2)
}

/**
 * operator between two Fractions
 */
func *(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.multiply(f2)
}

/**
 / operator between two Fractions
 */

func /(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.divide(f2)
}
/**functions that will overload the +,-,* and / operators for operations between a Fraction and an Int.
 */
/**
 + operator between Fractions and Int
 */
func +(f1: Fraction, f2: Int) -> Fraction {
    return f1.add(f2)
}

/**
 - operator between Fractions and Int
 */
func -(f1: Fraction, f2: Int) -> Fraction {
    return f1.subtract(f2)
}

/**
 * operator between Fractions and Int
 */
func *(f1: Fraction, f2: Int) -> Fraction {
    return f1.multiply(f2)
}

/**
 / operator between Fractions and Int
 */

func /(f1: Fraction, f2: Int) -> Fraction {
    return f1.divide(f2)
}



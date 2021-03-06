//
//  CaesarCipher.swift
//  caesar-cipher
//
//  Created by Kevin Bi on 9/16/16.
//  Copyright © 2016 Kevin Bi. All rights reserved.
//

import Foundation

class CaesarCipher {
    let SHIFT_SIZE = 26;
    var shift = 0;
    var alphabet = Alphabet();
    
    func getShift() -> Int {
        return self.shift
    }
    
    func setShift(_ newShift: Int) {
        self.shift = (newShift % SHIFT_SIZE)
    }

    func Encrypt (_ message:String) -> String {
        if (self.shift == 0) {
            return message;
        }
        
        var ret = "",
            shiftValue = self.shift,
            newMessage = message.characters.split{$0 == " "}.map(String.init)
        
        for word in newMessage {
            ret += " " + encryptWord(word, shiftValue: shiftValue);
        }
        return String(ret.characters.dropFirst());
    };

    func encryptWord (_ word: String, shiftValue: Int) -> String {
        if (word == " ") {
            return word;
        }
        var oldPosition = 0,
            newPosition = 0,
            newWord = "";
        for c in word.characters {
            if (!alphabet.ALPHABET_LOWER_CASE.contains(String(c).lowercased())) {
                continue;
            }
            oldPosition = alphabet.getPositionFromLetter(String(c));
            newPosition = (oldPosition + shiftValue) % SHIFT_SIZE;
            newWord += alphabet.getLetterFromPosition(newPosition);
        }
        return newWord;
    }

    func Decrypt (_ message: String) -> String {
        var ret = "",
        shiftValue = self.shift,
        newMessage = message.characters.split{$0 == " "}.map(String.init)
        
        for word in newMessage {
            ret += " " + decryptWord(word, shiftValue: shiftValue);
        }
        return String(ret.characters.dropFirst());
    };

    func decryptWord (_ word: String, shiftValue: Int) -> String {
        if (word == " ") {
            return word;
        }
        var oldPosition = 0,
            newPosition = 0,
            newWord = "";
        for c in word.characters {
            if (!alphabet.ALPHABET_LOWER_CASE.contains(String(c).lowercased())) {
                continue;
            }
            oldPosition = alphabet.getPositionFromLetter(String(c));
            newPosition = (oldPosition - shiftValue) % SHIFT_SIZE;
            if(newPosition < 0) {
                newPosition += SHIFT_SIZE;
            }
            newWord += alphabet.getLetterFromPosition(newPosition);
        }
        return newWord;
    }
}

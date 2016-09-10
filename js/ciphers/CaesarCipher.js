/***********************************
 * Kevin Bi
 * Cipher Project
 * Copyright 2016
 ***********************************/

var Alphabet   = require("../ciphers/Alphabet.js"),
    CipherBase = require("../ciphers/CipherBase.js");

//class CaesarCipher {}

function CaesarCipher () {
    this.shift = 0;
}

CaesarCipher.prototype.setShift = function (shift) {
    this.shift = shift % 26;
}

CaesarCipher.prototype.getShift = function () {
    return this.shift;
}

/**
 * @override 
 */
CaesarCipher.prototype.Encrypt = function (message) {
    if (this.shift === 0) {
        return message;
    }

    var ret = "",
        shiftValue = this.shift,
        newMessage = message.split(/(\s+)/);
        
    newMessage.forEach(function (word) {
        ret += encryptWord(word, shiftValue);
    });
    return ret;
};

function encryptWord (word, shiftValue) {
    if (word === " ") {
        return word;
    }
    var oldPosition,
        newPosition,
        newWord = "";
    for (var i = 0; i < word.length; i++) {
        oldPosition = Alphabet.getPositionFromLetter(word.charAt(i));
        newPosition = (oldPosition + shiftValue) % 26;
        newWord += Alphabet.getLetterFromPosition(Alphabet.ALPHABET_LOWER_CASE, newPosition);
    }
    return newWord;
}

/**
 * @override
 */
CaesarCipher.prototype.Decrypt = function (message) {
    var ret = "",
        shiftValue = this.shift,
        newMessage = message.split(/(\s+)/);
    
    newMessage.forEach(function (word) {
        ret += decryptWord(word, shiftValue);
    });
    return ret;
};

function decryptWord (word, shiftValue) {
    if (word === " ") {
        return word;
    }
    var oldPosition,
        newPosition,
        newWord = "";
    for (var i = 0; i < word.length; i++) {
        oldPosition = Alphabet.getPositionFromLetter(word.charAt(i));
        newPosition = (oldPosition - shiftValue) % 26;
        newWord += Alphabet.getLetterFromPosition(Alphabet.ALPHABET_LOWER_CASE, newPosition);
    }
    return newWord;
}

module.exports = CaesarCipher;
/***********************************
 * Kevin Bi
 * Cipher Project
 * Copyright 2016
 ***********************************/

var Alphabet   = require("../Alphabet"),
    CipherBase = require("CipherBase");

class CaesarCipher extends CipherBase {}

CaesarCipher.prototype.setShift = function (shift) {
    this.shift = shift;
}

/**
 * @override 
 */
CaesarCipher.prototype.Encrypt = function (message) {
    var ret,
        oldPosition,
        newPosition;
    message.forEach(function (index) {
        oldPosition = Alphabet.getPositionFromLetter(message[index]);
        newPosition = (oldPosition + this.shift) % 26;
        ret += Alphabet.getLetterFromPosition(newPosition);
    });
    return ret;
};

/**
 * @override
 */
CaesarCipher.prototype.Decrypt = function (message) {
    var ret,
        oldPosition,
        newPosition;
    message.forEach(function (index) {
        oldPosition = Alphabet.getPositionFromLetter(message[index]);
        newPosition = (oldPosition - this.shift) % 26;
        ret += Alphabet.getLetterFromPosition(newPosition);
    });
    return ret;
};
/***********************************
 * Kevin Bi
 * Cipher App
 * Copyright 2016
 ***********************************/

const ALPHABET_LOWER_CASE = "abcdefghijklmnopqrstuvwxyz",
      ALPHABET_UPPER_CASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      LETTER_POSITION_MAP = {
          'a' : 0,
          'b' : 1,
          'c' : 2,
          'd' : 3,
          'e' : 4,
          'f' : 5,
          'g' : 6,
          'h' : 7,
          'i' : 8,
          'j' : 9,
          'k' : 10,
          'l' : 11,
          'm' : 12,
          'n' : 13,
          'o' : 14,
          'p' : 15,
          'q' : 16,
          'r' : 17,
          's' : 18,
          't' : 19,
          'u' : 20,
          'v' : 21,
          'w' : 22,
          'x' : 23,
          'y' : 24,
          'z' : 25
      };

class Alphabet {}

exports.getLetterFromPosition = function (alphabetType, position) {
    return ALPHABET_LOWER_CASE.charAt(position % 26);
};

exports.getPositionFromLetter = function (letter) {
    return LETTER_POSITION_MAP[letter];
};
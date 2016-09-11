/***********************************
 * Kevin Bi
 * Cipher Project
 * Copyright 2016
 ***********************************/

var assert       = require('chai').assert,
    CaesarCipher = require('../ciphers/CaesarCipher.js');

describe ('CaesarCipher' , function () {
    var cipher = new CaesarCipher();
    beforeEach (function() {
        cipher.setShift(3);
    }); 

    afterEach (function() {
        cipher.setShift(0);
    });

    it('should return original word if cipher is 0 or mulitple of 26', function () {
        cipher.setShift(0);
        var message = "abcdefghijklmnopqrstuvwxyz",
            newMessage = cipher.Encrypt(message);
        assert.deepEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
        cipher.setShift(26);
        newMessage = cipher.Encrypt(message);
        assert.deepEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
        cipher.setShift(52);
        newMessage = cipher.Encrypt(message);
        assert.deepEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
    });

    it('should properly encrypt a word', function () {
        var message = "abcdefghijklmnopqrstuvwxyz",
            newMessage = cipher.Encrypt(message);
        assert.deepEqual(newMessage, "defghijklmnopqrstuvwxyzabc");
    });

    it('should properly decrypt a word', function() {
        var message = "defghijklmnopqrstuvwxyzabc",
            newMessage = cipher.Decrypt(message);
        assert.deepEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
    });

    it('should properly encrypt a string with white space', function () {
        var message = "hello nice to meet you",
            newMessage = cipher.Encrypt(message);
        assert.deepEqual(newMessage, "khoor qlfh wr phhw brx");
    });

    it('should properly decrypt a string with white space', function () {
        var message = "khoor qlfh wr phhw brx",
            newMessage = cipher.Decrypt(message);
        assert.deepEqual(newMessage, "hello nice to meet you");
    });

    it('should be able to change its shift between 0-25', function() {
        cipher.setShift(5);
        assert.deepEqual(cipher.getShift(), 5);
        cipher.setShift(18)
        assert.deepEqual(cipher.getShift(), 18);
        cipher.setShift(26);
        assert.deepEqual(cipher.getShift(), 0);
        cipher.setShift(27);
        assert.deepEqual(cipher.getShift(), 1);
    });
})
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

    it('should properly encrypt a message', function () {
        var message = "hello",
            newMessage = cipher.Encrypt(message);
            assert.deepEqual(newMessage, "khoor");
    });

    it('should properly descrypt a function', function() {
        var message = "khoor",
            newMessage = cipher.Decrypt(message);
            assert.deepEqual(newMessage, "hello");
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
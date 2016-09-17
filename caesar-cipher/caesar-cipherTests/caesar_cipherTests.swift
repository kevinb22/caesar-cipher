//
//  caesar_cipherTests.swift
//  caesar-cipherTests
//
//  Created by Kevin Bi on 9/14/16.
//  Copyright © 2016 Kevin Bi. All rights reserved.
//

import XCTest
@testable import caesar_cipher

class caesar_cipherTests: XCTestCase {
    var cipher = CaesarCipher();
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cipher.setShift(3);
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        cipher.setShift(0);
    }
    
    func testReturnOriginalWord() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Should return original word if cipher is 0 or mulitple of 26
        cipher.setShift(0);
        var message = "abcdefghijklmnopqrstuvwxyz",
            newMessage = cipher.Encrypt(message);
        XCTAssertEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
        cipher.setShift(26);
        newMessage = cipher.Encrypt(message);
        XCTAssertEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
        cipher.setShift(52);
        newMessage = cipher.Encrypt(message);
        XCTAssertEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
    }
    
    func testEncryption() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //should properly encrypt a word
        let message = "abcdefghijklmnopqrstuvwxyz",
            newMessage = cipher.Encrypt(message);
        XCTAssertEqual(newMessage, "defghijklmnopqrstuvwxyzabc");
    }
    
    func testDecryption() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // should properly decrypt a word
        let message = "defghijklmnopqrstuvwxyzabc",
            newMessage = cipher.Decrypt(message);
        XCTAssertEqual(newMessage, "abcdefghijklmnopqrstuvwxyz");
    }
    
    func testStringWithWhiteSpace() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // should properly encrypt/decrypt a string with white space
        var message = "hello nice to meet you",
            newMessage = cipher.Encrypt(message);
        XCTAssertEqual(newMessage, "khoor qlfh wr phhw brx");
        message = "khoor qlfh wr phhw brx";
        newMessage = cipher.Decrypt(message);
        XCTAssertEqual(newMessage, "hello nice to meet you");
    }
    
    func testShiftSetting() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // should be able to change its shift between 0-25
        cipher.setShift(5);
        XCTAssertEqual(cipher.getShift(), 5);
        cipher.setShift(18)
        XCTAssertEqual(cipher.getShift(), 18);
        cipher.setShift(26);
        XCTAssertEqual(cipher.getShift(), 0);
        cipher.setShift(27);
        XCTAssertEqual(cipher.getShift(), 1);
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

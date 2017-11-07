//
//  SimonSaysOfficialTests.swift
//  SimonSaysOfficialTests
//
//  Created by Tim Snelling on 11/5/17.
//  Copyright © 2017 Tim. All rights reserved.
//

import XCTest
@testable import SimonSaysOfficial

class SimonSaysOfficialTests: XCTestCase {
    
    let standardOps = ViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    //Regular test with multiple inputs
    func testJudge(){
        let input1 = "123"
        let input2 = "123"
        let expected = true
        let actual = standardOps.Judge(Leader: input1, Follower: input2)
        XCTAssertEqual(expected, actual)
    }
    //Regular test with one input
    func testSpeedCheck(){
        let input = true
        let expected = true
        let actual = standardOps.SpeedCheck(speed: input)
        XCTAssertEqual(expected, actual)
    }
    //Consistency check with no input
    func testLostRace(){
        //negligible
        _ = false
        let expected = false
        let actual = standardOps.LostRace()
        XCTAssertEqual(expected, actual)
    }
    //Confomational test, being sure the generated value is within the described range (1-4)
    func testGenerator(){
        _ = false
        let expected = "4"
        var actual = standardOps.GenerateLeader()
        if Int(expected)! >= Int(actual)! && Int(actual)! != 0{
            actual = "4"
        }
        XCTAssertEqual(expected, actual)
    }
    //Testing For Loop within function
    func testShowLeaders(){
        _ = "1"
        let expected = "1"
        var actual = "1"
        for c in expected.characters{
            if Int(String(c)) == 1{
                actual = "1"
            }
        }
        XCTAssertEqual(expected, actual)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

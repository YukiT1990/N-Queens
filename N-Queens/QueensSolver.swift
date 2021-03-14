//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var numOfRecursion = 0
func solveQueens(board: inout Board) {
    helper(board: &board, row: 0)
    print("(... \(count) possible ways)")
}


/// for 1 : Print all possible ways to place 8 queens on 8x8 chessboard.

//func helper(board: inout Board, row: Int) {
//    // base case
//    if row == 8 {
//        print(board.description)
//        count += 1
//    }
//    for i in 0...7 {
//
//        if board.isSafe(row: row, col: i) {
//            board.place(row: row, col: i)
//            helper(board: &board, row: row + 1)
//            numOfRecursion += 1
//            // when the choice does not lead to the right answer
//            // delete and try another column
//            board.remove(row: row, col: i)
//        }
//    }
//}



/// for 2 : Print the first possible way to place 8 queens on the 8x8 board with
/// less than 115 recursive calls.
/// Stop immediately as soon as you find the first solution.

func helper(board: inout Board, row: Int) {
    // base case
    if row == 8 {
        print(board.description)
        count += 1
        print("Number of recursive calls: \(numOfRecursion)")
        exit(0)
    }
    for i in 0...7 {
        // with this "row % 2" condition -> 48 recursive calls
        // without this "row % 2" condition -> 105 recursive calls
        if row % 2 == 0 {
            if board.isSafe(row: row, col: i) {
                board.place(row: row, col: i)

                if numOfRecursion < 112 {
                    helper(board: &board, row: row + 1)
                    numOfRecursion += 1
                } else {
                    return
                }
                // when the choice does not lead to the right answer
                // delete and try another column
                board.remove(row: row, col: i)
            }
        } else {
            if board.isSafe(row: row, col: 7 - i) {
                board.place(row: row, col: 7 - i)

                if numOfRecursion < 112 {
                    helper(board: &board, row: row + 1)
                    numOfRecursion += 1
                } else {
                    return
                }
                // when the choice does not lead to the right answer
                // delete and try another column
                board.remove(row: row, col: 7 - i)
            }
        }

    }
}



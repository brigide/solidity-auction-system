// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Auction {
    address payable public owner;

    uint256 public startBlock;
    uint256 public endBlock;

    string public ipfsHash;

    enum State {
        Started,
        Running,
        Ended,
        Canceled
    }
    State public auctionState;

    uint256 public highestBindingBid;
    address payable public highestBidder;

    mapping(address => uint256) public bids;

    uint256 bidIncrement;

    constructor() {
        owner = payable(msg.sender);

        auctionState = State.Running;

        startBlock = block.number;
        endBlock = startBlock + 40320; // this calculates that the auction will run for a week
        // considering there is avg 1 block each 15s, we divided the number of seconds in a weeb by 15s.

        ipfsHash = "";
        bidIncrement = 100;
    }
}

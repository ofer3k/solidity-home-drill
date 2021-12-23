// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Person {

    string private _name = 'Gambler';
    int public cash=1000;
    
    constructor() {
      // If I continued the project development, my next step would be to boot with the help of the constructor a starting amount of cash per user
    }
    
    function getName() public view returns (string memory) {
        return _name;
    }

    // Define a Ticket
    struct Ticket {
        uint   id;
        bool isWinningTicket;
    }
    
    // Initialize an empty list of tickets
    Ticket[] public tickets;
    
    // Getter For simplicity
    function getTickets() 
    public 
    returns(Ticket [] memory){
        return tickets;
    }
    
    // The Tickets array and the cash variable vary according to the random value
    function buyTicket()
    public
    returns(string memory)
    {
    uint256 seed = uint256(keccak256(abi.encodePacked(
        block.timestamp + block.difficulty +
        ((uint256(keccak256(abi.encodePacked(block.coinbase)))) / (block.timestamp)) +
        block.gaslimit + 
        ((uint256(keccak256(abi.encodePacked(msg.sender)))) / (block.timestamp)) +
        block.number
    )));
    if(seed - ((seed / 1000) * 1000) > 500){
        cash=cash+1000;
        tickets.push(Ticket(tickets.length, true));
        return 'Winning ticket !! You earned 1000 $ cachings $';
        }

    else {
        cash=cash-1000;
            tickets.push(Ticket(tickets.length, false));
        return 'Losing ticket, You probably lost your pants';
        }
    }
}
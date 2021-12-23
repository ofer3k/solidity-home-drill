# Solidity - Home Test - Ofer Klein

## working process:

- Started by reading solidity docs
- Continued by watching two videos and read a written code examples
- Treated the homework as defined - not spending too much time and showing interesting functionality
- Downloaded an older version of nodejs because the latest version did not work smoothly with the ganache-cli.

## solution Idea

- I built a small slot machine.
- The user (or by his new name "Gambler")
  Gets 1000 points by default and can buy lucky cards.
- I created a function that knows how to set a number between 0 and 1000 at random.
- If the set value is greater than 500 then the ticket is a winning ticket and the user win 1000 $$
- Otherwise, it's a losing ticket and the user loses 1000 $$
- At each stage you can get in the form of an array all the tickets that the user bought up to the same point

## code sinps

#### I realized that it is common to work with a data structure called **struct** So I chose to experiment and set up my card as follows:

```
// Define a Ticket
    struct Ticket {
        uint   id;
        bool isWinningTicket;
    }
```

#### I created an array of tickets to keep the tickets that were purchased

```
    Ticket[] public tickets;
```

#### I used the push method to insert new ticket to the tickets array

```
        tickets.push(Ticket(tickets.length, true));
```

#### I used a code that aims to create a random number between 0 and 1000

```
 uint256 seed = uint256(keccak256(abi.encodePacked(
        block.timestamp + block.difficulty +
        ((uint256(keccak256(abi.encodePacked(block.coinbase)))) / (block.timestamp)) +
        block.gaslimit +
        ((uint256(keccak256(abi.encodePacked(msg.sender)))) / (block.timestamp)) +
        block.number
    )));
```

## I added a video showing the functionality in a clean environment and using a constructor

- The video can be found [here]()

pragma solidity ^0.4.18;

contract Voting {
  address public owner;

  // The function body is inserted where the special symbol
  // `_;` in the definition of a modifier appears.
  // This means that if the owner calls this function, the
  // function is executed and otherwise, an exception is
  // thrown.
  modifier onlyOwner {
    require(
      msg.sender == owner,
      "Only owner can call this function."
    );
    _;
  }

  function Voting() public {
    owner = msg.sender;
  }

  function kill() public onlyOwner {
    selfdestruct(owner);
  }
}

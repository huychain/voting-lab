pragma solidity ^0.4.18;
// We have to specify what version of compiler this code will compile with

contract Voting {
  address public owner;

  /* mapping field below is equivalent to an associative array or hash.
  The key of the mapping is candidate name stored as type bytes32 and value is
  an unsigned integer to store the vote count
  */
  mapping (bytes32 => uint8) public votesReceived;

  /* Solidity doesn't let you pass in an array of strings in the constructor (yet).
  We will use an array of bytes32 instead to store the list of candidates
  */
  bytes32[] public candidateList;

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

  /* This is the constructor which will be called once when you
  deploy the contract to the blockchain. When we deploy the contract,
  we will pass an array of candidates who will be contesting in the election
  */
  function Voting(bytes32[] candidateNames) public {
    candidateList = candidateNames;
    owner = msg.sender;
  }

  // This function returns the total votes a candidate has received so far
  function totalVotesFor(bytes32 candidate) public returns (uint8) {
    assert(validCandidate(candidate) == true);
    return votesReceived[candidate];
  }

  // This function increments the vote count for the specified candidate. This
  // is equivalent to casting a vote
  function voteForCandidate(bytes32 candidate) public {
    assert(validCandidate(candidate) == true);
    votesReceived[candidate] += 1;
  }

  function kill() public onlyOwner {
    selfdestruct(owner);
  }

  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}

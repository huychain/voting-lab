pragma solidity ^0.4.18;

contract Voting {
  address public owner;

  mapping (bytes32 => uint8) public votesReceived;
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

  function Voting(bytes32[] candidateNames) public {
    candidateList = candidateNames;
    owner = msg.sender;
  }

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

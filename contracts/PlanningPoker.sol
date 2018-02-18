pragma solidity ^0.4.17;

contract PlanningPoker {

  uint64 public sessionTime;

  // will convert to zero-based index
  enum PlayerState { NoVote, OneDay, TwoDays, ThreeDays, FourDays, FiveDays, Pass }

  struct Session {
    uint256 sessionId;
    bool isSessionOpen;
    address creator;
    uint64 startDateTime;
    uint64 consensusDateTime;
    uint256 passVote;
    uint256 noVote;
    uint256 oneDay;
    uint256 twoDays;
    uint256 threeDays;
    uint256 fourDays;
    uint256 fiveDays;
    uint256 totalPlayers;
    mapping (address => PlayerState) players;
  }

  Session[] sessions;
  int8[] tallies;

  event CreateSession(uint256 sessionId);
  event PlayerSignedIntoSession(uint256 sessionId, address player);
  event PlayerCastedVote(uint256 sessionId, int8 playerState);
  event EveryoneVoted(uint256 sessionId);
  event VoteIsUnanimous(uint256 sessionId);

  // Setters
  function createSession() {
    //
  }

  function joinSession(uint256 sessionId) {
    // use msg.sender
  }

  function closeSession (uint256 sessionId) {
    //
  }

  function castVote (uint256 sessionId) {

  }

  // Getters
  function canSessionClose (uint256 sessionId) public view returns (bool) {
    // check for consensus or time
  }

  function isSessionOpen (uint256 sessionId) public view returns (bool) {
    // check to see if a session is open
  }
}

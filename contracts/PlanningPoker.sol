pragma solidity ^0.4.17;

contract PlanningPoker {

  uint64 public sessionTime;

  // will convert to zero-based index
  enum PlayerState { NotInSession, NoVote, OneDay, TwoDays, ThreeDays, FourDays, FiveDays, Pass }

  struct Session {
    uint256 sessionId;
    string metadata;
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
  function createSession() public {
    uint256 sessionId = sessions.length++; //note this number is iterated after assignment so initial sessionid = 0
    Session storage session = sessions[sessionId];
    session.creator = msg.sender;
    session.startDateTime = uint64(now);
    session.totalPlayers = 0;
    session.isSessionOpen = true;

    // have creator join the session automatically
    session.players[msg.sender] = PlayerState.NoVote;

    CreateSession(sessionId);
  }

  function joinSession(uint256 sessionId) public {
    // make sure that user is joining a valid session id
    require(sessionId < sessions.length);

    Session storage session = sessions[sessionId];

    require(session.isSessionOpen);

    // FIXME: figure out how to find bad mapping
    // make sure player has not already joined the session
    require(session.players[msg.sender] == PlayerState.NotInSession);

    // add player to the session
    session.players[msg.sender] = PlayerState.NoVote;

    PlayerSignedIntoSession(sessionId, msg.sender);
  }

  function getSession(uint256 sessionId) public view returns (uint8) {
      return uint8((sessions[sessionId]).players[msg.sender]);
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

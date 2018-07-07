pragma solidity ^0.4.23;

/* import "./EIP998.sol"; */
/* is EIP998  */

/// @title Portfolio: Composable resume containing weighted peer assessed skills & attestations
/// @author Trevor Clarke (github.com/trevorjtclarke)
/// @dev The main portfolio contract contains logic for composable NFT containing extra references
contract Portfolio {
  address public owner;
  /// @dev generation dictates different "rounds" of access to minting more skills
  int8 generation;
  /// @dev keeps track of key/value metadata references
  ///   Used for things like IPFS JSON, png, etc
  mapping(address => Meta) public metadata;

  /// @dev TODO: change to use composable FNs
  /* mapping(address => Skill) public skills; */

  /// @dev references to metadata
  ///   each reference points to a hash of data stored in IPFS
  struct Meta {
    bool requiresPermission;
    bytes32 path;
  }

  /// @dev constructor, assigns ownership
  constructor() public {
    owner = msg.sender;
  }

  /// @dev Throws if called by any account other than the owner.
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  //////////////////////////////////////////
  /// Events
  //////////////////////////////////////////
  event MetaAdded(address indexed _reference);
  event MetaUpdated(address indexed _reference);
  event MetaRemoved(address indexed _reference);


  // TODO:
  // - getSkill
  // - getAllSkills
  // - mintSkill
  // - getMeta
  // - addMetaItem
  // - sendMetaItem

}

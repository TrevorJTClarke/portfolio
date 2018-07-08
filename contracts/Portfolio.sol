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
    /// @dev defines if user needs to get access to view info
    ///   useful if you don't want people getting your email info... argh bots
    bool requiresPermission;
    /// @dev the folder where data is stored ("folder/file.type")
    bytes32 path;
    /// @dev the source type of data (IPFS, Storj, etc)
    ///   Example: 0 = null, 1 = IPFS, etc
    uint8 source;
  }

  /// @dev constructor, assigns ownership
  constructor() public {
    owner = msg.sender;
  }


  //////////////////////////////////////////
  /// Modifiers
  //////////////////////////////////////////

  /// @dev Throws if called by any account other than the owner.
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /// @dev Checks if the reference exists within known data
  modifier hasMetaRef(address _reference) {
    /* Meta memory m = metadata[_reference]; */
    require(metadata[_reference].path != 0, 'Meta item doesnt exist');
    _;
  }

  //////////////////////////////////////////
  /// Events
  //////////////////////////////////////////
  event MetaAdded(address indexed _reference);
  event MetaUpdated(address indexed _reference);
  event MetaRemoved(address indexed _reference);

  //////////////////////////////////////////
  /// Functions
  //////////////////////////////////////////

  /// @dev Returns single meta item
  function getMetaItem(address _reference)
    constant hasMetaRef(_reference) public returns(bytes32, uint8) {
      Meta memory m = metadata[_reference];
      // TODO: Check if access is acceptable
      return (m.path, m.source);
    }

  /// @dev Removes a single meta item
  function removeMeta (address _reference)
    onlyOwner public {
      delete metadata[_reference];
    }

  /// @dev Adds/updates metadata reference to contract data
  ///   allows updates to previously stored meta item
  ///   source value of 0 is a null reference
  function setMetaItem(address _reference, bytes32 _path, uint8 _source, bool _permission)
    onlyOwner public {
      require(_reference != 0, 'Reference missing');
      require(_path != 0, 'Path missing');
      bool exists = false;

      // check if this is update
      if (metadata[_reference].path != 0) exists = true;

      // Assign new meta item
      Meta memory metaItem;
      metaItem.path = _path;
      metaItem.source = _source | 1;
      metaItem.requiresPermission = _permission;
      metadata[_reference] = metaItem;

      if (exists == true) {
        emit MetaUpdated(_reference);
      } else {
        emit MetaAdded(_reference);
      }
    }

}

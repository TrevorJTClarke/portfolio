pragma solidity ^0.4.23;

/// Standard FNs Required for new Skills
interface SkillInterface {
  //////////////////////////////////////////
  /// Events
  //////////////////////////////////////////
  event SkillMinted(bytes32 indexed _name, address indexed _skill);
  event SkillEndorsed(bytes32 indexed _name, address indexed _skill, uint _total);

  //////////////////////////////////////////
  /// Modifiers
  //////////////////////////////////////////

  //////////////////////////////////////////
  /// Functions
  //////////////////////////////////////////
  function endorse(address _from) external;
  function getSkillWeight() external;
  function calculateWeight() external;
}

pragma solidity ^0.4.23;

// Standard FNs Required for new Skills
interface SkillInterface {
  //////////////////////////////////////////
  /// Events
  //////////////////////////////////////////
  event SkillAdded(bytes32 indexed _name);
  event SkillEndorsed(bytes32 indexed _name, uint _total);
}

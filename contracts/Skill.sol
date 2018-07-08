pragma solidity ^0.4.23;

// TODO: Import ERC721 & Interface
// TODO: Create Library for genome fns
import "zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "./SkillInterface.sol";

contract Skill is ERC721Token, SkillInterface {
  /* address public owner; */
  uint256 public genome;
  // The timestamp from the block when this skill came into existence.
  uint64 public createTime;
  // The timestamp from the block when this skill was first endorsed.
  uint64 public endorsedTime;

  // TODO: finish
  /// @dev constructor
  constructor() public {

  }


}

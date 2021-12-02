pragma solidity >=0.8.0;

contract SaitoPool {
  public mapping(address => uint256) poolBalance;
  public uint256 poolUsers;

  function addPoolUser(address _depositer, uint256 _amount) public returns(bool success) {
    if (poolBalance[_depositer] == 0) {
      poolUsers += 1;
    }

    poolBalance[_depositer] += _amount;

    return true
  }

  function() payable external {}		
}

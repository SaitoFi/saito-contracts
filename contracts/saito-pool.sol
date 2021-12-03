pragma solidity >=0.8.0;

contract SaitoPool {
  address owner;
  public mapping(address => uint256) poolBalance;
  public uint256 poolUsers;
  public uint256 poolTotal;
  public boolean isPoolOpen;

  // helper functions
  function sqrt(uint256 y) internal pure returns (uint256 z) {
    if (y > 3) {
        z = y;
        uint x = y / 2 + 1;
        while (x < z) {
            z = x;
            x = (y / x + x) / 2;
        }
    } else if (y != 0) {
        z = 1;
    }
  }

  function calcTotalFees(uint256 _avgGas) public returns(uint256 fees) {
    uint256 fees = _avgGas + (_avgGas * sqrt(poolUsers));

    return fees;
  }


  // pool user functions
  function addPoolUser(address _depositer, uint256 _amount) public returns(bool success) {
    if (poolBalance[_depositer] == 0) {
      poolUsers += 1;
    }

    poolBalance[_depositer] += _amount;
    poolTotal += _amount;

    return true
  }

  function withdrawPoolUser(address _depositer, uint256 _amount) public returns(bool success) {
    require(poolBalance[_depositer] >= _amount);

    poolBalance[_depositer] -= _amount;
    poolTotal -= _amount;

    if (poolBalance[_depositer] == 0) {
      poolUsers -= 1;
    }

    return true;
  }

  function() payable external {}		
}

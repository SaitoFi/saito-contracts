/*
pragma solidity >=0.8.0;

import "./abstracts/AbstractZksync.sol";

contract SaitoZkPool {
  address owner;
  address immutable ZKSync;
  address immutable SaitoZK;
  mapping(address => uint256) public poolBalance;
  address[] public poolUsers;
  uint256 public poolUsersQty;
  uint256 public poolTotal;
  bool public isPoolOpen;

  uint256 public MIN_USERS;
  uint256 public MIN_TOTAL;

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

  function remove(address _addressToRemove, address[] memory _array) public returns(address[] memory) {

    address[] storage auxArray;

    for (uint i = 0; i < _array.length; i++){
        if(_array[i] != _addressToRemove)
            auxArray.push(_array[i]);
    }

    return auxArray;
  }

  function checkDeposit() public returns(bool success) {
    if (poolUsersQty >= MIN_USERS && poolTotal >= MIN_TOTAL) {
      return true;
    }

    return false;
  }

  function calcTotalFees(uint256 _avgGas) public returns(uint256 fees) {
    uint256 fees = _avgGas + (_avgGas * sqrt(poolUsers));

    return fees;
  }


  // pool user functions
  function addPoolUser(address _depositer, uint256 _amount) public returns(bool success) {
    if (poolBalance[_depositer] == 0) {
      poolUsersQty += 1;
      poolUsers.push(_depositer);
    }

    poolBalance[_depositer] += _amount;
    poolTotal += _amount;

    return true;
  }

  function removePoolUser(address _depositer) public returns(bool success) {
    poolUsersQty -= 1;
    address[] memory updatedPoolUsers = remove(_depositer, poolUsers);
    poolUsers = updatedPoolUsers;

    return true;
  }

  function withdrawPoolUser(address _depositer, uint256 _amount) public returns(bool success) {
    require(poolBalance[_depositer] >= _amount);

    poolBalance[_depositer] -= _amount;
    poolTotal -= _amount;

    if (poolBalance[_depositer] == 0) {
      removePoolUser(_depositer);
    }

    return true;
  }

  // pool actions
  function openPool() public returns(bool success) {
    isPoolOpen = true;
  }

  function closePool() public returns(bool success) {
    isPoolOpen = false;

    return true;
  }

  function bridge() public returns(bool success) {
    AbstractZksync zk = AbstractZksync(ZKSync);

    zk.depositETH(poolTotal, SaitoZK);

    return true;
  }

  // allow deposits
  fallback() payable external {}		
}
*/
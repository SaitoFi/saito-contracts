pragma solidity >=0.8.0;

import "./interfaces/IUniRouterV2.sol";
import "./interface/IERC20.sol";

// https://docs.uniswap.org/sdk/guides/quick-start
contract SaitoUniPool {
  struct Pool {
    address[] userAddresses;
    mapping(address => uint256) userBalance;
    uint256 poolUserQty;
    uint256 poolBalance;
  }

  // Uniswap Router Address
  IUniswapV2Router02 public UniswapRouter2;

  // Token Addresses
  address immutable WETH;
  address immutable USDC;

  // Parameters
  uint256 public MIN_USERS;
  uint256 public MIN_TOTAL;

  // Contract state
  Pool public poolData;
  bool public isPoolOpen;

  constructor(address _uniRouter, address _weth, address _usdc, uint256 _minUsers, uint256 _minTotal) {
    UniswapRouter2 = IUniswapV2Router02(_uniRouter);
    WETH = _weth;
    USDC = _usdc;
    MIN_USERS = _minUsers;
    MIN_TOTAL = _minTotal;

    isPoolOpen = true;
  }

  function addPoolUser(address _depositer, uint256 _amount) public returns(bool success) {
    _depositer.transfer(address(this), _amount);

    if (poolData.userBalance[_depositer] == 0) {
      poolData.userAddresses.push(_depositer);
      poolData.poolUserQty += 1;
    }

    poolData.userBalance[_depositer] += _amount;
    poolData.poolBalance += _amount;

    return true;
  }

  function withdrawPoolUser(address _depositer, uint256 _amount) public returns(bool success) {
    
  }
}

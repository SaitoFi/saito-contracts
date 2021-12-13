pragma solidity >=0.8.0;

struct BridgeVals {
	address _depositer;
	uint256 _amount;
}

contract SaitoDistribute {
	function distribute(BridgeVals[] _bridgeVals, uint256 _totalAmount) public returns (bool success) {
		require(address(this).balance >= _totalAmount);

		for (uint256 i; i < _bridgeVals.length; i++) {
			_bridgeVals[i]._depositer.transfer(_bridgeVals[i]._amount);
		}

		return true;
	}
}
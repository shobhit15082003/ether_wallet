//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract EtherWallet{
    address payable public immutable owner=payable(msg.sender);
    
    receive() external payable{}
    function withdraw(uint amt,address payable _to) external{
        require(msg.sender==owner,"caller is not owner");
        _to.transfer(amt);
    }
    function balance() external view returns(uint)
    {
        return address(this).balance;
    }
}
contract EthReceiver{
    event Log(uint amount,uint gas);
    receive() external payable{
        emit Log(msg.value,gasleft());
    }
}
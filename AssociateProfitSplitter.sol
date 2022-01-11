pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    address payable employee_one = 0xd9aAb01d8CBaf0b0067B3E151347c7E150082b1e;
    address payable employee_two = 0xA98f4CE80619ee30E40244F857e845D35b00E80e;
    address payable employee_three = 0xAD5bE6C76332788fb6dC32feB639a008636373F6;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint amount = msg.value / 3; // Your code here!
        uint remainder = msg.value - amount*3;

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        msg.sender.transfer(remainder);
    }

    function() external payable {
        deposit();
    }
}

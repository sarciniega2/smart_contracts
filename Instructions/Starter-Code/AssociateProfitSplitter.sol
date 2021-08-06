pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    //^Above is the main parameters that will enable functions to manage payroll for the workforce
    //The above code ensures that public variables will be organized into specific categories of functions
    constructor(address payable _one, address payable _two, address payable _three) public{
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }
    //^This constructor function (code that was already included) uses parameters to equal variables to ensure reusability 
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint amount = msg.value/3

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        //^This section of the code transfers the amount split to all three employees.
        //^.transfer allows for this task to be enabled

        msg.sender.transfer(msg.value - (amount*3)));
    }

    function() external payable{
        deposit();
    //^Not sure if I did this function the right way but it will have to do for now
    //^This is supposed to be the fallback function
    }
}
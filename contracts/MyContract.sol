pragma solidity ^0.4.24;

contract MyContract {
    string value;

    constructor() public {
        value = "myValue";
    }

    function get() public view returns(string memory){
        return value;
    }

    function set(string memory newValue) public {
        value = newValue;
    }
}
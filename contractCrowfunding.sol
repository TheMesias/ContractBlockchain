pragma solidity >=0.7.0 <0.9.0;

contract crowdFunding {
    string public id; 
    string public name = 'DogiChain'; 
    address payable public owner; 
    string public state = "open";
    uint public found; 

    constructor(string memory _id){
        id = _id; 
        owner = payable(msg.sender); 
    }

    modifier onlyOwnerChangeState () {
        require(
            msg.sender == owner, "Only owner can change the state" 
        );
        _; 
    }

    function chagneStateProject(string calldata _state) public onlyOwnerChangeState{
        state = _state; 
    }

    modifier publicDonate () {
        require(
            msg.sender != owner, "Owner, you don't should donate"
        );
        _; 
    }
    
    function donate() public payable publicDonate{
        owner.transfer(msg.value);
        found += msg.value; 
    }
}
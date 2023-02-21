pragma solidity ^0.8.9;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomNumberConsumer is VRFConsumerBase {

    byte32 public KeyHash;
    uint256 public fee;
    uint256 public randomResult;

    constructor() VRF ConsumerBase(
        0x271682DEB8C4E0901D1a1550aD2e64D568E69909, 
        0x514910771AF9Ca656af840dff83E8264EcF986CA) public {
        
        KeyHash = 0x9fe0eebf5e446e3c998ec9bb19951541aee00bb90ea201ae456421a2ded86805;
        fee = 0.1 * 10 **18; //0.1 LINK
    }


function getRandomNumber(uint256 userProvidedSeed) public returns(byte32 requestId){
    return requestRandomness (KeyHash, fee, userProvidedSeed);
}

function fulfillRandomness(byte32 requestId, uint256 randomness) internal override {
    randomResult = randomness;
}
}
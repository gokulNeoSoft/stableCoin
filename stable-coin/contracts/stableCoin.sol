// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./token0.sol";

contract StableCoin {
    address tokenAddress;
    uint16 public RATIO = 10000;
    Gtoken public gtoken;

    constructor() {
        gtoken = new Gtoken();
    }

    function depositAsset(uint amt)external {
       gtoken.mint(msg.sender,calculateTokenAmt(amt));
    }

    function removeAsset(uint amt)external {
       gtoken.burn(calculateTokenAmt(amt));

    }

    function decimalConvert (uint amount) internal pure returns (uint res){
        res = amount * (10 ** 18);
    }

    function calculateTokenAmt (uint amt )internal view returns (uint res){
        res = amt * RATIO;
    }

    function getSupply ()external view returns  (uint res){
       res = gtoken.totalSupply();
    }

    function balOf() external view returns (uint res){
        res = gtoken.balanceOf(msg.sender);
    }
    
   
    

} 
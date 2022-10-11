const stableCoinContract = artifacts.require('StableCoin')

contract("stableCoinContract",async(accounts)=>{

    describe("Depositing and Removing Assets.",()=>{
        var _stableCoinContract;
        var zero_address = '0x0000000000000000000000000000000000000000'
      
        beforeEach(async () => {
          _stableCoinContract = await stableCoinContract.new();
          assert.notEqual(await _stableCoinContract.gtoken(), zero_address)
        })

        it("Complete flow test :",async ()=>{
           await _stableCoinContract.depositAsset(5);
           var totalSupplyAfterDeposit = await _stableCoinContract.getSupply();
           assert.equal(totalSupplyAfterDeposit.toString(), '50000000000000000000000')
           await _stableCoinContract.removeAsset(4);
           var totalSupplyAfterRemove = await _stableCoinContract.getSupply();
           assert.equal(totalSupplyAfterRemove.toString(), '10000000000000000000000')
        })
    })
})
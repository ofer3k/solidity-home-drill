const { assert } = require("chai");
const Person = artifacts.require("./Person.sol");

contract("Person", (accounts) => {
  const [owner] = accounts;
  describe("Person", () => {
    it("should be name === test ", async () => {
      const person = await Person.deployed();
      const name = await person.getName();
      assert.equal(name, "Gambler");
    });
  });
});

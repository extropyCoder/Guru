contract('Guru', function(accounts) {
  it("should guru", function() {
    var guru = Guru.deployed();

    return guru.getBalances.call(accounts[0]).then(function(balance) {
      console.log(balance);
    });
  });

  it("should add team", function() {
    var guru = Guru.deployed();
    var teamName = "first team";
    return guru.addTeam.sendTransaction(accounts[0],"first team").then(function(Tx) {
      console.log(Tx);
      return guru.getTeamNameForAddress.call(accounts[0]).then(function(name){
        assert.equal(name,teamName);
      });
    });
  });

  it("should get team names", function() {
    var guru = Guru.deployed();
    guru.addTeam.sendTransaction(accounts[0],"team two").then(function(Tx) {
    return guru.getTeamAddresses.call().then(function(teams){
        for (ii=0;ii<teams.length;ii++){
          console.log(teams[ii]);
        }
        return true;
    });
});
  });

});

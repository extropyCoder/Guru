pragma solidity ^0.4.0;
contract Guru {


mapping(address=>uint) balances;
mapping(address=>string) teamNames;

address [] teams;

event questionAsked(address team,uint requiredValue);
event teamAwarded(address team,uint points);

function submitAnswer(address _submitter,uint _answer) {

if((_answer > block.number-2)&&(_answer < block.number+2)){
    balances[_submitter] += 5;
    teamAwarded(_submitter,5);
}

}

function getBalances() returns (uint []){

uint [] memory bals = new uint [] (teams.length);

for (uint ii=0;ii<teams.length;ii++){
    bals[ii] = balances[teams[ii]];
}

}

function addTeam(address _team,string _teamName){
    teams.push(_team);
    teamNames[_team] = _teamName;
    balances[_team] = 0;
}


function requestNumber(address _submitter) constant returns (uint){
    return block.number;
}

function getTeamAddresses() constant external returns (address []){
  return teams;
}

function getTeamNameForAddress(address _addr) constant external returns(string){
  return teamNames[_addr];
}

function getBalancesForTeam(address _team)constant external returns (uint){
  return balances[_team];

}

}

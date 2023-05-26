// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract AssetCatalog {



    // This is a comment!
    struct Catalog {
        uint256 AssetID;
        string AssetHash;
        string AssetCost;
        address AssetOwner;
        string VotingDelegate;
        string DAO;
        string LocationPrefrences;
        string OffChainEngine;


    }

    Catalog[] public catalog;
    mapping(string => uint256) public AssetHashToAssetID;
    mapping(string => string) public AssetHashToAssetCost;
    mapping(string => address) public AssetHashToAssetOwner;



    function RegisterAsset(string memory _AssetHash, string memory _AssetCost, uint256 _AssetID, string memory _VotingDelegate,string memory _DAO, string memory _LocationPrefrences, string memory _OffChainEngine) public {
        catalog.push(Catalog(_AssetID, _AssetHash, _AssetCost, msg.sender,_VotingDelegate,_DAO,_LocationPrefrences,_OffChainEngine));
        AssetHashToAssetID[_AssetHash] = _AssetID;
        AssetHashToAssetCost[_AssetHash] = _AssetCost;
        AssetHashToAssetOwner[_AssetHash] = msg.sender;


    }

}

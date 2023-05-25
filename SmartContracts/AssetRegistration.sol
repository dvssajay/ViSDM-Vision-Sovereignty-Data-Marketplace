// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract AssetRegistration {



    // This is a comment!
    struct Catalog {
        uint256 AssetID;
        string AssetHash;
        string AssetCost;
        address AssetOwner;


    }

    Catalog[] public catalog;
    mapping(string => uint256) public AssetHashToAssetID;
    mapping(string => string) public AssetHashToAssetCost;
    mapping(string => address) public AssetHashToAssetOwner;



    function RegisterAsset(string memory _AssetHash, string memory _AssetCost, uint256 _AssetID) public {
        catalog.push(Catalog(_AssetID, _AssetHash, _AssetCost, msg.sender));
        AssetHashToAssetID[_AssetHash] = _AssetID;
        AssetHashToAssetCost[_AssetHash] = _AssetCost;
        AssetHashToAssetOwner[_AssetHash] = msg.sender;


    }

}
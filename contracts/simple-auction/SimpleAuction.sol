// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract SimpleAuction {
    using SafeMath for uint;

    struct Bidder {
        address payable bidderAddress;
        uint bid;
    }

    struct Product {
        string name;
        uint startPrice;
        address payable seller;
        uint[] bidderIds;
        uint approvedBidderId;
        bool ongoing;
    }

    Product[] public products;
    Bidder[] public bidders;
    uint private productId = 0;
    uint private bidderId = 0;

    event BidStarted(
        address indexed productSeller,
        uint productId,
        uint productStartPrice
    );

    event BidAdded(
        address indexed bidder,
        uint productId,
        uint bid
    );

    event BidEnded(
        address indexed productSeller,
        uint productId,
        address indexed winnerBidder,
        uint winnerBid
    );

    modifier checkBidder(uint _productId) {
        Product storage product = products[_productId];
        require(product.ongoing == true, "The seller has ended bid.");
        require(msg.sender != product.seller, "You're seller in this product.");
        require(msg.value >= product.startPrice, "You've set your price is below from the start price.");
        for (uint i = 0; i < product.bidderIds.length; i++) {
            uint currentId = product.bidderIds[i];
            Bidder memory bidder = bidders[currentId];
            if (msg.sender == bidder.bidderAddress) {
                revert("You've already bid this product.");
            }
        }
        _;
    }

    function getListBidder(uint[] memory _ids) public view returns(Bidder[] memory) {
        Bidder[] memory result = new Bidder[](_ids.length);
        for (uint i = 0; i < _ids.length; i++) {
            result[i] = bidders[_ids[i]];
        }
        return result;
    }

    function openBid(string memory _name, uint _startPrice) public {
        require(_startPrice > 0, "Start price must be greater than 0.");
        Product memory newProduct;
        newProduct.name = _name;
        newProduct.startPrice = _startPrice;
        newProduct.seller = payable(msg.sender);
        newProduct.ongoing = true;
        products.push(newProduct);
        emit BidStarted(msg.sender, productId, _startPrice);
        productId++;
    }

    function bid(uint _productId) public payable checkBidder(_productId) {
        Bidder memory newBidder;
        newBidder.bidderAddress = payable(msg.sender);
        newBidder.bid = msg.value;
        bidders.push(newBidder);
        products[_productId].bidderIds.push(bidderId);
        emit BidAdded(msg.sender, _productId, msg.value);
        bidderId++;
    }

    function endBid(uint _productId) public {
        Product memory product = products[_productId]; 
        require(msg.sender == product.seller, "You're not a seller in this product.");

        uint approvedBidderId;
        Bidder memory approvedBidder;
        approvedBidder.bid = 0;
        
        for (uint i = 0; i < product.bidderIds.length; i++) {
            uint currentId = product.bidderIds[i];
            Bidder memory bidder = bidders[currentId];
            if (bidder.bid > approvedBidder.bid) {
                approvedBidder = bidder;
                approvedBidderId = currentId;
            }
        }
        
        payable(product.seller).transfer(calculatePercentage(approvedBidder.bid, 90));
        products[_productId].approvedBidderId = approvedBidderId;
        products[_productId].ongoing = false;

        for (uint i = 0; i < product.bidderIds.length; i++) {
            uint currentId = product.bidderIds[i];
            Bidder memory bidder = bidders[currentId];
            if (bidder.bidderAddress != approvedBidder.bidderAddress) {
                bidder.bidderAddress.transfer(bidder.bid);
            }
        }

        emit BidEnded(product.seller, _productId, approvedBidder.bidderAddress, approvedBidder.bid);
    }

    function calculatePercentage(uint256 _amount, uint256 _percentage) private pure returns (uint256) {
        return _amount.mul(_percentage).div(100);
    }
}

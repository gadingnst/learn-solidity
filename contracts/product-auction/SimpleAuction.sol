// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleAuction {
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

    modifier checkBidder(uint _productId) {
        Product memory product = products[_productId];
        require(product.ongoing == true, "The seller has ended bid.");
        require(msg.sender != product.seller, "You're seller in this product.");
        require(msg.value >= product.startPrice, "You have set your price is below from the start price.");
        _;
    }

    function registerProduct(string memory _name, uint _startPrice) public {
        require(_startPrice > 0, "Start price must be greater than 0.");
        Product memory newProduct;
        newProduct.name = _name;
        newProduct.startPrice = _startPrice;
        newProduct.seller = payable(msg.sender);
        newProduct.ongoing = true;
        products.push(newProduct);
        productId++;
    }

    function bid(uint _productId) public payable checkBidder(_productId) {
        Bidder memory newBidder;
        newBidder.bidderAddress = payable(msg.sender);
        newBidder.bid = msg.value;
        bidders.push(newBidder);
        products[_productId].bidderIds.push(bidderId);
        bidderId++;
    }

    function getListBidder(uint[] memory _ids) public view returns(Bidder[] memory) {
        Bidder[] memory result = new Bidder[](_ids.length);
        for (uint i = 0; i < _ids.length; i++) {
            result[i] = bidders[_ids[i]];
        }
        return result;
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
            } else {
                payable(bidder.bidderAddress).transfer(bidder.bid);
            }
        }
        payable(product.seller).transfer(approvedBidder.bid);
        products[_productId].approvedBidderId = approvedBidderId;
        products[_productId].ongoing = false;
    }
}

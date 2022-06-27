// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/// @notice Modern, minimalist, and gas efficient ERC-721 implementation.
/// @author 0xBasset | Taken from Solmate (https://github.com/Rari-Capital/solmate/blob/main/src/tokens/ERC721.sol)
contract OfficeHours {

    /*//////////////////////////////////////////////////////////////
                                 EVENTS
    //////////////////////////////////////////////////////////////*/

    event Transfer(address indexed from, address indexed to, uint256 indexed id);
    event Approval(address indexed owner, address indexed spender, uint256 indexed id);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /*//////////////////////////////////////////////////////////////
                         METADATA STORAGE/LOGIC
    //////////////////////////////////////////////////////////////*/

    string public name   = "Office Hours";
    string public symbol = "OfficeHrs";

    /*//////////////////////////////////////////////////////////////
                      STORAGE
    //////////////////////////////////////////////////////////////*/

    address public owner;
    address public calendar;
    address public renderer;

    uint256 public maxSupply = 3000;
    uint256 public totalSupply;

    mapping(uint256 => Data)    internal _tokenData;
    mapping(address => uint256) internal _balanceOf;

    mapping(uint256 => address) public getApproved;

    mapping(address => mapping(address => bool)) public isApprovedForAll;

    struct Data { address owner; Details details; }

    struct Details {
        uint8 profession;     // The profession gives work structure
        uint8 timezone;       // The timezone where the worker is
        uint40 overtimeUntil; // The timestamp up until this token is on overtime
        uint40 hourlyRate;    // How much it costs to pay for overtime
    }

    /*//////////////////////////////////////////////////////////////
                              CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    constructor() { owner = msg.sender; }

    /*//////////////////////////////////////////////////////////////
                              OFFICE HOURS LOGIC
    //////////////////////////////////////////////////////////////*/

    // todo remove multi mint
    function mint(uint256 amount) external {
        for (uint256 i = 0; i < amount; i++) {
            _mint();
        }
    } 

    function mint() external {
        _mint();
    } 

    function _mint() internal {
        // todo adjust with correct character amounts
        // Generate token
        uint256 id = totalSupply++;

        // Not the strongest entropy, but good enough for a mint
        uint256 entropy = uint256(keccak256(abi.encode(msg.sender, block.coinbase, id, "entropy")));

        // Generate traits
        uint8 timezone   = uint8(uint256(keccak256(abi.encode(entropy, "TIMEZONE"))) % 24) + 1;

        uint8 profEntropy =  uint8(uint256(keccak256(abi.encode(entropy, "PROF"))));
        uint8 profession  = (profEntropy % 12) + 1; 

        // If it's a rare
        if (profEntropy <= 3) {
            profession += 12;
            timezone    = uint8(1);
        }

        (uint8 start, uint8 end) = CalendarLike(calendar).rates(profession);

        uint8 rate = (uint8(entropy) % (end - start)) + start;
        
        _tokenData[id].details.timezone   = timezone;
        _tokenData[id].details.profession = profession;
        _tokenData[id].details.hourlyRate = rate;

        _mint(msg.sender, id);
    }

    function payOvertime(uint256 tokenId_) external payable { 
        uint256 hourlyRate = _tokenData[tokenId_].details.hourlyRate * 1e16;
        require(msg.value >= hourlyRate, "Less than 1 hour");

        uint256 overtime = msg.value / (hourlyRate / 1 hours);
        _tokenData[tokenId_].details.overtimeUntil += uint40(overtime);
    } 

    /*//////////////////////////////////////////////////////////////
                              ADMIN FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    function setRenderer(address rend_) external {
        require(msg.sender == owner, "not owner");
        renderer = rend_;
    }

    function setCalendar(address cal_) external {
        require(msg.sender == owner, "not owner");
        calendar = cal_;
    }

    function withdraw(address recipient) external {
        require(msg.sender == owner, "not owner");
        (bool succ, ) = payable(recipient).call{value: address(this).balance }("");
        require(succ, "withdraw failed");
    }

    /*//////////////////////////////////////////////////////////////
                              ERC721 LOGIC
    //////////////////////////////////////////////////////////////*/

    function approve(address spender, uint256 id) public virtual {
        address owner_ = _tokenData[id].owner;

        require(msg.sender == owner_ || isApprovedForAll[owner_][msg.sender], "NOT_AUTHORIZED");

        getApproved[id] = spender;

        emit Approval(owner_, spender, id);
    }

    function setApprovalForAll(address operator, bool approved) public virtual {
        isApprovedForAll[msg.sender][operator] = approved;

        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function transferFrom(
        address from,
        address to,
        uint256 id
    ) public virtual {
        require(from == _tokenData[id].owner, "WRONG_FROM");

        require(to != address(0), "INVALID_RECIPIENT");

        require(
            msg.sender == from || isApprovedForAll[from][msg.sender] || msg.sender == getApproved[id],
            "NOT_AUTHORIZED"
        );

        Details memory details = _tokenData[id].details;
        require(CalendarLike(calendar).canTransfer(details.profession, details.timezone, details.overtimeUntil), "NOT_ON_DUTY");

        // Underflow of the sender's balance is impossible because we check for
        // ownership above and the recipient's balance can't realistically overflow.
        unchecked {
            _balanceOf[from]--;

            _balanceOf[to]++;
        }

        _tokenData[id].owner = to;

        delete getApproved[id];

        emit Transfer(from, to, id);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 id
    ) public virtual {
        transferFrom(from, to, id);

        require(
            to.code.length == 0 ||
                ERC721TokenReceiver(to).onERC721Received(msg.sender, from, id, "") ==
                ERC721TokenReceiver.onERC721Received.selector,
            "UNSAFE_RECIPIENT"
        );
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        bytes calldata data
    ) public virtual {
        transferFrom(from, to, id);

        require(
            to.code.length == 0 ||
                ERC721TokenReceiver(to).onERC721Received(msg.sender, from, id, data) ==
                ERC721TokenReceiver.onERC721Received.selector,
            "UNSAFE_RECIPIENT"
        );
    }

    /*//////////////////////////////////////////////////////////////
                              VIEW FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    function tokenURI(uint256 id) public view returns (string memory) {
        Details memory details = _tokenData[id].details;
        return RendererLike(renderer).getURI(id, details.profession, details.timezone, details.hourlyRate);
    }

    function ownerOf(uint256 id) public view virtual returns (address owner_) {
        Details memory details = _tokenData[id].details;
        require(CalendarLike(calendar).canTransfer(details.profession, details.timezone, details.overtimeUntil), "NOT_ON_DUTY");

        require((owner_ = _tokenData[id].owner) != address(0), "NOT_MINTED");
    }

    function actualOwnerOf(uint256 id) public view virtual returns (address owner_) {
        require((owner_ = _tokenData[id].owner) != address(0), "NOT_MINTED");
    }

    function balanceOf(address owner_) public view virtual returns (uint256) {
        require(owner_ != address(0), "ZERO_ADDRESS");

        return _balanceOf[owner_];
    }


    /*//////////////////////////////////////////////////////////////
                              ERC165 LOGIC
    //////////////////////////////////////////////////////////////*/

    function supportsInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return
            interfaceId == 0x01ffc9a7 || // ERC165 Interface ID for ERC165
            interfaceId == 0x80ac58cd || // ERC165 Interface ID for ERC721
            interfaceId == 0x5b5e139f; // ERC165 Interface ID for ERC721Metadata
    }

    /*//////////////////////////////////////////////////////////////
                        INTERNAL MINT/BURN LOGIC
    //////////////////////////////////////////////////////////////*/

    function _mint(address to, uint256 id) internal virtual {
        require(to != address(0), "INVALID_RECIPIENT");

        require(_tokenData[id].owner == address(0), "ALREADY_MINTED");

        // Counter overflow is incredibly unrealistic.
        unchecked {
            _balanceOf[to]++;
        }

        _tokenData[id].owner = to;

        emit Transfer(address(0), to, id);
    }

    function _burn(uint256 id) internal virtual {
        address owner_ = _tokenData[id].owner;

        require(owner_ != address(0), "NOT_MINTED");

        // Ownership check above ensures no underflow.
        unchecked {
            _balanceOf[owner_]--;
        }

        delete _tokenData[id];

        delete getApproved[id];

        emit Transfer(owner_, address(0), id);
    }

    /*//////////////////////////////////////////////////////////////
                        INTERNAL SAFE MINT LOGIC
    //////////////////////////////////////////////////////////////*/

    function _safeMint(address to, uint256 id) internal virtual {
        _mint(to, id);

        require(
            to.code.length == 0 ||
                ERC721TokenReceiver(to).onERC721Received(msg.sender, address(0), id, "") ==
                ERC721TokenReceiver.onERC721Received.selector,
            "UNSAFE_RECIPIENT"
        );
    }

    function _safeMint(
        address to,
        uint256 id,
        bytes memory data
    ) internal virtual {
        _mint(to, id);

        require(
            to.code.length == 0 ||
                ERC721TokenReceiver(to).onERC721Received(msg.sender, address(0), id, data) ==
                ERC721TokenReceiver.onERC721Received.selector,
            "UNSAFE_RECIPIENT"
        );
    }
}

/// @notice A generic interface for a contract which properly accepts ERC721 tokens.
/// @author Solmate (https://github.com/Rari-Capital/solmate/blob/main/src/tokens/ERC721.sol)
abstract contract ERC721TokenReceiver {
    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external virtual returns (bytes4) {
        return ERC721TokenReceiver.onERC721Received.selector;
    }
}

interface CalendarLike {
    function canTransfer(uint256 profession, uint256 timezone, uint256 overtimeUntil) external view returns (bool can);
    function rates(uint256 profId) external pure returns(uint8 start, uint8 end);
}

interface RendererLike {
    function getURI(uint256 id, uint256 profession, uint256 timezone, uint256 hourlyRate) external pure returns(string memory uri);
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TypesTester {
    // ———————————————————————————————————————————————
    // Boolean
    bool public testBool;

    // ———————————————————————————————————————————————
    // Unsigned integers (examples: 8,16,32,64,128,256)
    uint8 public u8;
    uint16 public u16;
    uint32 public u32;
    uint64 public u64;
    uint128 public u128;
    uint256 public u256;

    // ———————————————————————————————————————————————
    // Address
    address public testAddress;

    // ———————————————————————————————————————————————
    // String & dynamic bytes
    string public testString;
    bytes public testBytes; // dynamic

    // ———————————————————————————————————————————————
    // Fixed-length bytes
    bytes1 public b1;
    bytes2 public b2;
    bytes4 public b4;
    bytes8 public b8;
    bytes16 public b16;
    bytes32 public b32;

    // ———————————————————————————————————————————————
    // Dynamic array of uint256
    uint256[] public arrU256;

    // ———————————————————————————————————————————————
    // A simple tuple (struct) and an array of them
    struct SimpleStruct {
        uint256 a;
        bool b;
        address c;
    }

    SimpleStruct public testSimpleStruct;
    SimpleStruct[] public simpleArray;

    // ———————————————————————————————————————————————
    // Array of mappings
    mapping(uint256 => uint256)[] public arrayOfMappings;

    // ———————————————————————————————————————————————
    // Nested mappings
    mapping(address => mapping(uint256 => bool)) public nestedMapping;

    // ———————————————————————————————————————————————
    // Nested arrays
    uint256[][] public nestedArray;

    // ———————————————————————————————————————————————
    // Boolean functions
    function setBool(bool _v) external {
        testBool = _v;
    }

    function echoBool(bool _v) external pure returns (bool) {
        return _v;
    }

    // ———————————————————————————————————————————————
    // Unsigned integers functions
    function setU8(uint8 _v) external {
        u8 = _v;
    }

    function setU16(uint16 _v) external {
        u16 = _v;
    }

    function setU32(uint32 _v) external {
        u32 = _v;
    }

    function setU64(uint64 _v) external {
        u64 = _v;
    }

    function setU128(uint128 _v) external {
        u128 = _v;
    }

    function setU256(uint256 _v) external {
        u256 = _v;
    }

    function echoU256(uint256 _v) external pure returns (uint256) {
        return _v;
    }

    // ———————————————————————————————————————————————
    // Address functions
    function setAddress(address _v) external {
        testAddress = _v;
    }

    function echoAddress(address _v) external pure returns (address) {
        return _v;
    }

    // ———————————————————————————————————————————————
    // String & dynamic bytes functions
    function setString(string calldata _v) external {
        testString = _v;
    }

    function setBytes(bytes calldata _v) external {
        testBytes = _v;
    }

    function echoString(
        string calldata _v
    ) external pure returns (string memory) {
        return _v;
    }

    function echoBytes(bytes calldata _v) external pure returns (bytes memory) {
        return _v;
    }

    // ———————————————————————————————————————————————
    // Fixed-length bytes functions
    function setB1(bytes1 _v) external {
        b1 = _v;
    }

    function setB2(bytes2 _v) external {
        b2 = _v;
    }

    function setB4(bytes4 _v) external {
        b4 = _v;
    }

    function setB8(bytes8 _v) external {
        b8 = _v;
    }

    function setB16(bytes16 _v) external {
        b16 = _v;
    }

    function setB32(bytes32 _v) external {
        b32 = _v;
    }

    function echoB32(bytes32 _v) external pure returns (bytes32) {
        return _v;
    }

    // ———————————————————————————————————————————————
    // Dynamic array functions
    function setArrU256(uint256[] calldata _v) external {
        delete arrU256;
        for (uint i = 0; i < _v.length; i++) {
            arrU256.push(_v[i]);
        }
    }

    function echoArrU256(
        uint256[] calldata _v
    ) external pure returns (uint256[] memory) {
        return _v;
    }

    // ———————————————————————————————————————————————
    // Struct functions
    function setSimpleStruct(uint256 _a, bool _b, address _c) external {
        testSimpleStruct = SimpleStruct({a: _a, b: _b, c: _c});
    }

    function echoSimpleStruct(
        uint256 _a,
        bool _b,
        address _c
    ) external pure returns (SimpleStruct memory) {
        return SimpleStruct(_a, _b, _c);
    }

    function setSimpleStructArray(SimpleStruct[] calldata _v) external {
        delete simpleArray;
        for (uint i = 0; i < _v.length; i++) {
            simpleArray.push(_v[i]);
        }
    }

    function echoSimpleStructArray(
        SimpleStruct[] calldata _v
    ) external pure returns (SimpleStruct[] memory) {
        return _v;
    }

    // ———————————————————————————————————————————————
    // Array of mappings functions
    function setArrayOfMappings(
        uint256 index,
        uint256 key,
        uint256 value
    ) external {
        // Ensure the array is large enough
        while (arrayOfMappings.length <= index) {
            arrayOfMappings.push();
        }
        arrayOfMappings[index][key] = value;
    }

    function getArrayOfMappings(
        uint256 index,
        uint256 key
    ) external view returns (uint256) {
        require(index < arrayOfMappings.length, "Index out of bounds");
        return arrayOfMappings[index][key];
    }

    // ———————————————————————————————————————————————
    // Nested mappings functions
    function setNestedMapping(address addr, uint256 key, bool value) external {
        nestedMapping[addr][key] = value;
    }

    function getNestedMapping(
        address addr,
        uint256 key
    ) external view returns (bool) {
        return nestedMapping[addr][key];
    }

    // ———————————————————————————————————————————————
    // Nested arrays functions
    function setNestedArray(uint256 index, uint256[] calldata values) external {
        if (index > nestedArray.length) {
            revert("Index out of bounds");
        }

        if (index == nestedArray.length) {
            nestedArray.push();
        }

        // Set the inner array
        nestedArray[index] = values;
    }

    function getNestedArray(
        uint256 outerIndex,
        uint256 innerIndex
    ) external view returns (uint256) {
        require(outerIndex < nestedArray.length, "Outer index out of bounds");
        require(
            innerIndex < nestedArray[outerIndex].length,
            "Inner index out of bounds"
        );
        return nestedArray[outerIndex][innerIndex];
    }

    // ———————————————————————————————————————————————
    // Native token transfer function
    function sendNativeToken(address payable _to) external payable {
        // Transfer the native token (ETH) to the specified address
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Transfer failed");
    }
}

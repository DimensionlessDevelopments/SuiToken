// SPDX-License-Identifier: Apache-2.0
//// Token Contract for SUI on move by DimensionlessDevelopments

// Module declaration & imports for Token creation
module developments::dimension{
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url};

    // Name matches the module name but in UPPERCASE
    public struct DIMENSION has drop {}

    // Module initializer is called once on module being published.
    // A treasury cap is sent to the publisher, who then controls minting and burning.
    fun init(witness: DIMENSION, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 8, b"DIME", b"DIMENSION", b"", option::some(url::new_unsafe_from_bytes(b"https://www.dimensionlessdevelopments.com/assets/logo-d5e35e4f.svg")), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury: &mut coin::TreasuryCap<DIMENSION>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)

    }
}
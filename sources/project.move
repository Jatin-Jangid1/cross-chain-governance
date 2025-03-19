module CrossChainDAO::Governance {

    use aptos_framework::signer;

    struct Proposal has store, key {
        description: vector<u8>,
        votes: u64,
    }

    /// Create a governance proposal
    public fun propose_decision(owner: &signer, description: vector<u8>) {
        let proposal = Proposal {
            description,
            votes: 0,
        };
        move_to(owner, proposal);
    }

    /// Vote on an existing proposal
    public fun vote_on_decision(voter: &signer, proposer: address) acquires Proposal {
        let proposal = borrow_global_mut<Proposal>(proposer);
        proposal.votes = proposal.votes + 1;
    }
}


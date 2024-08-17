module owner_addr::demo{
    use std::string::String;
    use std::debug;
    use std::signer;

    struct Info has store{
        value: String
    }

    struct User has key{
        info: Info
    }

    const ID: u64 = 111;
    const ENOT_CORRECT:u64 = 1;

    public entry fun store_user(account: &signer, id: u64, user_id: String){
        assert!(id == ID, ENOT_CORRECT);
        let data = Info { value: user_id };
        move_to(account, User {info: data});

    }

    public fun get_user(account: &signer)acquires User{
        let username = borrow_global<User>(signer::address_of(account)).info.value;
        debug::print(&username)
    }





}
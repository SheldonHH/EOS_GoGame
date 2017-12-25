#include "wuziqi.hpp"
//#include "MoveChess.cpp"

/**
 *  The init() and apply() methods must have C calling convention so that the blockchain can lookup and
 *  call these methods.
 */
using namespace eosio;
void db_array_to_board(uint8_t (&board)[9][9], uint8_t (&db_array)[81]) {
    uint8_t b = 0;
    uint8_t g = 0;
    for (uint8_t i = 0; i < 81; i++) {
        board[g][b] = db_array[i];
        if (b == 8) {
            g++;
            b = 0;
        } else {
            b++;
        }
    }
}



void acceptmatch( Acceptmatch_message message ) {
    require_auth( message.player );
    matchrequest request;
    request.opponent = message.opponent;
    bool find_request = RequestTable::get(request, message.player);
    assert(find_request, "Could not find a request with that opponent.");
    assert(!request.status, "The match has already started or is over.");
    matchrequest requested;
    requested.opponent = message.player;
    bool find_requested = RequestedTable::get(requested, message.opponent);
    assert(find_requested, "Could not find a request with that opponent.");
    assert(!requested.status, "The match has already started or is over.");
    match find_match;
    find_match.matchid = requested.matchid;
    bool get_match = MatchTable::get(find_match, message.opponent);
    request.status = 1;
    requested.status = 1;
    find_match.status = 1;
    bool update_request = RequestTable::update(request, message.player);
    bool update_requested = RequestedTable::update(requested, message.opponent);
    bool update_match = MatchTable::update(find_match, message.opponent);
    assert(update_request && update_requested && update_match && get_match, "Could not update match status.");
}

void declinematch( Acceptmatch_message message ) {
    require_auth( message.player );
    matchrequest request;
    request.opponent = message.opponent;
    bool find_request = RequestTable::get(request, message.player);
    assert(find_request, "Could not find a request with that opponent.");
    assert(!request.status, "The match has already started or is over.");
    matchrequest requested;
    requested.opponent = message.player;
    bool find_requested = RequestedTable::get(requested, message.opponent);
    assert(find_requested, "Could not find a request with that opponent.");
    assert(!requested.status, "The match has already started or is over.");
    request.status = 2;
    requested.status = 2;
    bool update_request = RequestTable::update(request, message.player);
    bool update_requested = RequestedTable::update(requested, message.opponent);
    assert(update_request && update_requested, "Could not update match status.");
    match new_match;
    new_match.matchid = request.matchid;
    bool remove_match = MatchTable::remove(new_match, message.opponent);
    assert(remove_match, "Could not remove match."+request.matchid+name(request.matchid));
//    assert(remove_match, "can remove match."+request.matchid+name(request.matchid));
    print("request.matchid+name(request.matchid): ", name(request.matchid));
    print("request.matchid+request.matchid: ", request.matchid);


}

void matchmaking( Matchmaking_message message ) {
    require_auth( message.player );
    Matchmaking_message ad;
    ad.player = message.player;
    ad.status = message.status;
    bool findad = MatchMakingTable::get(ad);
    if(findad) {
        bool updatead =  MatchMakingTable::update(ad);
    } else {
        bool publishad =  MatchMakingTable::store(ad);
    }
}

void claimwin( Claimwin_message message ) {
    require_auth( message.player );
    match match_query;
    match_query.matchid = message.matchid;
    bool find_match = MatchTable::get(match_query, message.host);
    assert(find_match, "Could not find match.");
    assert(match_query.white == message.player || match_query.black == message.player, "Could not find player in this match.");
    assert(match_query.status == 1, "The match is already over or has not been started.");
    uint32_t time = now();
    assert(time >= match_query.lastmovetime + match_query.maxmoveinterval, "Your opponent still has time left to make a move.");
    match_query.status = 3;
    matchrequest request;
    matchrequest requested;
    request.opponent = message.host;
    bool update_request =  RequestTable::update(request, match_query.opponent);
    requested.opponent = match_query.opponent;
    bool update_requested =  RequestedTable::update(requested, message.host);
    bool update_match =  MatchTable::update(match_query, message.host);
    assert(update_request && update_requested && update_match, "Could not update match and request.");
}



void newmatch(Newmatch_message message) {
    require_auth( message.player );
    matchrequest player;
    player.opponent = message.opponent;
    bool find_requested = RequestedTable::get(player, message.player);
    assert(message.maxmoveinterval, "You have to specify a max move interval in seconds.");
    assert(!find_requested, "You already sent a match reuqest to this player.");
    match id;
    int32_t find_matchid = back_i64( message.player, N(tiffanylee), N(matches), &id, sizeof(match) );
    player.matchid = (id.matchid) ? id.matchid + 1 : 1;
    player.opponentside = (message.side) ? 0 : 1;
    player.maxmoveinterval = message.maxmoveinterval;
    player.lastmovetime = 0;
    matchrequest opponent;
    opponent.opponent = message.player;
    opponent.matchid =  player.matchid;
    opponent.opponentside = (!message.side) ? 0 : 1;
    opponent.maxmoveinterval = message.maxmoveinterval;
    opponent.lastmovetime = 0;
    match new_match;
    new_match.matchid = player.matchid;
    bool find_match = MatchTable::get(new_match, message.player);
    assert(!find_match, "Could not find previous match");
    new_match.white = (!message.side) ? message.player : message.opponent;
    new_match.black = (!message.side) ? message.opponent : message.player;
    new_match.opponent = message.opponent;
    new_match.maxmoveinterval = message.maxmoveinterval;
    new_match.status = 0;
    new_match.lastmoveside = 2;
    new_match.moveswhite = 0;
    new_match.movesblack = 0;
    new_match.matchstart = 0;
    new_match.check = 10;
    new_match.kings[0] = 7;
    new_match.kings[1] = 4;
    new_match.kings[2] = 0;
    new_match.kings[3] = 4;
//    uint8_t wuziqipan [15][15] = {
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0},
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//            { 0 , 0 , 0 , 0, 0 , 0 , 0 , 0,  0 , 0 , 0 , 0, 0 , 0 , 0 },
//    };
    uint8_t b = 0;
    uint8_t g = 0;
    for (uint8_t i = 0; i < 81; i++) {
        new_match.board[i] = 0;
//        if (b == 14) {
//            g++;
//            b = 0;
//        } else {
//            b++;
//        }
    }
    new_match.lastmove[0] = 10;
    new_match.lastmove[1] = 10;
    new_match.lastmove[2] = 10;
    new_match.lastmove[3] = 10;
    new_match.lastmove[4] = 10;
    new_match.castling[0] = 0;
    new_match.castling[1] = 0;
    new_match.castling[2] = 0;
    new_match.castling[3] = 0;
    bool storerequested =  RequestedTable::store(player, message.player);
    bool storerequest =  RequestTable::store(opponent, message.opponent);
    bool storematch =  MatchTable::store(new_match, message.player);
    assert(storerequested && storerequest, "Could not store match request.");
    assert(storematch, "Could not store match.");
    print("Created match and match request successfully");
}





void quitgame(Reset_message message){
//    match match_query; match_query.matchid = 1;
//    bool remove_match = MatchTable::remove(match_query, message.opponent);
//    assert(remove_match,"didnot remove match: "+name(message.matchid));

    require_auth( message.player );
    matchrequest player;
    player.opponent = message.opponent;
    bool find_requested = RequestedTable::get(player, message.player);
    assert(!find_requested, "You already sent a match request to this player.");
    assert(find_requested,"没找到");

    bool remove_requested = RequestedTable::remove(player, message.opponent);
    assert(remove_requested,"didnot remove requested");



    matchrequest request;
    request.opponent = message.opponent;
    bool remove_request = RequestTable::remove(request, message.player);
    assert(remove_request,"didnot remove request");


    bool trump = false;
    assert(trump, "quit succesfully");
}



void judgewin(JudgeWin_message  message) {
    bool great = true;
    bool trump = false;
    assert(great, "Great am here");
//    assert(trump, "Trump am here");
    require_auth(message.player);

    print(" Welcome to dianpress: \n here is your message.host: " + name(message.host) + name(message.matchid));


    match match_query;
    match_query.matchid = message.matchid;
    bool match_exist = MatchTable::get(match_query, message.host);
    assert(match_query.status == 1, "Match was not accepted or is already over ");
    assert(match_exist, "Match not found!");


    assert(match_query.white == message.player || match_query.black == message.player, "Player not found!");
    assert(match_query.white == message.host || match_query.black == message.host, "Host not found!");
    matchrequest request;
    request.opponent = message.host;
//
    char message_host[] = "xpmessage.host_name():";
    const char *ptr = &message_host[0];
    print(ptr, name(message.host));

    matchrequest requested;
    requested.opponent = match_query.opponent;
    print("\n\n\nname(requested.opponent): " + name(requested.opponent));

    uint8_t player_side;
    (match_query.white == message.player) ? player_side = 0 : player_side = 1;
    assert(player_side != match_query.lastmoveside, "It's not your turn!");
    print("\n(match_query.lastmoveside): ", name(match_query.lastmoveside));

    uint8_t board[9][9];
    db_array_to_board(board, match_query.board);


    uint8_t piece;
    if(message.indicator == 99) {
        piece = board[message.pss[0]][message.pss[1]];
    }else{
        piece = board[message.pss[1]][message.pss[0]];
    }
    assert(piece == 0, "这里已经有子了，不能落子");



    uint8_t t, x, y;
    print("进来了");

    if(message.indicator == 99) {
        if (message.host == message.player) {
            print("black");
            board[message.pss[0]][message.pss[1]] = 2;
            t = 2;
        } else {
            print("white");

            board[message.pss[0]][message.pss[1]] = 1;
            t = 1;
        }x = message.pss[0]; y = message.pss[1];
    }else{
        if (message.host == message.player) {
            print("black");
            board[message.pss[1]][message.pss[0]] = 2;
            t = 2;
        } else {
            print("white");

            board[message.pss[1]][message.pss[0]] = 1;
            t = 1;
        }x = message.pss[1]; y = message.pss[0];
    }






    bool win =false;
    // 一三象限
    if (x >= 0 && y >= 0 && t == board[x][y] && t == board[x + 1][y + 1] && t == board[x + 2][y + 2] &&
        t == board[x + 3][y + 3] && t == board[x + 4][y + 4]) {
        win = true;
//        assert(!win, "You win!!");
        assert(!win, "You win x >= 0");
    }

    if (x >= 1 && y >= 1 && t == board[x - 1][y - 1] && t == board[x][y] && t == board[x + 1][y + 1] &&
        t == board[x + 2][y + 2] && t == board[x + 3][y + 3]) {
        win = true;
//        assert(!win, "You win!!");
        assert(!win, "You win x >= 1");
    }
    if (x >= 2 && y >= 2 && t == board[x - 2][y - 2] && t == board[x - 1][y - 1] && t == board[x][y] &&
        t == board[x + 1][y + 1] && t == board[x + 2][y + 2]) {
        win = true;
//        assert(!win, "You win!!");
        assert(!win, "You win x >= 2");
    }

    if (x >= 3 && y >= 3 && t == board[x - 3][y - 3] && t == board[x - 2][y - 2] && t == board[x - 1][y - 1] &&
        t == board[x][y] && t == board[x + 1][y + 1]) {
        win = true;
//        assert(!win, "You win!!");
        assert(!win, "You win x >= 3");
    }

    if (x >= 4 && y >= 4 && t == board[x - 4][y - 4] && t == board[x - 3][y - 3] && t == board[x - 2][y - 2] &&
        t == board[x - 1][y - 1] && t == board[x][y]) {
        win = true;
//        assert(!win, "You win!!");
        assert(!win, "You win x >= 4");

    }



    //二四象限
    if (x >= 4 && y >= 0 && t == board[x][y] && t == board[x - 1][y + 1] && t == board[x - 2][y + 2] &&
        t == board[x - 3][y + 3] && t == board[x - 4][y + 4]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 4  && y >= 0 ");
    }
    if (x >= 3 && y >= 1 && t == board[x + 1][y - 1] && t == board[x][y] && t == board[x - 1][y + 1] &&
        t == board[x - 2][y + 2] && t == board[x - 3][y + 3]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 3  && y >= 1 ");
    }
    if (x >= 2 && y >= 2 && t == board[x + 2][y - 2] && t == board[x + 1][y - 1] && t == board[x][y] &&
        t == board[x - 1][y + 1] && t == board[x - 2][y + 2]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 2  && y >= 2");
    }
    if (x >= 1 && y >= 3 && t == board[x + 3][y - 3] && t == board[x + 2][y - 2] && t == board[x + 1][y - 1] &&
        t == board[x][y] && t == board[x - 1][y + 1]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, " You winx >= 1  && y >= 3 ");
    }
    if (x >= 0 && y >= 4 && t == board[x + 4][y - 4] && t == board[x + 3][y + 3] && t == board[x + 2][y - 2] &&
        t == board[x + 1][y - 1] && t == board[x][y]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 0  && y >= 4 ");
    }





    //y
    if (y >= 4 && t == board[x][y - 4] && t == board[x][y - 3] && t == board[x][y - 2] && t == board[x][y - 1] &&
        t == board[x][y]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win y >= 4");
    }

    if (y >= 3 && t == board[x][y - 3] && t == board[x][y - 2] && t == board[x][y - 1] && t == board[x][y] &&
        t == board[x][y + 1]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win y >= 3");
    }

    if (y >= 2 && t == board[x][y - 2] && t == board[x][y - 1] && t == board[x][y] && t == board[x][y + 1] &&
        t == board[x][y + 2]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win y >= 2");
    }
    if (y >= 1 && t == board[x][y - 1] && t == board[x][y] && t == board[x][y + 1] && t == board[x][y + 2] &&
        t == board[x][y + 3]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win y >= 1");
    }

    if (y >= 0 && t == board[x][y] && t == board[x][y + 1] && t == board[x][y + 2] && t == board[x][y + 3] &&
        t == board[x][y + 4]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win y >= 0");
    }





    // x
    if (x >= 0 && t == board[x][y] && t == board[x + 1][y] && t == board[x + 2][y] && t == board[x + 3][y] &&
        t == board[x + 4][y]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 0");
    }
    if (x >= 1 && t == board[x - 1][y] && t == board[x][y] && t == board[x + 1][y] && t == board[x + 2][y] &&
        t == board[x + 3][y]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 1");
    }
    if (x >= 2 && t == board[x - 2][y] && t == board[x - 1][y] && t == board[x][y] && t == board[x + 1][y] &&
        t == board[x + 2][y]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 2");
    }
    if (x >= 3 && t == board[x - 3][y] && t == board[x - 2][y] && t == board[x - 1][y] && t == board[x][y] &&
        t == board[x + 1][y]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 3");
    }
    if (x >= 4 && t == board[x - 4][y] && t == board[x + 3][y] && t == board[x - 2][y] && t == board[x - 1][y] &&
        t == board[x][y]) {
        win = true;
//        assert(!win, "你赢了！！");
        assert(!win, "You win x >= 4");
    }


    assert(!win, "你赢了！！");
}




//matchId, pss, player, host
void dianpress(Pressdian_message  message){
    bool great = true;
    bool trump = false;
    assert(great, "Great am here");
//    assert(trump, "Trump am here");
    require_auth( message.player );

    print(" Welcome to dianpress: \n here is your message.host: "+ name(message.host) +name(message.matchid));



    match match_query;
    match_query.matchid = message.matchid;
    bool match_exist = MatchTable::get(match_query, message.host);
    assert( match_query.status == 1, "Match was not accepted or is already over " );
    assert( match_exist, "Match not found!" );


    assert( match_query.white == message.player || match_query.black == message.player, "Player not found!" );
    assert( match_query.white == message.host || match_query.black == message.host, "Host not found!" );
    matchrequest request;
    request.opponent = message.host;
//
    char message_host []= "xpmessage.host_name():";
    const char *ptr = &message_host[0];
    print(ptr, name(message.host));

    matchrequest requested;
    requested.opponent = match_query.opponent;
    print("\n\n\nname(requested.opponent): "+name(requested.opponent));

    uint8_t player_side;
    (match_query.white == message.player) ?  player_side = 0 : player_side = 1;
    assert( player_side != match_query.lastmoveside, "It's not your turn!" );
    print( "\n(match_query.lastmoveside): ", name(match_query.lastmoveside));

    uint8_t board[9][9];
    db_array_to_board(board, match_query.board);
    uint8_t piece = 0;
    if(message.indicator == 99) {
        uint8_t piece = board[message.pss[0]][message.pss[1]];
    }else{
        uint8_t piece = board[message.pss[1]][message.pss[0]];
    }
    assert(piece == 0, "这里已经有子了，不能落子");



    uint8_t t = 0;
        print("进来了");

    if(message.indicator == 99) {
        if (message.host == message.player) {
            print("black");
            board[message.pss[0]][message.pss[1]] = 2;
            t = 2;
        } else {
            print("white");

            board[message.pss[0]][message.pss[1]] = 1;
            t = 1;
        }
    }else{
        if (message.host == message.player) {
            print("black");
            board[message.pss[1]][message.pss[0]] = 2;
            t = 2;
        } else {
            print("white");

            board[message.pss[1]][message.pss[0]] = 1;
            t = 1;
        }
    }




    match_query.lastmoveside = player_side;
    print("match_query.lastmoveside: ", name(match_query.lastmoveside));

    uint8_t b = 0;
    uint8_t g = 0;
    for (uint8_t i = 0; i < 81; i++) {
        match_query.board[i] = board[g][b];
        if (b == 8) {
            g++;
            b = 0;
        } else {
            b++;
        }
    }

    const char *comma = ",";
    for (uint8_t i = 0; i < 81; i++) {
        print(comma, name(match_query.board[i]));

    }

    if (match_query.matchstart == 0) {
        match_query.matchstart = now();
    }
    if (match_query.white == message.host) {
        request.opponentside = 0;
        requested.opponentside = 1;
    } else {
        request.opponentside = 1;
        requested.opponentside = 0;
    }
//
    request.maxmoveinterval = match_query.maxmoveinterval;
    request.matchid = match_query.matchid;
    request.lastmovetime = match_query.lastmovetime;
    request.status = 1;
    request.matchstart = match_query.matchstart;
    requested.matchid = match_query.matchid;
    requested.lastmovetime = match_query.lastmovetime;
    requested.maxmoveinterval = match_query.maxmoveinterval;
    requested.status = 1;
    requested.matchstart = match_query.matchstart;
    bool update_request =  RequestTable::update(request, match_query.opponent);
    bool update_requested =  RequestedTable::update(requested, message.host);
    bool update_match =  MatchTable::update(match_query, message.host);



}



extern "C" {

void init()  {

}
/// The apply method implements the dispatch of events to this contract
void apply( uint64_t code, uint64_t action ) {
    if ( code == N(tiffanylee) ) {
        switch ( action ) {
            case N( newmatch ):
                newmatch( current_message<Newmatch_message>() );
                break;
            case N( acceptmatch ):
                acceptmatch( current_message<Acceptmatch_message>() );
                break;
            case N( judgewin ):
                judgewin( current_message<JudgeWin_message>() );
                break;
            case N( dianpress ):
                dianpress( current_message<Pressdian_message>() );
                break;
            case N( quitgame ):
                quitgame( current_message<Reset_message>() );
                break;
            case N( declinematch ):
                declinematch( current_message<Acceptmatch_message>() );
                break;
//            case N( movepiece ):
//                movepiece( current_message<Move_message>() );
//                break;
//            case N( castling ):
//                castling( current_message<Castling_message>() );
//                break;
            case N( claimwin ):
                claimwin( current_message<Claimwin_message>() );
                break;
            case N( matchmaking ):
                matchmaking( current_message<Matchmaking_message>() );
                break;
            default:
                assert( false, "unknown action，没加到apply里面" );
        }
    }
}
} // extern "C"

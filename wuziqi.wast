(module
 (type $FUNCSIG$vj (func (param i64)))
 (type $FUNCSIG$ijjjii (func (param i64 i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$ijjii (func (param i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$ijji (func (param i64 i64 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (import "env" "assert" (func $assert (param i32 i32)))
 (import "env" "back_i64" (func $back_i64 (param i64 i64 i64 i32 i32) (result i32)))
 (import "env" "load_i64" (func $load_i64 (param i64 i64 i64 i32 i32) (result i32)))
 (import "env" "now" (func $now (result i32)))
 (import "env" "printi" (func $printi (param i64)))
 (import "env" "printn" (func $printn (param i64)))
 (import "env" "prints" (func $prints (param i32)))
 (import "env" "read_message" (func $read_message (param i32 i32) (result i32)))
 (import "env" "remove_i64" (func $remove_i64 (param i64 i64 i32) (result i32)))
 (import "env" "require_auth" (func $require_auth (param i64)))
 (import "env" "store_i64" (func $store_i64 (param i64 i64 i32 i32) (result i32)))
 (import "env" "update_i64" (func $update_i64 (param i64 i64 i32 i32) (result i32)))
 (table 0 anyfunc)
 (memory $0 1)
 (data (i32.const 4) "\90G\00\00")
 (data (i32.const 16) "Could not find a request with that opponent.\00")
 (data (i32.const 64) "The match has already started or is over.\00")
 (data (i32.const 112) "Could not update match status.\00")
 (data (i32.const 144) "Could not remove match.\00")
 (data (i32.const 176) "request.matchid+name(request.matchid): \00")
 (data (i32.const 224) "request.matchid+request.matchid: \00")
 (data (i32.const 272) "Could not find match.\00")
 (data (i32.const 304) "Could not find player in this match.\00")
 (data (i32.const 352) "The match is already over or has not been started.\00")
 (data (i32.const 416) "Your opponent still has time left to make a move.\00")
 (data (i32.const 480) "Could not update match and request.\00")
 (data (i32.const 528) "You have to specify a max move interval in seconds.\00")
 (data (i32.const 592) "You already sent a match reuqest to this player.\00")
 (data (i32.const 656) "chess\00")
 (data (i32.const 672) "matches\00")
 (data (i32.const 688) "Could not find previous match\00")
 (data (i32.const 720) "Could not store match request.\00")
 (data (i32.const 752) "Could not store match.\00")
 (data (i32.const 784) "Created match and match request successfully\00")
 (data (i32.const 832) "You already sent a match request to this player.\00")
 (data (i32.const 896) "\e6\b2\a1\e6\89\be\e5\88\b0\00")
 (data (i32.const 912) "didnot remove requested\00")
 (data (i32.const 944) "didnot remove request\00")
 (data (i32.const 976) "quit succesfully\00")
 (data (i32.const 1008) "Great am here\00")
 (data (i32.const 1024) " Welcome to dianpress: \n here is your message.host: \00")
 (data (i32.const 1088) "Match was not accepted or is already over \00")
 (data (i32.const 1136) "Match not found!\00")
 (data (i32.const 1168) "Player not found!\00")
 (data (i32.const 1200) "Host not found!\00")
 (data (i32.const 1216) "xpmessage.host_name():\00")
 (data (i32.const 1248) "\n\n\nname(requested.opponent): \00")
 (data (i32.const 1280) "It\'s not your turn!\00")
 (data (i32.const 1312) "\n(match_query.lastmoveside): \00")
 (data (i32.const 1344) "\e8\bf\9b\e6\9d\a5\e4\ba\86\00")
 (data (i32.const 1360) "host\00")
 (data (i32.const 1376) "\e5\ae\a2\e4\ba\ba\00")
 (data (i32.const 1392) "\e4\b8\80\e4\b8\89\e8\b1\a1\e9\99\90\ef\bc\8cx >= 0\00")
 (data (i32.const 1424) "\e4\b8\80\e4\b8\89\e8\b1\a1\e9\99\90x >= 1\00")
 (data (i32.const 1456) "\e4\b8\80\e4\b8\89\e8\b1\a1\e9\99\90x >= 2\00")
 (data (i32.const 1488) "\e4\b8\80\e4\b8\89\e8\b1\a1\e9\99\90x >= 3\00")
 (data (i32.const 1520) "\e4\b8\80\e4\b8\89\e8\b1\a1\e9\99\90x >= 4\00")
 (data (i32.const 1552) "\e4\bd\a0\e8\b5\a2\e4\ba\86\ef\bc\81\ef\bc\81\00")
 (data (i32.const 1568) "x >= 1  && y >= 3 \00")
 (data (i32.const 1600) "x >= 0  && y >= 4 \00")
 (data (i32.const 1632) "y >= 4\00")
 (data (i32.const 1648) "y >= 3\00")
 (data (i32.const 1664) "y >= 2\00")
 (data (i32.const 1680) "y >= 1\00")
 (data (i32.const 1696) "y >= 0\00")
 (data (i32.const 1712) "x >= 0\00")
 (data (i32.const 1728) "x >= 1\00")
 (data (i32.const 1744) "x >= 2\00")
 (data (i32.const 1760) "x >= 3\00")
 (data (i32.const 1776) "x >= 4\00")
 (data (i32.const 1792) "black\00")
 (data (i32.const 1808) "white\00")
 (data (i32.const 1824) "match_query.lastmoveside: \00")
 (data (i32.const 1856) "message shorter than expected\00")
 (data (i32.const 1888) "unknown action\ef\bc\8c\e6\b2\a1\e5\8a\a0\e5\88\b0apply\e9\87\8c\e9\9d\a2\00")
 (export "memory" (memory $0))
 (export "_Z17db_array_to_boardRA9_A9_hRA81_h" (func $_Z17db_array_to_boardRA9_A9_hRA81_h))
 (export "_Z14get_piece_typeh" (func $_Z14get_piece_typeh))
 (export "_Z16add_piece_configRA6_hRA6_Kh" (func $_Z16add_piece_configRA6_hRA6_Kh))
 (export "_Z10piece_sideh" (func $_Z10piece_sideh))
 (export "_Z12detect_checkRA8_A8_hhhRbb" (func $_Z12detect_checkRA8_A8_hhhRbb))
 (export "_Z11acceptmatch19Acceptmatch_message" (func $_Z11acceptmatch19Acceptmatch_message))
 (export "_Z12declinematch19Acceptmatch_message" (func $_Z12declinematch19Acceptmatch_message))
 (export "_Z11matchmaking19Matchmaking_message" (func $_Z11matchmaking19Matchmaking_message))
 (export "_Z8claimwin16Claimwin_message" (func $_Z8claimwin16Claimwin_message))
 (export "_Z8newmatch16Newmatch_message" (func $_Z8newmatch16Newmatch_message))
 (export "_Z8quitgame13Reset_message" (func $_Z8quitgame13Reset_message))
 (export "_Z8judgewin16JudgeWin_message" (func $_Z8judgewin16JudgeWin_message))
 (export "_Z9dianpress17Pressdian_message" (func $_Z9dianpress17Pressdian_message))
 (export "init" (func $init))
 (export "apply" (func $apply))
 (func $_Z17db_array_to_boardRA9_A9_hRA81_h (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (set_local $3
   (i32.const 0)
  )
  (set_local $4
   (i32.const 0)
  )
  (set_local $5
   (i32.const 0)
  )
  (loop $label$0
   (i32.store8
    (i32.add
     (i32.add
      (get_local $0)
      (i32.mul
       (i32.and
        (get_local $4)
        (i32.const 255)
       )
       (i32.const 9)
      )
     )
     (tee_local $2
      (i32.and
       (get_local $5)
       (i32.const 255)
      )
     )
    )
    (i32.load8_u
     (i32.add
      (get_local $1)
      (get_local $3)
     )
    )
   )
   (set_local $5
    (select
     (i32.const 0)
     (i32.add
      (get_local $5)
      (i32.const 1)
     )
     (tee_local $2
      (i32.eq
       (get_local $2)
       (i32.const 8)
      )
     )
    )
   )
   (set_local $4
    (i32.add
     (get_local $2)
     (get_local $4)
    )
   )
   (br_if $label$0
    (i32.ne
     (tee_local $3
      (i32.add
       (get_local $3)
       (i32.const 1)
      )
     )
     (i32.const 81)
    )
   )
  )
 )
 (func $_Z14get_piece_typeh (param $0 i32) (result i32)
  (local $1 i32)
  (set_local $1
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.gt_u
     (tee_local $0
      (i32.add
       (get_local $0)
       (i32.const -12)
      )
     )
     (i32.const 25)
    )
   )
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_table $label$4 $label$5 $label$3 $label$2 $label$1 $label$5 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$0 $label$4 $label$5 $label$3 $label$2 $label$1 $label$5 $label$4
         (get_local $0)
        )
       )
       (set_local $1
        (i32.const 2)
       )
       (br $label$0)
      )
      (set_local $1
       (i32.const 1)
      )
      (br $label$0)
     )
     (set_local $1
      (i32.const 3)
     )
     (br $label$0)
    )
    (set_local $1
     (i32.const 4)
    )
    (br $label$0)
   )
   (set_local $1
    (i32.const 5)
   )
  )
  (i32.and
   (get_local $1)
   (i32.const 255)
  )
 )
 (func $_Z16add_piece_configRA6_hRA6_Kh (param $0 i32) (param $1 i32)
  (i32.store8
   (get_local $0)
   (i32.load8_u
    (get_local $1)
   )
  )
  (i32.store8 offset=1
   (get_local $0)
   (i32.load8_u offset=1
    (get_local $1)
   )
  )
  (i32.store8 offset=2
   (get_local $0)
   (i32.load8_u offset=2
    (get_local $1)
   )
  )
  (i32.store8 offset=3
   (get_local $0)
   (i32.load8_u offset=3
    (get_local $1)
   )
  )
  (i32.store8 offset=4
   (get_local $0)
   (i32.load8_u offset=4
    (get_local $1)
   )
  )
  (i32.store8 offset=5
   (get_local $0)
   (i32.load8_u offset=5
    (get_local $1)
   )
  )
  (i32.store8
   (get_local $0)
   (i32.gt_u
    (i32.and
     (i32.add
      (i32.load8_u
       (get_local $1)
      )
      (i32.const -11)
     )
     (i32.const 255)
    )
    (i32.const 6)
   )
  )
 )
 (func $_Z10piece_sideh (param $0 i32) (result i32)
  (call $printn
   (i64.extend_u/i32
    (get_local $0)
   )
  )
  (select
   (i32.gt_u
    (i32.and
     (i32.add
      (get_local $0)
      (i32.const -11)
     )
     (i32.const 255)
    )
    (i32.const 6)
   )
   (i32.const 81)
   (get_local $0)
  )
 )
 (func $_Z12detect_checkRA8_A8_hhhRbb (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
 )
 (func $_Z11acceptmatch19Acceptmatch_message (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 240)
    )
   )
  )
  (call $require_auth
   (tee_local $1
    (i64.load align=1
     (get_local $0)
    )
   )
  )
  (i64.store offset=208
   (get_local $3)
   (tee_local $2
    (i64.load offset=8 align=1
     (get_local $0)
    )
   )
  )
  (call $assert
   (i32.eq
    (call $load_i64
     (get_local $1)
     (i64.const 4851938105189466112)
     (i64.const -4995154566124142592)
     (i32.add
      (get_local $3)
      (i32.const 208)
     )
     (i32.const 30)
    )
    (i32.const 30)
   )
   (i32.const 16)
  )
  (call $assert
   (i32.eqz
    (i32.load8_u offset=233
     (get_local $3)
    )
   )
   (i32.const 64)
  )
  (i64.store offset=176
   (get_local $3)
   (get_local $1)
  )
  (call $assert
   (i32.eq
    (call $load_i64
     (get_local $2)
     (i64.const 4851938105189466112)
     (i64.const -4995154566354305024)
     (i32.add
      (get_local $3)
      (i32.const 176)
     )
     (i32.const 30)
    )
    (i32.const 30)
   )
   (i32.const 16)
  )
  (call $assert
   (i32.eqz
    (i32.load8_u offset=201
     (get_local $3)
    )
   )
   (i32.const 64)
  )
  (i32.store8 offset=68
   (get_local $3)
   (i32.const 81)
  )
  (i32.store8 offset=63
   (get_local $3)
   (i32.const 4)
  )
  (i32.store8 offset=150
   (get_local $3)
   (i32.const 5)
  )
  (i32.store8 offset=164
   (get_local $3)
   (i32.const 4)
  )
  (i64.store offset=8
   (get_local $3)
   (i64.load offset=184
    (get_local $3)
   )
  )
  (set_local $0
   (call $load_i64
    (get_local $2)
    (i64.const 4851938105189466112)
    (i64.const -7948142323357974528)
    (i32.add
     (get_local $3)
     (i32.const 8)
    )
    (i32.const 161)
   )
  )
  (i32.store8 offset=233
   (get_local $3)
   (i32.const 1)
  )
  (i32.store8 offset=40
   (get_local $3)
   (i32.const 1)
  )
  (i32.store8 offset=201
   (get_local $3)
   (i32.const 1)
  )
  (call $assert
   (i32.and
    (i32.and
     (i32.ne
      (call $update_i64
       (get_local $1)
       (i64.const -4995154566124142592)
       (i32.add
        (get_local $3)
        (i32.const 208)
       )
       (i32.const 30)
      )
      (i32.const 0)
     )
     (i32.ne
      (call $update_i64
       (get_local $2)
       (i64.const -4995154566354305024)
       (i32.add
        (get_local $3)
        (i32.const 176)
       )
       (i32.const 30)
      )
      (i32.const 0)
     )
    )
    (i32.and
     (i32.eq
      (get_local $0)
      (i32.const 161)
     )
     (i32.ne
      (call $update_i64
       (get_local $2)
       (i64.const -7948142323357974528)
       (i32.add
        (get_local $3)
        (i32.const 8)
       )
       (i32.const 161)
      )
      (i32.const 0)
     )
    )
   )
   (i32.const 112)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 240)
   )
  )
 )
 (func $_Z12declinematch19Acceptmatch_message (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 240)
    )
   )
  )
  (call $require_auth
   (tee_local $1
    (i64.load align=1
     (get_local $0)
    )
   )
  )
  (i64.store offset=208
   (get_local $3)
   (tee_local $2
    (i64.load offset=8 align=1
     (get_local $0)
    )
   )
  )
  (call $assert
   (i32.eq
    (call $load_i64
     (get_local $1)
     (i64.const 4851938105189466112)
     (i64.const -4995154566124142592)
     (i32.add
      (get_local $3)
      (i32.const 208)
     )
     (i32.const 30)
    )
    (i32.const 30)
   )
   (i32.const 16)
  )
  (call $assert
   (i32.eqz
    (i32.load8_u offset=233
     (get_local $3)
    )
   )
   (i32.const 64)
  )
  (i64.store offset=176
   (get_local $3)
   (get_local $1)
  )
  (call $assert
   (i32.eq
    (call $load_i64
     (get_local $2)
     (i64.const 4851938105189466112)
     (i64.const -4995154566354305024)
     (i32.add
      (get_local $3)
      (i32.const 176)
     )
     (i32.const 30)
    )
    (i32.const 30)
   )
   (i32.const 16)
  )
  (call $assert
   (i32.eqz
    (i32.load8_u offset=201
     (get_local $3)
    )
   )
   (i32.const 64)
  )
  (i32.store8 offset=233
   (get_local $3)
   (i32.const 2)
  )
  (i32.store8 offset=201
   (get_local $3)
   (i32.const 2)
  )
  (call $assert
   (i32.and
    (i32.ne
     (call $update_i64
      (get_local $1)
      (i64.const -4995154566124142592)
      (i32.add
       (get_local $3)
       (i32.const 208)
      )
      (i32.const 30)
     )
     (i32.const 0)
    )
    (i32.ne
     (call $update_i64
      (get_local $2)
      (i64.const -4995154566354305024)
      (i32.add
       (get_local $3)
       (i32.const 176)
      )
      (i32.const 30)
     )
     (i32.const 0)
    )
   )
   (i32.const 112)
  )
  (i32.store8 offset=68
   (get_local $3)
   (i32.const 81)
  )
  (i32.store8 offset=63
   (get_local $3)
   (i32.const 4)
  )
  (i32.store8 offset=150
   (get_local $3)
   (i32.const 5)
  )
  (i32.store8 offset=164
   (get_local $3)
   (i32.const 4)
  )
  (i64.store offset=8
   (get_local $3)
   (i64.load offset=216
    (get_local $3)
   )
  )
  (call $assert
   (i32.ne
    (call $remove_i64
     (get_local $2)
     (i64.const -7948142323357974528)
     (i32.add
      (get_local $3)
      (i32.const 8)
     )
    )
    (i32.const 0)
   )
   (i32.add
    (i32.add
     (tee_local $0
      (i32.load offset=216
       (get_local $3)
      )
     )
     (get_local $0)
    )
    (i32.const 144)
   )
  )
  (set_local $1
   (i64.load offset=216
    (get_local $3)
   )
  )
  (call $prints
   (i32.const 176)
  )
  (call $printn
   (get_local $1)
  )
  (set_local $1
   (i64.load offset=216
    (get_local $3)
   )
  )
  (call $prints
   (i32.const 224)
  )
  (call $printi
   (get_local $1)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 240)
   )
  )
 )
 (func $_Z11matchmaking19Matchmaking_message (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $2
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (call $require_auth
   (tee_local $1
    (i64.load align=1
     (get_local $0)
    )
   )
  )
  (i64.store
   (get_local $2)
   (get_local $1)
  )
  (i32.store8 offset=8
   (get_local $2)
   (i32.load8_u offset=8
    (get_local $0)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ne
      (call $load_i64
       (i64.const 4851938105189466112)
       (i64.const 4851938105189466112)
       (i64.const -7948142195306604544)
       (get_local $2)
       (i32.const 9)
      )
      (i32.const 9)
     )
    )
    (drop
     (call $update_i64
      (i64.const 4851938105189466112)
      (i64.const -7948142195306604544)
      (get_local $2)
      (i32.const 9)
     )
    )
    (br $label$0)
   )
   (drop
    (call $store_i64
     (i64.const 4851938105189466112)
     (i64.const -7948142195306604544)
     (get_local $2)
     (i32.const 9)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $2)
    (i32.const 16)
   )
  )
 )
 (func $_Z8claimwin16Claimwin_message (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 240)
    )
   )
  )
  (call $require_auth
   (tee_local $1
    (i64.load offset=8 align=1
     (get_local $0)
    )
   )
  )
  (i32.store8 offset=132
   (get_local $3)
   (i32.const 81)
  )
  (i32.store8 offset=127
   (get_local $3)
   (i32.const 4)
  )
  (i32.store8 offset=214
   (get_local $3)
   (i32.const 5)
  )
  (i32.store8 offset=228
   (get_local $3)
   (i32.const 4)
  )
  (i64.store offset=72
   (get_local $3)
   (i64.load align=1
    (get_local $0)
   )
  )
  (call $assert
   (i32.eq
    (call $load_i64
     (tee_local $2
      (i64.load offset=16 align=1
       (get_local $0)
      )
     )
     (i64.const 4851938105189466112)
     (i64.const -7948142323357974528)
     (i32.add
      (get_local $3)
      (i32.const 72)
     )
     (i32.const 161)
    )
    (i32.const 161)
   )
   (i32.const 272)
  )
  (call $assert
   (i32.or
    (i64.eq
     (get_local $1)
     (i64.load offset=88
      (get_local $3)
     )
    )
    (i64.eq
     (get_local $1)
     (i64.load offset=96
      (get_local $3)
     )
    )
   )
   (i32.const 304)
  )
  (call $assert
   (i32.eq
    (i32.load8_u offset=104
     (get_local $3)
    )
    (i32.const 1)
   )
   (i32.const 352)
  )
  (call $assert
   (i32.ge_u
    (call $now)
    (i32.add
     (i32.load offset=224
      (get_local $3)
     )
     (i32.load offset=220
      (get_local $3)
     )
    )
   )
   (i32.const 416)
  )
  (i32.store8 offset=104
   (get_local $3)
   (i32.const 3)
  )
  (i64.store offset=40
   (get_local $3)
   (get_local $2)
  )
  (set_local $0
   (call $update_i64
    (i64.load offset=80
     (get_local $3)
    )
    (i64.const -4995154566124142592)
    (i32.add
     (get_local $3)
     (i32.const 40)
    )
    (i32.const 30)
   )
  )
  (i64.store offset=8
   (get_local $3)
   (i64.load offset=80
    (get_local $3)
   )
  )
  (call $assert
   (i32.and
    (i32.ne
     (get_local $0)
     (i32.const 0)
    )
    (i32.and
     (i32.ne
      (call $update_i64
       (get_local $2)
       (i64.const -4995154566354305024)
       (i32.add
        (get_local $3)
        (i32.const 8)
       )
       (i32.const 30)
      )
      (i32.const 0)
     )
     (i32.ne
      (call $update_i64
       (get_local $2)
       (i64.const -7948142323357974528)
       (i32.add
        (get_local $3)
        (i32.const 72)
       )
       (i32.const 161)
      )
      (i32.const 0)
     )
    )
   )
   (i32.const 480)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 240)
   )
  )
 )
 (func $_Z8newmatch16Newmatch_message (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $12
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 400)
    )
   )
  )
  (call $require_auth
   (tee_local $1
    (i64.load align=1
     (get_local $0)
    )
   )
  )
  (i64.store offset=368
   (get_local $12)
   (tee_local $3
    (i64.load offset=9 align=1
     (get_local $0)
    )
   )
  )
  (set_local $11
   (call $load_i64
    (get_local $1)
    (i64.const 4851938105189466112)
    (i64.const -4995154566354305024)
    (i32.add
     (get_local $12)
     (i32.const 368)
    )
    (i32.const 30)
   )
  )
  (call $assert
   (tee_local $4
    (i32.load offset=17 align=1
     (get_local $0)
    )
   )
   (i32.const 528)
  )
  (call $assert
   (i32.ne
    (get_local $11)
    (i32.const 30)
   )
   (i32.const 592)
  )
  (i32.store8 offset=260
   (get_local $12)
   (i32.const 81)
  )
  (i32.store8 offset=255
   (get_local $12)
   (i32.const 4)
  )
  (i32.store8 offset=342
   (get_local $12)
   (i32.const 5)
  )
  (i32.store8 offset=356
   (get_local $12)
   (i32.const 4)
  )
  (set_local $2
   (i32.add
    (get_local $0)
    (i32.const 9)
   )
  )
  (set_local $7
   (i64.const 0)
  )
  (set_local $6
   (i64.const 59)
  )
  (set_local $11
   (i32.const 656)
  )
  (set_local $8
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $7)
          (i64.const 4)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $5
             (i32.load8_s
              (get_local $11)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $5
         (i32.add
          (get_local $5)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $9
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $7)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $5
       (select
        (i32.add
         (get_local $5)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $5)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $9
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $5)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $9
     (i64.shl
      (i64.and
       (get_local $9)
       (i64.const 31)
      )
      (i64.and
       (get_local $6)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $11
    (i32.add
     (get_local $11)
     (i32.const 1)
    )
   )
   (set_local $7
    (i64.add
     (get_local $7)
     (i64.const 1)
    )
   )
   (set_local $8
    (i64.or
     (get_local $9)
     (get_local $8)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $6
      (i64.add
       (get_local $6)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (set_local $7
   (i64.const 0)
  )
  (set_local $6
   (i64.const 59)
  )
  (set_local $11
   (i32.const 672)
  )
  (set_local $10
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $7)
          (i64.const 6)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $5
             (i32.load8_s
              (get_local $11)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $5
         (i32.add
          (get_local $5)
          (i32.const 165)
         )
        )
        (br $label$9)
       )
       (set_local $9
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $7)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $5
       (select
        (i32.add
         (get_local $5)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $5)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $9
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $5)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $9
     (i64.shl
      (i64.and
       (get_local $9)
       (i64.const 31)
      )
      (i64.and
       (get_local $6)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $11
    (i32.add
     (get_local $11)
     (i32.const 1)
    )
   )
   (set_local $7
    (i64.add
     (get_local $7)
     (i64.const 1)
    )
   )
   (set_local $10
    (i64.or
     (get_local $9)
     (get_local $10)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $6
      (i64.add
       (get_local $6)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (drop
   (call $back_i64
    (get_local $1)
    (get_local $8)
    (get_local $10)
    (i32.add
     (get_local $12)
     (i32.const 200)
    )
    (i32.const 161)
   )
  )
  (i32.store offset=385 align=1
   (get_local $12)
   (get_local $4)
  )
  (i32.store offset=389 align=1
   (get_local $12)
   (i32.const 0)
  )
  (i64.store offset=376
   (get_local $12)
   (tee_local $7
    (i64.add
     (i64.load offset=200
      (get_local $12)
     )
     (i64.const 1)
    )
   )
  )
  (i32.store8 offset=384
   (get_local $12)
   (i32.eqz
    (tee_local $11
     (i32.load8_u offset=8
      (get_local $0)
     )
    )
   )
  )
  (i64.store offset=176
   (get_local $12)
   (get_local $7)
  )
  (i64.store offset=168
   (get_local $12)
   (get_local $1)
  )
  (i32.store8 offset=184
   (get_local $12)
   (i32.ne
    (get_local $11)
    (i32.const 0)
   )
  )
  (i32.store offset=185 align=1
   (get_local $12)
   (get_local $4)
  )
  (i32.store offset=189 align=1
   (get_local $12)
   (i32.const 0)
  )
  (i32.store8 offset=60
   (get_local $12)
   (i32.const 81)
  )
  (i32.store8 offset=55
   (get_local $12)
   (i32.const 4)
  )
  (i32.store8 offset=142
   (get_local $12)
   (i32.const 5)
  )
  (i32.store8 offset=156
   (get_local $12)
   (i32.const 4)
  )
  (i64.store
   (get_local $12)
   (get_local $7)
  )
  (call $assert
   (i32.ne
    (call $load_i64
     (get_local $1)
     (i64.const 4851938105189466112)
     (i64.const -7948142323357974528)
     (get_local $12)
     (i32.const 161)
    )
    (i32.const 161)
   )
   (i32.const 688)
  )
  (i64.store offset=8
   (get_local $12)
   (get_local $3)
  )
  (i32.store offset=152
   (get_local $12)
   (get_local $4)
  )
  (i32.store8 offset=32
   (get_local $12)
   (i32.const 0)
  )
  (i64.store offset=16
   (get_local $12)
   (i64.load align=1
    (select
     (get_local $2)
     (get_local $0)
     (get_local $11)
    )
   )
  )
  (i64.store offset=24
   (get_local $12)
   (i64.load align=1
    (select
     (get_local $0)
     (get_local $2)
     (get_local $11)
    )
   )
  )
  (i32.store8 offset=33
   (get_local $12)
   (i32.const 2)
  )
  (i64.store offset=34 align=2
   (get_local $12)
   (i64.const 0)
  )
  (i64.store offset=42 align=2
   (get_local $12)
   (i64.const 0)
  )
  (i32.store offset=50 align=2
   (get_local $12)
   (i32.const 0)
  )
  (i32.store8 offset=54
   (get_local $12)
   (i32.const 10)
  )
  (i32.store8 offset=56
   (get_local $12)
   (i32.const 7)
  )
  (i32.store8
   (i32.add
    (get_local $12)
    (i32.const 57)
   )
   (i32.const 4)
  )
  (i32.store8
   (i32.add
    (get_local $12)
    (i32.const 58)
   )
   (i32.const 0)
  )
  (i32.store8
   (i32.add
    (get_local $12)
    (i32.const 59)
   )
   (i32.const 4)
  )
  (set_local $5
   (i32.add
    (get_local $12)
    (i32.const 61)
   )
  )
  (set_local $11
   (i32.const 0)
  )
  (loop $label$12
   (i32.store8
    (i32.add
     (get_local $5)
     (get_local $11)
    )
    (i32.const 0)
   )
   (br_if $label$12
    (i32.ne
     (tee_local $11
      (i32.add
       (get_local $11)
       (i32.const 1)
      )
     )
     (i32.const 81)
    )
   )
  )
  (i32.store8
   (i32.add
    (get_local $12)
    (i32.const 147)
   )
   (i32.const 10)
  )
  (i32.store8
   (i32.add
    (get_local $12)
    (i32.const 158)
   )
   (i32.const 0)
  )
  (i32.store8
   (i32.add
    (get_local $12)
    (i32.const 159)
   )
   (i32.const 0)
  )
  (i32.store8
   (i32.add
    (get_local $12)
    (i32.const 160)
   )
   (i32.const 0)
  )
  (i32.store offset=143 align=1
   (get_local $12)
   (i32.const 168430090)
  )
  (i32.store8 offset=157
   (get_local $12)
   (i32.const 0)
  )
  (set_local $11
   (call $store_i64
    (get_local $1)
    (i64.const -4995154566354305024)
    (i32.add
     (get_local $12)
     (i32.const 368)
    )
    (i32.const 30)
   )
  )
  (set_local $5
   (call $store_i64
    (get_local $3)
    (i64.const -4995154566124142592)
    (i32.add
     (get_local $12)
     (i32.const 168)
    )
    (i32.const 30)
   )
  )
  (set_local $0
   (call $store_i64
    (get_local $1)
    (i64.const -7948142323357974528)
    (get_local $12)
    (i32.const 161)
   )
  )
  (call $assert
   (i32.and
    (i32.ne
     (get_local $11)
     (i32.const 0)
    )
    (i32.ne
     (get_local $5)
     (i32.const 0)
    )
   )
   (i32.const 720)
  )
  (call $assert
   (i32.ne
    (get_local $0)
    (i32.const 0)
   )
   (i32.const 752)
  )
  (call $prints
   (i32.const 784)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $12)
    (i32.const 400)
   )
  )
 )
 (func $_Z8quitgame13Reset_message (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (call $require_auth
   (tee_local $1
    (i64.load offset=8 align=1
     (get_local $0)
    )
   )
  )
  (i64.store offset=32
   (get_local $3)
   (tee_local $2
    (i64.load offset=16 align=1
     (get_local $0)
    )
   )
  )
  (call $assert
   (i32.ne
    (tee_local $0
     (call $load_i64
      (get_local $1)
      (i64.const 4851938105189466112)
      (i64.const -4995154566354305024)
      (i32.add
       (get_local $3)
       (i32.const 32)
      )
      (i32.const 30)
     )
    )
    (i32.const 30)
   )
   (i32.const 832)
  )
  (call $assert
   (i32.eq
    (get_local $0)
    (i32.const 30)
   )
   (i32.const 896)
  )
  (call $assert
   (i32.ne
    (call $remove_i64
     (get_local $2)
     (i64.const -4995154566354305024)
     (i32.add
      (get_local $3)
      (i32.const 32)
     )
    )
    (i32.const 0)
   )
   (i32.const 912)
  )
  (i64.store
   (get_local $3)
   (get_local $2)
  )
  (call $assert
   (i32.ne
    (call $remove_i64
     (get_local $1)
     (i64.const -4995154566124142592)
     (get_local $3)
    )
    (i32.const 0)
   )
   (i32.const 944)
  )
  (call $assert
   (i32.const 0)
   (i32.const 976)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 64)
   )
  )
 )
 (func $_Z8judgewin16JudgeWin_message (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $15
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 288)
    )
   )
  )
  (call $assert
   (i32.const 1)
   (i32.const 1008)
  )
  (call $require_auth
   (tee_local $1
    (i64.load offset=11 align=1
     (get_local $0)
    )
   )
  )
  (call $prints
   (i32.add
    (i32.add
     (i32.wrap/i64
      (tee_local $2
       (i64.load offset=19 align=1
        (get_local $0)
       )
      )
     )
     (i32.wrap/i64
      (tee_local $4
       (i64.load align=1
        (get_local $0)
       )
      )
     )
    )
    (i32.const 1024)
   )
  )
  (i32.store8 offset=180
   (get_local $15)
   (i32.const 81)
  )
  (i32.store8 offset=175
   (get_local $15)
   (i32.const 4)
  )
  (i32.store8 offset=262
   (get_local $15)
   (i32.const 5)
  )
  (i32.store8 offset=276
   (get_local $15)
   (i32.const 4)
  )
  (i64.store offset=120
   (get_local $15)
   (get_local $4)
  )
  (set_local $9
   (call $load_i64
    (get_local $2)
    (i64.const 4851938105189466112)
    (i64.const -7948142323357974528)
    (i32.add
     (get_local $15)
     (i32.const 120)
    )
    (i32.const 161)
   )
  )
  (call $assert
   (i32.eq
    (i32.load8_u offset=152
     (get_local $15)
    )
    (i32.const 1)
   )
   (i32.const 1088)
  )
  (call $assert
   (i32.eq
    (get_local $9)
    (i32.const 161)
   )
   (i32.const 1136)
  )
  (call $assert
   (i32.or
    (i64.eq
     (get_local $1)
     (i64.load offset=136
      (get_local $15)
     )
    )
    (i64.eq
     (get_local $1)
     (i64.load offset=144
      (get_local $15)
     )
    )
   )
   (i32.const 1168)
  )
  (call $assert
   (i32.or
    (i64.eq
     (get_local $2)
     (i64.load offset=136
      (get_local $15)
     )
    )
    (i64.eq
     (get_local $2)
     (i64.load offset=144
      (get_local $15)
     )
    )
   )
   (i32.const 1200)
  )
  (i32.store8
   (i32.add
    (get_local $15)
    (i32.const 118)
   )
   (i32.load8_u offset=1238
    (i32.const 0)
   )
  )
  (i32.store16
   (i32.add
    (get_local $15)
    (i32.const 116)
   )
   (i32.load16_u offset=1236
    (i32.const 0)
   )
  )
  (i32.store
   (i32.add
    (get_local $15)
    (i32.const 112)
   )
   (i32.load offset=1232
    (i32.const 0)
   )
  )
  (i64.store offset=104
   (get_local $15)
   (i64.load offset=1224
    (i32.const 0)
   )
  )
  (i64.store offset=96
   (get_local $15)
   (i64.load offset=1216
    (i32.const 0)
   )
  )
  (call $prints
   (i32.add
    (get_local $15)
    (i32.const 96)
   )
  )
  (call $printn
   (get_local $2)
  )
  (call $prints
   (i32.add
    (i32.load offset=128
     (get_local $15)
    )
    (i32.const 1248)
   )
  )
  (call $assert
   (i32.ne
    (i64.ne
     (get_local $1)
     (i64.load offset=136
      (get_local $15)
     )
    )
    (i32.load8_u offset=153
     (get_local $15)
    )
   )
   (i32.const 1280)
  )
  (set_local $4
   (i64.load8_u offset=153
    (get_local $15)
   )
  )
  (call $prints
   (i32.const 1312)
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i32.add
    (get_local $15)
    (i32.const 181)
   )
  )
  (set_local $9
   (i32.const 0)
  )
  (set_local $10
   (i32.const 0)
  )
  (set_local $11
   (i32.const 0)
  )
  (loop $label$0
   (i32.store8
    (i32.add
     (i32.add
      (get_local $15)
      (i32.mul
       (i32.and
        (get_local $10)
        (i32.const 255)
       )
       (i32.const 9)
      )
     )
     (tee_local $5
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
    )
    (i32.load8_u
     (i32.add
      (get_local $3)
      (get_local $9)
     )
    )
   )
   (set_local $11
    (select
     (i32.const 0)
     (i32.add
      (get_local $11)
      (i32.const 1)
     )
     (tee_local $5
      (i32.eq
       (get_local $5)
       (i32.const 8)
      )
     )
    )
   )
   (set_local $10
    (i32.add
     (get_local $5)
     (get_local $10)
    )
   )
   (br_if $label$0
    (i32.ne
     (tee_local $9
      (i32.add
       (get_local $9)
       (i32.const 1)
      )
     )
     (i32.const 81)
    )
   )
  )
  (set_local $14
   (i32.const 0)
  )
  (set_local $11
   (i32.const 0)
  )
  (set_local $3
   (i32.const 0)
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (block $label$10
            (br_if $label$10
             (i32.eqz
              (i32.load8_u
               (tee_local $5
                (i32.add
                 (i32.add
                  (get_local $15)
                  (i32.mul
                   (tee_local $10
                    (i32.load8_u offset=9
                     (get_local $0)
                    )
                   )
                   (i32.const 9)
                  )
                 )
                 (tee_local $9
                  (i32.load8_u
                   (i32.add
                    (get_local $0)
                    (i32.const 10)
                   )
                  )
                 )
                )
               )
              )
             )
            )
            (br_if $label$9
             (i32.eqz
              (get_local $10)
             )
            )
            (br $label$8)
           )
           (call $prints
            (i32.const 1344)
           )
           (block $label$11
            (block $label$12
             (br_if $label$12
              (i64.ne
               (get_local $2)
               (get_local $1)
              )
             )
             (call $prints
              (i32.const 1360)
             )
             (set_local $11
              (i32.const 2)
             )
             (br $label$11)
            )
            (call $prints
             (i32.const 1376)
            )
            (set_local $11
             (i32.const 1)
            )
           )
           (i32.store8
            (get_local $5)
            (get_local $11)
           )
           (block $label$13
            (block $label$14
             (block $label$15
              (br_if $label$15
               (i32.ne
                (tee_local $3
                 (i32.and
                  (get_local $11)
                  (i32.const 255)
                 )
                )
                (i32.load8_u
                 (i32.add
                  (tee_local $0
                   (i32.add
                    (i32.add
                     (get_local $15)
                     (i32.mul
                      (get_local $10)
                      (i32.const 9)
                     )
                    )
                    (get_local $9)
                   )
                  )
                  (i32.const 10)
                 )
                )
               )
              )
              (br_if $label$14
               (i32.ne
                (get_local $3)
                (i32.load8_u
                 (i32.add
                  (get_local $0)
                  (i32.const 20)
                 )
                )
               )
              )
              (br_if $label$14
               (i32.ne
                (tee_local $3
                 (i32.and
                  (get_local $11)
                  (i32.const 255)
                 )
                )
                (i32.load8_u
                 (i32.add
                  (tee_local $0
                   (i32.add
                    (i32.add
                     (get_local $15)
                     (i32.mul
                      (get_local $10)
                      (i32.const 9)
                     )
                    )
                    (get_local $9)
                   )
                  )
                  (i32.const 30)
                 )
                )
               )
              )
              (br_if $label$13
               (i32.ne
                (get_local $3)
                (i32.load8_u
                 (i32.add
                  (get_local $0)
                  (i32.const 40)
                 )
                )
               )
              )
              (call $assert
               (i32.const 0)
               (i32.const 1392)
              )
              (set_local $3
               (i32.const 1)
              )
              (br_if $label$8
               (get_local $10)
              )
              (br $label$9)
             )
             (set_local $3
              (i32.const 0)
             )
             (br_if $label$8
              (get_local $10)
             )
             (br $label$9)
            )
            (set_local $3
             (i32.const 0)
            )
            (br_if $label$8
             (get_local $10)
            )
            (br $label$9)
           )
           (set_local $3
            (i32.const 0)
           )
           (br_if $label$8
            (get_local $10)
           )
          )
          (set_local $13
           (i32.const 0)
          )
          (set_local $12
           (i32.const 0)
          )
          (br $label$7)
         )
         (block $label$16
          (br_if $label$16
           (i32.eqz
            (get_local $9)
           )
          )
          (br_if $label$16
           (i32.ne
            (tee_local $0
             (i32.and
              (get_local $11)
              (i32.const 255)
             )
            )
            (i32.load8_u
             (i32.add
              (i32.add
               (i32.add
                (get_local $15)
                (i32.mul
                 (get_local $10)
                 (i32.const 9)
                )
               )
               (get_local $9)
              )
              (i32.const -10)
             )
            )
           )
          )
          (br_if $label$16
           (i32.ne
            (get_local $0)
            (i32.load8_u
             (get_local $5)
            )
           )
          )
          (br_if $label$16
           (i32.ne
            (tee_local $0
             (i32.and
              (get_local $11)
              (i32.const 255)
             )
            )
            (i32.load8_u
             (i32.add
              (tee_local $14
               (i32.add
                (i32.add
                 (get_local $15)
                 (i32.mul
                  (get_local $10)
                  (i32.const 9)
                 )
                )
                (get_local $9)
               )
              )
              (i32.const 10)
             )
            )
           )
          )
          (br_if $label$16
           (i32.ne
            (get_local $0)
            (i32.load8_u
             (i32.add
              (get_local $14)
              (i32.const 20)
             )
            )
           )
          )
          (br_if $label$16
           (i32.ne
            (i32.and
             (get_local $11)
             (i32.const 255)
            )
            (i32.load8_u
             (i32.add
              (i32.add
               (i32.add
                (get_local $15)
                (i32.mul
                 (get_local $10)
                 (i32.const 9)
                )
               )
               (get_local $9)
              )
              (i32.const 30)
             )
            )
           )
          )
          (call $assert
           (i32.const 0)
           (i32.const 1424)
          )
          (set_local $3
           (i32.const 1)
          )
         )
         (set_local $12
          (i32.const 0)
         )
         (block $label$17
          (block $label$18
           (block $label$19
            (block $label$20
             (block $label$21
              (br_if $label$21
               (i32.lt_u
                (get_local $10)
                (i32.const 2)
               )
              )
              (block $label$22
               (br_if $label$22
                (i32.lt_u
                 (get_local $9)
                 (i32.const 2)
                )
               )
               (br_if $label$22
                (i32.ne
                 (tee_local $0
                  (i32.and
                   (get_local $11)
                   (i32.const 255)
                  )
                 )
                 (i32.load8_u
                  (i32.add
                   (tee_local $14
                    (i32.add
                     (i32.add
                      (get_local $15)
                      (i32.mul
                       (get_local $10)
                       (i32.const 9)
                      )
                     )
                     (get_local $9)
                    )
                   )
                   (i32.const -20)
                  )
                 )
                )
               )
               (br_if $label$22
                (i32.ne
                 (get_local $0)
                 (i32.load8_u
                  (i32.add
                   (get_local $14)
                   (i32.const -10)
                  )
                 )
                )
               )
               (br_if $label$22
                (i32.ne
                 (tee_local $0
                  (i32.and
                   (get_local $11)
                   (i32.const 255)
                  )
                 )
                 (i32.load8_u
                  (get_local $5)
                 )
                )
               )
               (br_if $label$22
                (i32.ne
                 (get_local $0)
                 (i32.load8_u
                  (i32.add
                   (tee_local $14
                    (i32.add
                     (i32.add
                      (get_local $15)
                      (i32.mul
                       (get_local $10)
                       (i32.const 9)
                      )
                     )
                     (get_local $9)
                    )
                   )
                   (i32.const 10)
                  )
                 )
                )
               )
               (br_if $label$22
                (i32.ne
                 (i32.and
                  (get_local $11)
                  (i32.const 255)
                 )
                 (i32.load8_u
                  (i32.add
                   (get_local $14)
                   (i32.const 20)
                  )
                 )
                )
               )
               (call $assert
                (i32.const 0)
                (i32.const 1456)
               )
               (set_local $3
                (i32.const 1)
               )
              )
              (set_local $14
               (i32.const 0)
              )
              (br_if $label$20
               (i32.lt_u
                (get_local $10)
                (i32.const 3)
               )
              )
              (block $label$23
               (br_if $label$23
                (i32.lt_u
                 (get_local $9)
                 (i32.const 3)
                )
               )
               (br_if $label$23
                (i32.ne
                 (tee_local $0
                  (i32.and
                   (get_local $11)
                   (i32.const 255)
                  )
                 )
                 (i32.load8_u
                  (i32.add
                   (tee_local $14
                    (i32.add
                     (i32.add
                      (get_local $15)
                      (i32.mul
                       (get_local $10)
                       (i32.const 9)
                      )
                     )
                     (get_local $9)
                    )
                   )
                   (i32.const -30)
                  )
                 )
                )
               )
               (br_if $label$23
                (i32.ne
                 (get_local $0)
                 (i32.load8_u
                  (i32.add
                   (get_local $14)
                   (i32.const -20)
                  )
                 )
                )
               )
               (br_if $label$23
                (i32.ne
                 (tee_local $0
                  (i32.and
                   (get_local $11)
                   (i32.const 255)
                  )
                 )
                 (i32.load8_u
                  (i32.add
                   (i32.add
                    (i32.add
                     (get_local $15)
                     (i32.mul
                      (get_local $10)
                      (i32.const 9)
                     )
                    )
                    (get_local $9)
                   )
                   (i32.const -10)
                  )
                 )
                )
               )
               (br_if $label$23
                (i32.ne
                 (get_local $0)
                 (i32.load8_u
                  (get_local $5)
                 )
                )
               )
               (br_if $label$23
                (i32.ne
                 (i32.and
                  (get_local $11)
                  (i32.const 255)
                 )
                 (i32.load8_u
                  (i32.add
                   (i32.add
                    (i32.add
                     (get_local $15)
                     (i32.mul
                      (get_local $10)
                      (i32.const 9)
                     )
                    )
                    (get_local $9)
                   )
                   (i32.const 10)
                  )
                 )
                )
               )
               (call $assert
                (i32.const 0)
                (i32.const 1488)
               )
               (set_local $3
                (i32.const 1)
               )
              )
              (block $label$24
               (br_if $label$24
                (i32.lt_u
                 (get_local $10)
                 (i32.const 4)
                )
               )
               (block $label$25
                (br_if $label$25
                 (i32.lt_u
                  (get_local $9)
                  (i32.const 4)
                 )
                )
                (br_if $label$25
                 (i32.ne
                  (tee_local $0
                   (i32.and
                    (get_local $11)
                    (i32.const 255)
                   )
                  )
                  (i32.load8_u
                   (i32.add
                    (tee_local $14
                     (i32.add
                      (i32.add
                       (get_local $15)
                       (i32.mul
                        (get_local $10)
                        (i32.const 9)
                       )
                      )
                      (get_local $9)
                     )
                    )
                    (i32.const -40)
                   )
                  )
                 )
                )
                (br_if $label$25
                 (i32.ne
                  (get_local $0)
                  (i32.load8_u
                   (i32.add
                    (get_local $14)
                    (i32.const -30)
                   )
                  )
                 )
                )
                (br_if $label$25
                 (i32.ne
                  (tee_local $0
                   (i32.and
                    (get_local $11)
                    (i32.const 255)
                   )
                  )
                  (i32.load8_u
                   (i32.add
                    (tee_local $14
                     (i32.add
                      (i32.add
                       (get_local $15)
                       (i32.mul
                        (get_local $10)
                        (i32.const 9)
                       )
                      )
                      (get_local $9)
                     )
                    )
                    (i32.const -20)
                   )
                  )
                 )
                )
                (br_if $label$25
                 (i32.ne
                  (get_local $0)
                  (i32.load8_u
                   (i32.add
                    (get_local $14)
                    (i32.const -10)
                   )
                  )
                 )
                )
                (br_if $label$25
                 (i32.ne
                  (i32.and
                   (get_local $11)
                   (i32.const 255)
                  )
                  (i32.load8_u
                   (get_local $5)
                  )
                 )
                )
                (call $assert
                 (i32.const 0)
                 (i32.const 1520)
                )
                (set_local $3
                 (i32.const 1)
                )
               )
               (br_if $label$24
                (i32.ne
                 (tee_local $0
                  (i32.and
                   (get_local $11)
                   (i32.const 255)
                  )
                 )
                 (i32.load8_u
                  (get_local $5)
                 )
                )
               )
               (br_if $label$24
                (i32.ne
                 (get_local $0)
                 (i32.load8_u
                  (i32.add
                   (tee_local $14
                    (i32.add
                     (i32.add
                      (get_local $15)
                      (i32.mul
                       (get_local $10)
                       (i32.const 9)
                      )
                     )
                     (get_local $9)
                    )
                   )
                   (i32.const -8)
                  )
                 )
                )
               )
               (br_if $label$24
                (i32.ne
                 (tee_local $0
                  (i32.and
                   (get_local $11)
                   (i32.const 255)
                  )
                 )
                 (i32.load8_u
                  (i32.add
                   (get_local $14)
                   (i32.const -16)
                  )
                 )
                )
               )
               (br_if $label$24
                (i32.ne
                 (get_local $0)
                 (i32.load8_u
                  (i32.add
                   (tee_local $14
                    (i32.add
                     (i32.add
                      (get_local $15)
                      (i32.mul
                       (get_local $10)
                       (i32.const 9)
                      )
                     )
                     (get_local $9)
                    )
                   )
                   (i32.const -24)
                  )
                 )
                )
               )
               (br_if $label$24
                (i32.ne
                 (i32.and
                  (get_local $11)
                  (i32.const 255)
                 )
                 (i32.load8_u
                  (i32.add
                   (get_local $14)
                   (i32.const -32)
                  )
                 )
                )
               )
               (call $assert
                (i32.const 0)
                (i32.const 1552)
               )
               (set_local $3
                (i32.const 1)
               )
              )
              (set_local $14
               (i32.gt_u
                (get_local $10)
                (i32.const 3)
               )
              )
              (br_if $label$18
               (i32.eqz
                (get_local $9)
               )
              )
              (set_local $12
               (i32.const 1)
              )
              (br_if $label$19
               (i32.ne
                (tee_local $0
                 (i32.and
                  (get_local $11)
                  (i32.const 255)
                 )
                )
                (i32.load8_u
                 (i32.add
                  (i32.add
                   (i32.add
                    (get_local $15)
                    (i32.mul
                     (get_local $10)
                     (i32.const 9)
                    )
                   )
                   (get_local $9)
                  )
                  (i32.const 8)
                 )
                )
               )
              )
              (br_if $label$19
               (i32.ne
                (get_local $0)
                (i32.load8_u
                 (get_local $5)
                )
               )
              )
              (br_if $label$19
               (i32.ne
                (tee_local $0
                 (i32.and
                  (get_local $11)
                  (i32.const 255)
                 )
                )
                (i32.load8_u
                 (i32.add
                  (tee_local $7
                   (i32.add
                    (i32.add
                     (get_local $15)
                     (i32.mul
                      (get_local $10)
                      (i32.const 9)
                     )
                    )
                    (get_local $9)
                   )
                  )
                  (i32.const -8)
                 )
                )
               )
              )
              (br_if $label$19
               (i32.ne
                (get_local $0)
                (i32.load8_u
                 (i32.add
                  (get_local $7)
                  (i32.const -16)
                 )
                )
               )
              )
              (br_if $label$19
               (i32.ne
                (i32.and
                 (get_local $11)
                 (i32.const 255)
                )
                (i32.load8_u
                 (i32.add
                  (i32.add
                   (i32.add
                    (get_local $15)
                    (i32.mul
                     (get_local $10)
                     (i32.const 9)
                    )
                   )
                   (get_local $9)
                  )
                  (i32.const -24)
                 )
                )
               )
              )
              (call $assert
               (i32.const 0)
               (i32.const 1552)
              )
              (set_local $12
               (i32.const 1)
              )
              (set_local $3
               (i32.const 1)
              )
              (br $label$19)
             )
             (set_local $13
              (i32.const 0)
             )
             (set_local $14
              (i32.const 0)
             )
             (br $label$17)
            )
            (set_local $12
             (i32.const 0)
            )
           )
           (set_local $13
            (i32.const 1)
           )
           (br_if $label$3
            (i32.lt_u
             (get_local $9)
             (i32.const 2)
            )
           )
           (set_local $13
            (i32.const 1)
           )
           (br_if $label$17
            (i32.ne
             (tee_local $0
              (i32.and
               (get_local $11)
               (i32.const 255)
              )
             )
             (i32.load8_u
              (i32.add
               (tee_local $7
                (i32.add
                 (i32.add
                  (get_local $15)
                  (i32.mul
                   (get_local $10)
                   (i32.const 9)
                  )
                 )
                 (get_local $9)
                )
               )
               (i32.const 16)
              )
             )
            )
           )
           (br_if $label$17
            (i32.ne
             (get_local $0)
             (i32.load8_u
              (i32.add
               (get_local $7)
               (i32.const 8)
              )
             )
            )
           )
           (br_if $label$17
            (i32.ne
             (tee_local $0
              (i32.and
               (get_local $11)
               (i32.const 255)
              )
             )
             (i32.load8_u
              (get_local $5)
             )
            )
           )
           (br_if $label$17
            (i32.ne
             (get_local $0)
             (i32.load8_u
              (i32.add
               (tee_local $7
                (i32.add
                 (i32.add
                  (get_local $15)
                  (i32.mul
                   (get_local $10)
                   (i32.const 9)
                  )
                 )
                 (get_local $9)
                )
               )
               (i32.const -8)
              )
             )
            )
           )
           (br_if $label$17
            (i32.ne
             (i32.and
              (get_local $11)
              (i32.const 255)
             )
             (i32.load8_u
              (i32.add
               (get_local $7)
               (i32.const -16)
              )
             )
            )
           )
           (call $assert
            (i32.const 0)
            (i32.const 1552)
           )
           (set_local $13
            (i32.const 1)
           )
           (set_local $3
            (i32.const 1)
           )
           (br $label$17)
          )
          (set_local $12
           (i32.const 1)
          )
          (set_local $13
           (i32.const 1)
          )
          (br $label$1)
         )
         (br_if $label$5
          (i32.lt_u
           (get_local $9)
           (i32.const 3)
          )
         )
         (br_if $label$7
          (i32.ne
           (tee_local $0
            (i32.and
             (get_local $11)
             (i32.const 255)
            )
           )
           (i32.load8_u
            (i32.add
             (tee_local $7
              (i32.add
               (i32.add
                (get_local $15)
                (i32.mul
                 (get_local $10)
                 (i32.const 9)
                )
               )
               (get_local $9)
              )
             )
             (i32.const 24)
            )
           )
          )
         )
         (br_if $label$7
          (i32.ne
           (get_local $0)
           (i32.load8_u
            (i32.add
             (get_local $7)
             (i32.const 16)
            )
           )
          )
         )
         (br_if $label$7
          (i32.ne
           (tee_local $0
            (i32.and
             (get_local $11)
             (i32.const 255)
            )
           )
           (i32.load8_u
            (i32.add
             (i32.add
              (i32.add
               (get_local $15)
               (i32.mul
                (get_local $10)
                (i32.const 9)
               )
              )
              (get_local $9)
             )
             (i32.const 8)
            )
           )
          )
         )
         (br_if $label$7
          (i32.ne
           (get_local $0)
           (i32.load8_u
            (get_local $5)
           )
          )
         )
         (br_if $label$7
          (i32.ne
           (i32.and
            (get_local $11)
            (i32.const 255)
           )
           (i32.load8_u
            (i32.add
             (i32.add
              (i32.add
               (get_local $15)
               (i32.mul
                (get_local $10)
                (i32.const 9)
               )
              )
              (get_local $9)
             )
             (i32.const -8)
            )
           )
          )
         )
         (call $assert
          (i32.const 0)
          (i32.const 1568)
         )
         (set_local $0
          (i32.const 1)
         )
         (br $label$6)
        )
        (set_local $0
         (get_local $3)
        )
       )
       (block $label$26
        (block $label$27
         (block $label$28
          (br_if $label$28
           (i32.lt_u
            (get_local $9)
            (i32.const 4)
           )
          )
          (block $label$29
           (br_if $label$29
            (i32.ne
             (tee_local $3
              (i32.and
               (get_local $11)
               (i32.const 255)
              )
             )
             (i32.load8_u
              (i32.add
               (tee_local $7
                (i32.add
                 (tee_local $6
                  (i32.add
                   (get_local $15)
                   (i32.mul
                    (get_local $10)
                    (i32.const 9)
                   )
                  )
                 )
                 (i32.add
                  (get_local $9)
                  (i32.const -4)
                 )
                )
               )
               (i32.const 36)
              )
             )
            )
           )
           (br_if $label$29
            (i32.ne
             (get_local $3)
             (i32.load8_u
              (i32.add
               (i32.add
                (get_local $6)
                (get_local $9)
               )
               (i32.const 30)
              )
             )
            )
           )
           (br_if $label$29
            (i32.ne
             (tee_local $6
              (i32.and
               (get_local $11)
               (i32.const 255)
              )
             )
             (i32.load8_u
              (i32.add
               (tee_local $8
                (i32.add
                 (i32.add
                  (get_local $15)
                  (i32.mul
                   (get_local $10)
                   (i32.const 9)
                  )
                 )
                 (get_local $9)
                )
               )
               (i32.const 16)
              )
             )
            )
           )
           (br_if $label$29
            (i32.ne
             (get_local $6)
             (i32.load8_u
              (i32.add
               (get_local $8)
               (i32.const 8)
              )
             )
            )
           )
           (br_if $label$29
            (i32.ne
             (i32.and
              (get_local $11)
              (i32.const 255)
             )
             (i32.load8_u
              (get_local $5)
             )
            )
           )
           (call $assert
            (i32.const 0)
            (i32.const 1600)
           )
           (set_local $0
            (i32.const 1)
           )
          )
          (br_if $label$27
           (i32.ne
            (get_local $3)
            (i32.load8_u
             (get_local $7)
            )
           )
          )
          (br_if $label$27
           (i32.ne
            (tee_local $3
             (i32.and
              (get_local $11)
              (i32.const 255)
             )
            )
            (i32.load8_u
             (i32.add
              (tee_local $7
               (i32.add
                (i32.add
                 (get_local $15)
                 (i32.mul
                  (get_local $10)
                  (i32.const 9)
                 )
                )
                (get_local $9)
               )
              )
              (i32.const -3)
             )
            )
           )
          )
          (br_if $label$27
           (i32.ne
            (get_local $3)
            (i32.load8_u
             (i32.add
              (get_local $7)
              (i32.const -2)
             )
            )
           )
          )
          (br_if $label$27
           (i32.ne
            (tee_local $3
             (i32.and
              (get_local $11)
              (i32.const 255)
             )
            )
            (i32.load8_u
             (i32.add
              (i32.add
               (i32.add
                (get_local $15)
                (i32.mul
                 (get_local $10)
                 (i32.const 9)
                )
               )
               (get_local $9)
              )
              (i32.const -1)
             )
            )
           )
          )
          (br_if $label$27
           (i32.ne
            (get_local $3)
            (i32.load8_u
             (get_local $5)
            )
           )
          )
          (call $assert
           (i32.const 0)
           (i32.const 1632)
          )
          (set_local $0
           (i32.const 1)
          )
          (br $label$27)
         )
         (br_if $label$26
          (i32.ne
           (get_local $9)
           (i32.const 3)
          )
         )
        )
        (block $label$30
         (br_if $label$30
          (i32.ne
           (tee_local $3
            (i32.and
             (get_local $11)
             (i32.const 255)
            )
           )
           (i32.load8_u
            (i32.add
             (tee_local $7
              (i32.add
               (i32.add
                (get_local $15)
                (i32.mul
                 (get_local $10)
                 (i32.const 9)
                )
               )
               (get_local $9)
              )
             )
             (i32.const -3)
            )
           )
          )
         )
         (br_if $label$30
          (i32.ne
           (get_local $3)
           (i32.load8_u
            (i32.add
             (get_local $7)
             (i32.const -2)
            )
           )
          )
         )
         (br_if $label$30
          (i32.ne
           (tee_local $3
            (i32.and
             (get_local $11)
             (i32.const 255)
            )
           )
           (i32.load8_u
            (i32.add
             (i32.add
              (i32.add
               (get_local $15)
               (i32.mul
                (get_local $10)
                (i32.const 9)
               )
              )
              (get_local $9)
             )
             (i32.const -1)
            )
           )
          )
         )
         (br_if $label$30
          (i32.ne
           (get_local $3)
           (i32.load8_u
            (get_local $5)
           )
          )
         )
         (set_local $3
          (i32.const 1)
         )
         (br_if $label$30
          (i32.ne
           (i32.and
            (get_local $11)
            (i32.const 255)
           )
           (i32.load8_u
            (i32.add
             (i32.add
              (i32.add
               (get_local $15)
               (i32.mul
                (get_local $10)
                (i32.const 9)
               )
              )
              (get_local $9)
             )
             (i32.const 1)
            )
           )
          )
         )
         (call $assert
          (i32.const 0)
          (i32.const 1648)
         )
         (br $label$4)
        )
        (set_local $3
         (get_local $0)
        )
        (br $label$4)
       )
       (set_local $3
        (get_local $0)
       )
      )
      (br_if $label$3
       (i32.lt_u
        (get_local $9)
        (i32.const 2)
       )
      )
     )
     (br_if $label$2
      (i32.ne
       (tee_local $0
        (i32.and
         (get_local $11)
         (i32.const 255)
        )
       )
       (i32.load8_u
        (i32.add
         (tee_local $7
          (i32.add
           (i32.add
            (get_local $15)
            (i32.mul
             (get_local $10)
             (i32.const 9)
            )
           )
           (get_local $9)
          )
         )
         (i32.const -2)
        )
       )
      )
     )
     (br_if $label$2
      (i32.ne
       (get_local $0)
       (i32.load8_u
        (i32.add
         (get_local $7)
         (i32.const -1)
        )
       )
      )
     )
     (br_if $label$2
      (i32.ne
       (tee_local $0
        (i32.and
         (get_local $11)
         (i32.const 255)
        )
       )
       (i32.load8_u
        (get_local $5)
       )
      )
     )
     (br_if $label$2
      (i32.ne
       (get_local $0)
       (i32.load8_u
        (i32.add
         (tee_local $7
          (i32.add
           (i32.add
            (get_local $15)
            (i32.mul
             (get_local $10)
             (i32.const 9)
            )
           )
           (get_local $9)
          )
         )
         (i32.const 1)
        )
       )
      )
     )
     (br_if $label$2
      (i32.ne
       (i32.and
        (get_local $11)
        (i32.const 255)
       )
       (i32.load8_u
        (i32.add
         (get_local $7)
         (i32.const 2)
        )
       )
      )
     )
     (call $assert
      (i32.const 0)
      (i32.const 1664)
     )
     (set_local $3
      (i32.const 1)
     )
     (br $label$2)
    )
    (br_if $label$1
     (i32.eqz
      (get_local $9)
     )
    )
   )
   (br_if $label$1
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (i32.add
        (i32.add
         (get_local $15)
         (i32.mul
          (get_local $10)
          (i32.const 9)
         )
        )
        (get_local $9)
       )
       (i32.const -1)
      )
     )
    )
   )
   (br_if $label$1
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (get_local $5)
     )
    )
   )
   (br_if $label$1
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $7
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const 1)
      )
     )
    )
   )
   (br_if $label$1
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $7)
       (i32.const 2)
      )
     )
    )
   )
   (br_if $label$1
    (i32.ne
     (i32.and
      (get_local $11)
      (i32.const 255)
     )
     (i32.load8_u
      (i32.add
       (i32.add
        (i32.add
         (get_local $15)
         (i32.mul
          (get_local $10)
          (i32.const 9)
         )
        )
        (get_local $9)
       )
       (i32.const 3)
      )
     )
    )
   )
   (call $assert
    (i32.const 0)
    (i32.const 1680)
   )
   (set_local $3
    (i32.const 1)
   )
  )
  (block $label$31
   (br_if $label$31
    (i32.ne
     (tee_local $7
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (tee_local $0
      (i32.load8_u
       (get_local $5)
      )
     )
    )
   )
   (block $label$32
    (br_if $label$32
     (i32.ne
      (get_local $7)
      (i32.load8_u
       (i32.add
        (tee_local $0
         (i32.add
          (i32.add
           (get_local $15)
           (i32.mul
            (get_local $10)
            (i32.const 9)
           )
          )
          (get_local $9)
         )
        )
        (i32.const 1)
       )
      )
     )
    )
    (br_if $label$32
     (i32.ne
      (tee_local $6
       (i32.and
        (get_local $11)
        (i32.const 255)
       )
      )
      (i32.load8_u
       (i32.add
        (get_local $0)
        (i32.const 2)
       )
      )
     )
    )
    (br_if $label$32
     (i32.ne
      (get_local $6)
      (i32.load8_u
       (i32.add
        (tee_local $8
         (i32.add
          (i32.add
           (get_local $15)
           (i32.mul
            (get_local $10)
            (i32.const 9)
           )
          )
          (get_local $9)
         )
        )
        (i32.const 3)
       )
      )
     )
    )
    (set_local $0
     (get_local $11)
    )
    (br_if $label$31
     (i32.ne
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
      (i32.load8_u
       (i32.add
        (get_local $8)
        (i32.const 4)
       )
      )
     )
    )
    (call $assert
     (i32.const 0)
     (i32.const 1696)
    )
    (set_local $0
     (i32.load8_u
      (get_local $5)
     )
    )
    (set_local $3
     (i32.const 1)
    )
    (br $label$31)
   )
   (set_local $0
    (get_local $11)
   )
  )
  (block $label$33
   (br_if $label$33
    (i32.ne
     (get_local $7)
     (i32.and
      (get_local $0)
      (i32.const 255)
     )
    )
   )
   (br_if $label$33
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $7
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const 9)
      )
     )
    )
   )
   (br_if $label$33
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $7)
       (i32.const 18)
      )
     )
    )
   )
   (br_if $label$33
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $7
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const 27)
      )
     )
    )
   )
   (br_if $label$33
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $7)
       (i32.const 36)
      )
     )
    )
   )
   (call $assert
    (i32.const 0)
    (i32.const 1712)
   )
   (set_local $3
    (i32.const 1)
   )
  )
  (block $label$34
   (br_if $label$34
    (i32.eqz
     (get_local $10)
    )
   )
   (br_if $label$34
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (i32.add
        (i32.add
         (get_local $15)
         (i32.mul
          (get_local $10)
          (i32.const 9)
         )
        )
        (get_local $9)
       )
       (i32.const -9)
      )
     )
    )
   )
   (br_if $label$34
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (get_local $5)
     )
    )
   )
   (br_if $label$34
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $7
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const 9)
      )
     )
    )
   )
   (br_if $label$34
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $7)
       (i32.const 18)
      )
     )
    )
   )
   (br_if $label$34
    (i32.ne
     (i32.and
      (get_local $11)
      (i32.const 255)
     )
     (i32.load8_u
      (i32.add
       (i32.add
        (i32.add
         (get_local $15)
         (i32.mul
          (get_local $10)
          (i32.const 9)
         )
        )
        (get_local $9)
       )
       (i32.const 27)
      )
     )
    )
   )
   (call $assert
    (i32.const 0)
    (i32.const 1728)
   )
   (set_local $3
    (i32.const 1)
   )
  )
  (block $label$35
   (br_if $label$35
    (i32.eqz
     (get_local $13)
    )
   )
   (br_if $label$35
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $7
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const -18)
      )
     )
    )
   )
   (br_if $label$35
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $7)
       (i32.const -9)
      )
     )
    )
   )
   (br_if $label$35
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (get_local $5)
     )
    )
   )
   (br_if $label$35
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (tee_local $7
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const 9)
      )
     )
    )
   )
   (br_if $label$35
    (i32.ne
     (i32.and
      (get_local $11)
      (i32.const 255)
     )
     (i32.load8_u
      (i32.add
       (get_local $7)
       (i32.const 18)
      )
     )
    )
   )
   (call $assert
    (i32.const 0)
    (i32.const 1744)
   )
   (set_local $3
    (i32.const 1)
   )
  )
  (block $label$36
   (br_if $label$36
    (i32.eqz
     (get_local $12)
    )
   )
   (br_if $label$36
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $7
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const -27)
      )
     )
    )
   )
   (br_if $label$36
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $7)
       (i32.const -18)
      )
     )
    )
   )
   (br_if $label$36
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (i32.add
        (i32.add
         (get_local $15)
         (i32.mul
          (get_local $10)
          (i32.const 9)
         )
        )
        (get_local $9)
       )
       (i32.const -9)
      )
     )
    )
   )
   (br_if $label$36
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (get_local $5)
     )
    )
   )
   (br_if $label$36
    (i32.ne
     (i32.and
      (get_local $11)
      (i32.const 255)
     )
     (i32.load8_u
      (i32.add
       (i32.add
        (i32.add
         (get_local $15)
         (i32.mul
          (get_local $10)
          (i32.const 9)
         )
        )
        (get_local $9)
       )
       (i32.const 9)
      )
     )
    )
   )
   (call $assert
    (i32.const 0)
    (i32.const 1760)
   )
   (set_local $3
    (i32.const 1)
   )
  )
  (block $label$37
   (br_if $label$37
    (i32.eqz
     (get_local $14)
    )
   )
   (br_if $label$37
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $14
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const -36)
      )
     )
    )
   )
   (br_if $label$37
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $14)
       (i32.const 27)
      )
     )
    )
   )
   (br_if $label$37
    (i32.ne
     (tee_local $0
      (i32.and
       (get_local $11)
       (i32.const 255)
      )
     )
     (i32.load8_u
      (i32.add
       (tee_local $9
        (i32.add
         (i32.add
          (get_local $15)
          (i32.mul
           (get_local $10)
           (i32.const 9)
          )
         )
         (get_local $9)
        )
       )
       (i32.const -18)
      )
     )
    )
   )
   (br_if $label$37
    (i32.ne
     (get_local $0)
     (i32.load8_u
      (i32.add
       (get_local $9)
       (i32.const -9)
      )
     )
    )
   )
   (br_if $label$37
    (i32.ne
     (i32.and
      (get_local $11)
      (i32.const 255)
     )
     (i32.load8_u
      (get_local $5)
     )
    )
   )
   (call $assert
    (i32.const 0)
    (i32.const 1776)
   )
   (set_local $3
    (i32.const 1)
   )
  )
  (call $assert
   (i32.xor
    (get_local $3)
    (i32.const 1)
   )
   (i32.const 1552)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $15)
    (i32.const 288)
   )
  )
 )
 (func $_Z9dianpress17Pressdian_message (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $10
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 352)
    )
   )
  )
  (call $assert
   (i32.const 1)
   (i32.const 1008)
  )
  (call $require_auth
   (tee_local $1
    (i64.load offset=11 align=1
     (get_local $0)
    )
   )
  )
  (call $prints
   (i32.add
    (i32.add
     (i32.wrap/i64
      (tee_local $2
       (i64.load offset=19 align=1
        (get_local $0)
       )
      )
     )
     (i32.wrap/i64
      (tee_local $5
       (i64.load align=1
        (get_local $0)
       )
      )
     )
    )
    (i32.const 1024)
   )
  )
  (i32.store8 offset=244
   (get_local $10)
   (i32.const 81)
  )
  (i32.store8 offset=239
   (get_local $10)
   (i32.const 4)
  )
  (i32.store8 offset=326
   (get_local $10)
   (i32.const 5)
  )
  (i32.store8 offset=340
   (get_local $10)
   (i32.const 4)
  )
  (i64.store offset=184
   (get_local $10)
   (get_local $5)
  )
  (set_local $7
   (call $load_i64
    (get_local $2)
    (i64.const 4851938105189466112)
    (i64.const -7948142323357974528)
    (i32.add
     (get_local $10)
     (i32.const 184)
    )
    (i32.const 161)
   )
  )
  (call $assert
   (i32.eq
    (i32.load8_u offset=216
     (get_local $10)
    )
    (i32.const 1)
   )
   (i32.const 1088)
  )
  (call $assert
   (i32.eq
    (get_local $7)
    (i32.const 161)
   )
   (i32.const 1136)
  )
  (call $assert
   (i32.or
    (i64.eq
     (get_local $1)
     (i64.load offset=200
      (get_local $10)
     )
    )
    (i64.eq
     (get_local $1)
     (i64.load offset=208
      (get_local $10)
     )
    )
   )
   (i32.const 1168)
  )
  (call $assert
   (i32.or
    (i64.eq
     (get_local $2)
     (i64.load offset=200
      (get_local $10)
     )
    )
    (i64.eq
     (get_local $2)
     (i64.load offset=208
      (get_local $10)
     )
    )
   )
   (i32.const 1200)
  )
  (i64.store offset=152
   (get_local $10)
   (get_local $2)
  )
  (i32.store8
   (i32.add
    (get_local $10)
    (i32.const 150)
   )
   (i32.load8_u offset=1238
    (i32.const 0)
   )
  )
  (i32.store16
   (i32.add
    (get_local $10)
    (i32.const 148)
   )
   (i32.load16_u offset=1236
    (i32.const 0)
   )
  )
  (i32.store
   (i32.add
    (get_local $10)
    (i32.const 144)
   )
   (i32.load offset=1232
    (i32.const 0)
   )
  )
  (i64.store offset=136
   (get_local $10)
   (i64.load offset=1224
    (i32.const 0)
   )
  )
  (i64.store offset=128
   (get_local $10)
   (i64.load offset=1216
    (i32.const 0)
   )
  )
  (call $prints
   (i32.add
    (get_local $10)
    (i32.const 128)
   )
  )
  (call $printn
   (get_local $2)
  )
  (i64.store offset=96
   (get_local $10)
   (tee_local $5
    (i64.load offset=192
     (get_local $10)
    )
   )
  )
  (call $prints
   (i32.add
    (i32.wrap/i64
     (get_local $5)
    )
    (i32.const 1248)
   )
  )
  (call $assert
   (i32.ne
    (tee_local $3
     (i64.ne
      (get_local $1)
      (i64.load offset=200
       (get_local $10)
      )
     )
    )
    (i32.load8_u offset=217
     (get_local $10)
    )
   )
   (i32.const 1280)
  )
  (set_local $5
   (i64.load8_u offset=217
    (get_local $10)
   )
  )
  (call $prints
   (i32.const 1312)
  )
  (call $printn
   (get_local $5)
  )
  (set_local $4
   (i32.add
    (get_local $10)
    (i32.const 245)
   )
  )
  (set_local $7
   (i32.const 0)
  )
  (set_local $8
   (i32.const 0)
  )
  (set_local $9
   (i32.const 0)
  )
  (loop $label$0
   (i32.store8
    (i32.add
     (i32.add
      (get_local $10)
      (i32.mul
       (i32.and
        (get_local $8)
        (i32.const 255)
       )
       (i32.const 9)
      )
     )
     (tee_local $6
      (i32.and
       (get_local $9)
       (i32.const 255)
      )
     )
    )
    (i32.load8_u
     (i32.add
      (get_local $4)
      (get_local $7)
     )
    )
   )
   (set_local $9
    (select
     (i32.const 0)
     (i32.add
      (get_local $9)
      (i32.const 1)
     )
     (tee_local $6
      (i32.eq
       (get_local $6)
       (i32.const 8)
      )
     )
    )
   )
   (set_local $8
    (i32.add
     (get_local $6)
     (get_local $8)
    )
   )
   (br_if $label$0
    (i32.ne
     (tee_local $7
      (i32.add
       (get_local $7)
       (i32.const 1)
      )
     )
     (i32.const 81)
    )
   )
  )
  (set_local $7
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.load8_u
     (tee_local $6
      (i32.add
       (i32.add
        (get_local $10)
        (tee_local $8
         (i32.mul
          (i32.load8_u offset=9
           (get_local $0)
          )
          (i32.const 9)
         )
        )
       )
       (tee_local $9
        (i32.load8_u
         (i32.add
          (get_local $0)
          (i32.const 10)
         )
        )
       )
      )
     )
    )
   )
   (call $prints
    (i32.const 1344)
   )
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i64.ne
       (get_local $2)
       (get_local $1)
      )
     )
     (call $prints
      (i32.const 1792)
     )
     (set_local $7
      (i32.const 2)
     )
     (br $label$2)
    )
    (call $prints
     (i32.const 1808)
    )
    (set_local $7
     (i32.const 1)
    )
   )
   (i32.store8
    (get_local $6)
    (get_local $7)
   )
  )
  (i32.store8
   (i32.add
    (get_local $10)
    (i32.const 217)
   )
   (get_local $3)
  )
  (call $prints
   (i32.const 1824)
  )
  (call $printn
   (i64.extend_u/i32
    (get_local $3)
   )
  )
  (i32.store8
   (i32.add
    (i32.add
     (i32.add
      (get_local $10)
      (i32.const 184)
     )
     (i32.add
      (get_local $8)
      (get_local $9)
     )
    )
    (i32.const 61)
   )
   (get_local $7)
  )
  (block $label$4
   (br_if $label$4
    (tee_local $7
     (i32.load offset=234 align=2
      (get_local $10)
     )
    )
   )
   (i32.store align=2
    (i32.add
     (get_local $10)
     (i32.const 234)
    )
    (tee_local $7
     (call $now)
    )
   )
  )
  (i32.store8 offset=168
   (get_local $10)
   (i64.ne
    (tee_local $1
     (i64.load
      (i32.add
       (get_local $10)
       (i32.const 200)
      )
     )
    )
    (get_local $2)
   )
  )
  (i64.store offset=160
   (get_local $10)
   (tee_local $5
    (i64.load offset=184
     (get_local $10)
    )
   )
  )
  (i32.store offset=169 align=1
   (get_local $10)
   (tee_local $8
    (i32.load offset=336
     (get_local $10)
    )
   )
  )
  (i32.store8 offset=112
   (get_local $10)
   (i64.eq
    (get_local $1)
    (get_local $2)
   )
  )
  (i32.store offset=173 align=1
   (get_local $10)
   (tee_local $9
    (i32.load offset=332
     (get_local $10)
    )
   )
  )
  (i32.store8 offset=177
   (get_local $10)
   (i32.const 1)
  )
  (i64.store offset=104
   (get_local $10)
   (get_local $5)
  )
  (i32.store offset=178 align=2
   (get_local $10)
   (get_local $7)
  )
  (i32.store offset=117 align=1
   (get_local $10)
   (get_local $9)
  )
  (i32.store8 offset=121
   (get_local $10)
   (i32.const 1)
  )
  (i32.store offset=113 align=1
   (get_local $10)
   (get_local $8)
  )
  (i32.store offset=122 align=2
   (get_local $10)
   (get_local $7)
  )
  (drop
   (call $update_i64
    (i64.load
     (i32.add
      (get_local $10)
      (i32.const 192)
     )
    )
    (i64.const -4995154566124142592)
    (i32.add
     (get_local $10)
     (i32.const 152)
    )
    (i32.const 30)
   )
  )
  (drop
   (call $update_i64
    (get_local $2)
    (i64.const -4995154566354305024)
    (i32.add
     (get_local $10)
     (i32.const 96)
    )
    (i32.const 30)
   )
  )
  (drop
   (call $update_i64
    (get_local $2)
    (i64.const -7948142323357974528)
    (i32.add
     (get_local $10)
     (i32.const 184)
    )
    (i32.const 161)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $10)
    (i32.const 352)
   )
  )
 )
 (func $init
 )
 (func $apply (param $0 i64) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 384)
    )
   )
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 656)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $5)
          (i64.const 4)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i64.ne
     (get_local $6)
     (get_local $0)
    )
   )
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (block $label$12
         (block $label$13
          (block $label$14
           (block $label$15
            (br_if $label$15
             (i64.gt_s
              (get_local $1)
              (i64.const 4921565167889678335)
             )
            )
            (br_if $label$14
             (i64.gt_s
              (get_local $1)
              (i64.const -5287905347808264193)
             )
            )
            (br_if $label$12
             (i64.eq
              (get_local $1)
              (i64.const -7948142195306604544)
             )
            )
            (br_if $label$8
             (i64.ne
              (get_local $1)
              (i64.const -7297762804260405248)
             )
            )
            (call $assert
             (i32.gt_u
              (call $read_message
               (i32.add
                (get_local $8)
                (i32.const 296)
               )
               (i32.const 21)
              )
              (i32.const 20)
             )
             (i32.const 1856)
            )
            (i32.store8
             (i32.add
              (get_local $8)
              (i32.const 20)
             )
             (i32.load8_u
              (i32.add
               (i32.add
                (get_local $8)
                (i32.const 296)
               )
               (i32.const 20)
              )
             )
            )
            (i32.store
             (i32.add
              (get_local $8)
              (i32.const 16)
             )
             (i32.load
              (i32.add
               (i32.add
                (get_local $8)
                (i32.const 296)
               )
               (i32.const 16)
              )
             )
            )
            (i64.store align=4
             (i32.add
              (get_local $8)
              (i32.const 8)
             )
             (i64.load
              (i32.add
               (i32.add
                (get_local $8)
                (i32.const 296)
               )
               (i32.const 8)
              )
             )
            )
            (i64.store align=4
             (get_local $8)
             (i64.load offset=296
              (get_local $8)
             )
            )
            (call $_Z8newmatch16Newmatch_message
             (get_local $8)
            )
            (br $label$6)
           )
           (br_if $label$13
            (i64.gt_s
             (get_local $1)
             (i64.const 5444072246911959039)
            )
           )
           (br_if $label$11
            (i64.eq
             (get_local $1)
             (i64.const 4921565167889678336)
            )
           )
           (br_if $label$8
            (i64.ne
             (get_local $1)
             (i64.const 5373101451288924368)
            )
           )
           (call $assert
            (i32.gt_u
             (call $read_message
              (i32.add
               (get_local $8)
               (i32.const 176)
              )
              (i32.const 16)
             )
             (i32.const 15)
            )
            (i32.const 1856)
           )
           (i64.store align=4
            (i32.add
             (i32.add
              (get_local $8)
              (i32.const 96)
             )
             (i32.const 8)
            )
            (i64.load
             (i32.add
              (i32.add
               (get_local $8)
               (i32.const 176)
              )
              (i32.const 8)
             )
            )
           )
           (i64.store offset=96 align=4
            (get_local $8)
            (i64.load offset=176
             (get_local $8)
            )
           )
           (call $_Z12declinematch19Acceptmatch_message
            (i32.add
             (get_local $8)
             (i32.const 96)
            )
           )
           (br $label$6)
          )
          (br_if $label$10
           (i64.eq
            (get_local $1)
            (i64.const -5287905347808264192)
           )
          )
          (br_if $label$8
           (i64.ne
            (get_local $1)
            (i64.const 3607571207530617344)
           )
          )
          (call $assert
           (i32.gt_u
            (call $read_message
             (i32.add
              (get_local $8)
              (i32.const 280)
             )
             (i32.const 16)
            )
            (i32.const 15)
           )
           (i32.const 1856)
          )
          (i64.store align=4
           (i32.add
            (i32.add
             (get_local $8)
             (i32.const 24)
            )
            (i32.const 8)
           )
           (i64.load
            (i32.add
             (i32.add
              (get_local $8)
              (i32.const 280)
             )
             (i32.const 8)
            )
           )
          )
          (i64.store offset=24 align=4
           (get_local $8)
           (i64.load offset=280
            (get_local $8)
           )
          )
          (call $_Z11acceptmatch19Acceptmatch_message
           (i32.add
            (get_local $8)
            (i32.const 24)
           )
          )
          (br $label$6)
         )
         (br_if $label$9
          (i64.eq
           (get_local $1)
           (i64.const 5444072246911959040)
          )
         )
         (br_if $label$8
          (i64.ne
           (get_local $1)
           (i64.const 9120569288040644608)
          )
         )
         (i32.store8 offset=256
          (get_local $8)
          (i32.const 2)
         )
         (call $assert
          (i32.gt_u
           (call $read_message
            (i32.add
             (get_local $8)
             (i32.const 248)
            )
            (i32.const 27)
           )
           (i32.const 26)
          )
          (i32.const 1856)
         )
         (i32.store8
          (i32.add
           (i32.add
            (get_local $8)
            (i32.const 40)
           )
           (i32.const 26)
          )
          (i32.load8_u
           (i32.add
            (i32.add
             (get_local $8)
             (i32.const 248)
            )
            (i32.const 26)
           )
          )
         )
         (i32.store16
          (i32.add
           (i32.add
            (get_local $8)
            (i32.const 40)
           )
           (i32.const 24)
          )
          (i32.load16_u
           (i32.add
            (i32.add
             (get_local $8)
             (i32.const 248)
            )
            (i32.const 24)
           )
          )
         )
         (i64.store align=4
          (i32.add
           (i32.add
            (get_local $8)
            (i32.const 40)
           )
           (i32.const 16)
          )
          (i64.load
           (i32.add
            (i32.add
             (get_local $8)
             (i32.const 248)
            )
            (i32.const 16)
           )
          )
         )
         (i64.store align=4
          (i32.add
           (get_local $8)
           (i32.const 48)
          )
          (i64.load offset=256
           (get_local $8)
          )
         )
         (i64.store offset=40 align=4
          (get_local $8)
          (i64.load offset=248
           (get_local $8)
          )
         )
         (call $_Z8judgewin16JudgeWin_message
          (i32.add
           (get_local $8)
           (i32.const 40)
          )
         )
         (br $label$6)
        )
        (call $assert
         (i32.gt_u
          (call $read_message
           (i32.add
            (get_local $8)
            (i32.const 136)
           )
           (i32.const 9)
          )
          (i32.const 8)
         )
         (i32.const 1856)
        )
        (set_local $3
         (i32.load8_u offset=144
          (get_local $8)
         )
        )
        (call $require_auth
         (tee_local $5
          (i64.load offset=136
           (get_local $8)
          )
         )
        )
        (i32.store8 offset=360
         (get_local $8)
         (get_local $3)
        )
        (i64.store offset=352
         (get_local $8)
         (get_local $5)
        )
        (br_if $label$7
         (i32.ne
          (call $load_i64
           (i64.const 4851938105189466112)
           (i64.const 4851938105189466112)
           (i64.const -7948142195306604544)
           (i32.add
            (get_local $8)
            (i32.const 352)
           )
           (i32.const 9)
          )
          (i32.const 9)
         )
        )
        (drop
         (call $update_i64
          (i64.const 4851938105189466112)
          (i64.const -7948142195306604544)
          (i32.add
           (get_local $8)
           (i32.const 352)
          )
          (i32.const 9)
         )
        )
        (br $label$6)
       )
       (call $assert
        (i32.gt_u
         (call $read_message
          (i32.add
           (get_local $8)
           (i32.const 152)
          )
          (i32.const 24)
         )
         (i32.const 23)
        )
        (i32.const 1856)
       )
       (i64.store align=4
        (i32.add
         (i32.add
          (get_local $8)
          (i32.const 112)
         )
         (i32.const 16)
        )
        (i64.load
         (i32.add
          (i32.add
           (get_local $8)
           (i32.const 152)
          )
          (i32.const 16)
         )
        )
       )
       (i64.store align=4
        (i32.add
         (i32.add
          (get_local $8)
          (i32.const 112)
         )
         (i32.const 8)
        )
        (i64.load
         (i32.add
          (i32.add
           (get_local $8)
           (i32.const 152)
          )
          (i32.const 8)
         )
        )
       )
       (i64.store offset=112 align=4
        (get_local $8)
        (i64.load offset=152
         (get_local $8)
        )
       )
       (call $_Z8claimwin16Claimwin_message
        (i32.add
         (get_local $8)
         (i32.const 112)
        )
       )
       (br $label$6)
      )
      (call $assert
       (i32.gt_u
        (call $read_message
         (i32.add
          (get_local $8)
          (i32.const 192)
         )
         (i32.const 24)
        )
        (i32.const 23)
       )
       (i32.const 1856)
      )
      (set_local $5
       (i64.load offset=208
        (get_local $8)
       )
      )
      (call $require_auth
       (tee_local $7
        (i64.load offset=200
         (get_local $8)
        )
       )
      )
      (i64.store offset=352
       (get_local $8)
       (get_local $5)
      )
      (call $assert
       (i32.ne
        (tee_local $3
         (call $load_i64
          (get_local $7)
          (i64.const 4851938105189466112)
          (i64.const -4995154566354305024)
          (i32.add
           (get_local $8)
           (i32.const 352)
          )
          (i32.const 30)
         )
        )
        (i32.const 30)
       )
       (i32.const 832)
      )
      (call $assert
       (i32.eq
        (get_local $3)
        (i32.const 30)
       )
       (i32.const 896)
      )
      (call $assert
       (i32.ne
        (call $remove_i64
         (get_local $5)
         (i64.const -4995154566354305024)
         (i32.add
          (get_local $8)
          (i32.const 352)
         )
        )
        (i32.const 0)
       )
       (i32.const 912)
      )
      (i64.store offset=320
       (get_local $8)
       (get_local $5)
      )
      (call $assert
       (i32.ne
        (call $remove_i64
         (get_local $7)
         (i64.const -4995154566124142592)
         (i32.add
          (get_local $8)
          (i32.const 320)
         )
        )
        (i32.const 0)
       )
       (i32.const 944)
      )
      (call $assert
       (i32.const 0)
       (i32.const 976)
      )
      (br $label$6)
     )
     (i32.store8 offset=224
      (get_local $8)
      (i32.const 2)
     )
     (call $assert
      (i32.gt_u
       (call $read_message
        (i32.add
         (get_local $8)
         (i32.const 216)
        )
        (i32.const 27)
       )
       (i32.const 26)
      )
      (i32.const 1856)
     )
     (i32.store8
      (i32.add
       (i32.add
        (get_local $8)
        (i32.const 68)
       )
       (i32.const 26)
      )
      (i32.load8_u
       (i32.add
        (i32.add
         (get_local $8)
         (i32.const 216)
        )
        (i32.const 26)
       )
      )
     )
     (i32.store16
      (i32.add
       (i32.add
        (get_local $8)
        (i32.const 68)
       )
       (i32.const 24)
      )
      (i32.load16_u
       (i32.add
        (i32.add
         (get_local $8)
         (i32.const 216)
        )
        (i32.const 24)
       )
      )
     )
     (i64.store align=4
      (i32.add
       (i32.add
        (get_local $8)
        (i32.const 68)
       )
       (i32.const 16)
      )
      (i64.load
       (i32.add
        (i32.add
         (get_local $8)
         (i32.const 216)
        )
        (i32.const 16)
       )
      )
     )
     (i64.store align=4
      (i32.add
       (get_local $8)
       (i32.const 76)
      )
      (i64.load offset=224
       (get_local $8)
      )
     )
     (i64.store offset=68 align=4
      (get_local $8)
      (i64.load offset=216
       (get_local $8)
      )
     )
     (call $_Z9dianpress17Pressdian_message
      (i32.add
       (get_local $8)
       (i32.const 68)
      )
     )
     (br $label$6)
    )
    (call $assert
     (i32.const 0)
     (i32.const 1888)
    )
    (br $label$6)
   )
   (drop
    (call $store_i64
     (i64.const 4851938105189466112)
     (i64.const -7948142195306604544)
     (i32.add
      (get_local $8)
      (i32.const 352)
     )
     (i32.const 9)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 384)
   )
  )
 )
)

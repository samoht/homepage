open Printf
open Cohttpserver

TYPE_CONV_PATH "Papers"

open Bib

let dispatch oc = function
 | [] ->
    let body = Db.with_bib (fun db -> json_of_papers (Bib.ent_get db)) in
    Http_daemon.respond ~body oc
 | _ -> Http_daemon.respond_not_found oc

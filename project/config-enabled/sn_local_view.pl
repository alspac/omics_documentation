%:- use_module(components(label)).
%:- use_module(cliopatria(hooks)).
%:- use_module(library(http/http_dispatch)).
%:- use_module(library(http/http_files)).
%:- use_module(library(http/thread_httpd)).
%:- use_module(library(http/http_dispatch)).
%:- use_module(library(http/http_error)).
%:- use_module(library(http/html_write)).
:- use_module(cliopatria(hooks)).
%
%:- use_module(library(semweb/rdf11)).
%
%
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/html_write)).
:- use_module(library(http/js_write)).
:- use_module(library(http/html_head)).
:- use_module(library(http/http_wrapper)).
:- use_module(library(http/yui_resources)).
:- use_module(library(http/http_path)).
:- use_module(library(http/cp_jquery)).
:- use_module(library(semweb/rdf_db)).
%
%:- use_module(library(semweb/rdf_db)).
%:- use_module(library(semweb/rdfs)).
%%:- use_module(library(semweb/rdf_litindex)).
%%:- use_module(library(semweb/rdf_persistency)).
%
%:- use_module(library(aggregate)).
%:- use_module(library(lists)).
%:- use_module(library(pairs)).
%:- use_module(library(debug)).
%:- use_module(library(option)).
%:- use_module(library(apply)).
%:- use_module(library(settings)).
%
%:- use_module(components(label)).
%:- use_module(components(simple_search)).
%:- use_module(components(graphviz)).
%:- use_module(components(basics)).
%:- use_module(api(lod_crawler)).
%:- use_module(api(sesame)).
%:- use_module(library(semweb/rdf_abstract)).
%:- use_module(library(semweb/rdf_label)).
%
%:- use_module(user(user_db)).

:- multifile
   cliopatria:list_resource//1.

:- multifile
     cliopatria:list_resource//2.


:- multifile
   cliopatria:display_link//2.

cliopatria:display_link(X,Y) -->
    {iri_display(X,X2)},
    html(X2).


iri_display(literal(X),X):-
    !.

%%if we can get a name add it
%thing(X,X2):-
%    rdf(X,has_name,Name),
    
%http://purl.org/alspac/alspac-data-catalogue-schema/cnv_550_g1
iri_display(X,X2):-
    rdf_global_id(IRISpec, X),
    rdf(X,'http://schema.org/name',literal(Name)),
    format(atom(Atom),"~w ~t name:~w",[IRISpec,Name]),
    X2 = table([align(left),width('96%'),border(0)],[tr([td(a([href=X],IRISpec)),td([width('50%')],Name)])]),!.


iri_display(X,X2):-
    rdf_global_id(IRISpec,X),
    X2 = a([href=X],
           IRISpec).
iri_display(X,X2):-
    X2 = a([href=X],
           X).
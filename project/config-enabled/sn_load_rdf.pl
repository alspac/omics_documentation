:- module(conf_lod, []).
:- use_module(api(lod)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_files)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(cliopatria(hooks)).


:- multifile http:location/3.
:- dynamic   http:location/3.

%:-debug.

http:location(myfiles, '/opt/project/', []).


:- http_handler('/rdf/',
                lod_api([ redirected_from('http://purl.org/alspac/alspac-data-catalogue-schema/')
                        ]),
                [ prefix ]).




cliopatria:menu_item(help/about, 'About').
cliopatria:menu_item(help/tips, 'tips').
cliopatria:menu_item(places/catalog, 'catalog').

:- http_handler(root(about), about, []).

about(Request) :-
        reply_decorated_file(html('about.html'), Request).


:- http_handler('/catalog', http_redirect(moved, 'http://purl.org/alspac/alspac-data-catalogue-schema/alspac_data_catalogue_001'),
                []).




:- http_handler('/tips', tips, []).

tips(Request) :-
    %redirect_create_admin(Request),
    reply_decorated_file(html('tips.html'), Request).

:- http_handler('/frog', home, []).

home(Request) :-
    %redirect_create_admin(Request),
    reply_decorated_file(html('home.html'), Request).

    /*
        format('Content-type: text/html~n~n'),
	print_html(
    ['<html>',
     '<head>',
     '<title>',
     'Howdy',
     '</title>',
     '</head>',
     '<body>',
     '<h2>',
     'A Simple Web Page',
     '</h2>',
     '<p>',
     'With some text.',
     '</p>',
     '</body>',
     '</html>']).
    */
 /*
        
    If the application wants to provide  a   link  to the generic ClioPatria
administrative interface, it can do so by   linking  to the id=admin, as
in:
    ==
        ...,
        { http_link_to_id(admin, [], AdminRef) },
        html(a(href(AdminRef), admin)),
        ...
    ==
*/
reply_decorated_file(Alias, _Request) :-
    absolute_file_name(Alias, Page, [access(read)]),
    load_html_file(Page, DOM),
    contains_term(element(title, _, Title), DOM),
    contains_term(element(body, _, Body), DOM),
    Style = element(style, _, _),
    findall(Style, sub_term(Style, DOM), Styles),
    append(Styles, Body, Content),
    reply_html_page(cliopatria(html_file),
                    title(Title), Content).


%%% This is the code for local-view https://cliopatria.swi-prolog.org/swish/pldoc/doc/home/swipl/src/ClioPatria/ClioPatria/applications/browse.pl?show=src#list_resource/4


:-rdf_register_prefix(alspacdcs,'http://purl.org/alspac/alspac-data-catalogue-schema/'),
  rdf_register_prefix(orcid,'http://identifiers.org/orcid/'),
  rdf_register_prefix(dcat,'https://www.w3.org/ns/dcat#'),
  rdf_register_prefix(nfo,'https://www.semanticdesktop.org/ontologies/2007/03/22/nfo/v1.2/#'),
  rdf_register_prefix(schema,'http://schema.org/').
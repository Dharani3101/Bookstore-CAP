using { cuid , managed } from '@sap/cds/common';

namespace tutorial.db ;


// Like Item : Contact person
entity Books : cuid , managed {
   title : String ;
   author : Association to Authors ; // like gsc
   Chapters : Composition of Chapters on Chapters.book = $self;
}

//Like Header : Supplier Info
entity Authors : cuid , managed {
    name : String ;                                                 // like the cp id
    books : association to many  Books on books.author = $self ;    // 1 supplier can have multiple CP " like GSC"
}

//Composition ( child cannot exist withour parent )
entity Chapters : cuid , managed {
    number : Integer ;
    key book : Association to Books ;
}
package org.ontohub.idl;


/**
* org/ontohub/idl/Sentence.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from src/Ontology.idl
* Dienstag, 30. Juli 2013 15:12 Uhr MESZ
*/

public final class Sentence implements org.omg.CORBA.portable.IDLEntity
{
  public org.ontohub.idl.Iri iri = null;
  public String form = null;

  public Sentence ()
  {
  } // ctor

  public Sentence (org.ontohub.idl.Iri _iri, String _form)
  {
    iri = _iri;
    form = _form;
  } // ctor

} // class Sentence

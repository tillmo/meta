package org.ontohub.idl;


/**
* org/ontohub/idl/OntologyContent.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from src/Ontology.idl
* Dienstag, 30. Juli 2013 15:12 Uhr MESZ
*/

public final class OntologyContent implements org.omg.CORBA.portable.IDLEntity
{
  public org.ontohub.idl.OntologyFractum fractum = null;
  public org.ontohub.idl.OntologyVersionContent currentVersion = null;

  public OntologyContent ()
  {
  } // ctor

  public OntologyContent (org.ontohub.idl.OntologyFractum _fractum, org.ontohub.idl.OntologyVersionContent _currentVersion)
  {
    fractum = _fractum;
    currentVersion = _currentVersion;
  } // ctor

} // class OntologyContent

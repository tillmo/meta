package org.ontohub.idl;


/**
* org/ontohub/idl/OntologyFractumHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from Ontology.idl
* Montag, 29. Juli 2013 16:07 Uhr MESZ
*/

abstract public class OntologyFractumHelper
{
  private static String  _id = "IDL:org/ontohub/idl/OntologyFractum:1.0";

  public static void insert (org.omg.CORBA.Any a, org.ontohub.idl.OntologyFractum that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static org.ontohub.idl.OntologyFractum extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  private static boolean __active = false;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      synchronized (org.omg.CORBA.TypeCode.class)
      {
        if (__typeCode == null)
        {
          if (__active)
          {
            return org.omg.CORBA.ORB.init().create_recursive_tc ( _id );
          }
          __active = true;
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [8];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          _tcOf_members0 = org.ontohub.idl.IriHelper.type ();
          _members0[0] = new org.omg.CORBA.StructMember (
            "iri",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (org.ontohub.idl.TextHelper.id (), "Text", _tcOf_members0);
          _members0[1] = new org.omg.CORBA.StructMember (
            "name",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (org.ontohub.idl.TextHelper.id (), "Text", _tcOf_members0);
          _members0[2] = new org.omg.CORBA.StructMember (
            "description",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_sequence_tc (0, _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (org.ontohub.idl.TextListHelper.id (), "TextList", _tcOf_members0);
          _members0[3] = new org.omg.CORBA.StructMember (
            "categories",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_sequence_tc (0, _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (org.ontohub.idl.TextListHelper.id (), "TextList", _tcOf_members0);
          _members0[4] = new org.omg.CORBA.StructMember (
            "groups",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_sequence_tc (0, _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (org.ontohub.idl.TextListHelper.id (), "TextList", _tcOf_members0);
          _members0[5] = new org.omg.CORBA.StructMember (
            "prefixes",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.ontohub.idl.IriHelper.type ();
          _members0[6] = new org.omg.CORBA.StructMember (
            "languageIri",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.ontohub.idl.IriHelper.type ();
          _members0[7] = new org.omg.CORBA.StructMember (
            "projectIri",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (org.ontohub.idl.OntologyFractumHelper.id (), "OntologyFractum", _members0);
          __active = false;
        }
      }
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static org.ontohub.idl.OntologyFractum read (org.omg.CORBA.portable.InputStream istream)
  {
    org.ontohub.idl.OntologyFractum value = new org.ontohub.idl.OntologyFractum ();
    value.iri = org.ontohub.idl.IriHelper.read (istream);
    value.name = istream.read_string ();
    value.description = istream.read_string ();
    value.categories = org.ontohub.idl.TextListHelper.read (istream);
    value.groups = org.ontohub.idl.TextListHelper.read (istream);
    value.prefixes = org.ontohub.idl.TextListHelper.read (istream);
    value.languageIri = org.ontohub.idl.IriHelper.read (istream);
    value.projectIri = org.ontohub.idl.IriHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, org.ontohub.idl.OntologyFractum value)
  {
    org.ontohub.idl.IriHelper.write (ostream, value.iri);
    ostream.write_string (value.name);
    ostream.write_string (value.description);
    org.ontohub.idl.TextListHelper.write (ostream, value.categories);
    org.ontohub.idl.TextListHelper.write (ostream, value.groups);
    org.ontohub.idl.TextListHelper.write (ostream, value.prefixes);
    org.ontohub.idl.IriHelper.write (ostream, value.languageIri);
    org.ontohub.idl.IriHelper.write (ostream, value.projectIri);
  }

}

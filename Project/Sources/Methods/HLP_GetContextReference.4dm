//%attributes = {}
If (False:C215)
	//Project Method Name:      HLP_GetContextReference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_Document; $_blb_XML; $_blb_XMLReply)
	C_LONGINT:C283($_l_EndOfLinePosition)
	C_TEXT:C284($_t_CRLF; $_t_HelpDocumentPath; $_t_oldMethodName; $_t_Quote; $_t_Quotes; $_t_TextReply; $_t_XSL; $0; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("HLP_GetContextReference")
While (Semaphore:C143("$ReadingXML"))
	DelayTicks(2)
End while 
If (Count parameters:C259>=2)
	$_t_Quotes:=Char:C90(34)
	$_t_Quote:=Char:C90(Quote:K15:44)
	$_t_CRLF:=Char:C90(13)+Char:C90(10)
	$_t_XSL:="<?xml version="+$_t_Quotes+"1.0"+$_t_Quotes+" encoding="+$_t_Quotes+"ISO-8859-1"+$_t_Quotes+"?>"+$_t_CRLF
	$_t_XSL:=$_t_XSL+"<xsl:stylesheet version="+$_t_Quotes+"1.0"+$_t_Quotes+$_t_CRLF
	$_t_XSL:=$_t_XSL+"xmlns:xsl="+$_t_Quotes+"http://www.w3.org/1999/XSL/Transform"+$_t_Quotes+">"
	$_t_XSL:=$_t_XSL+"<xsl:template match="+$_t_Quotes+"/"+$_t_Quotes+">"+$_t_CRLF
	$_t_XSL:=$_t_XSL+"<xsl:for-each select="+$_t_Quotes+"HELPCONTEXTS/CONTEXT[CONTEXTNAME="+$_t_Quote+$2+$_t_Quote+"]"+$_t_Quotes+">"+$_t_CRLF
	$_t_XSL:=$_t_XSL+"<xsl:sort select="+$_t_Quotes+"CONTEXTNAME"+$_t_Quotes+"/>"+$_t_CRLF
	If (Count parameters:C259>=3)
		$_t_XSL:=$_t_XSL+"<xsl:value-of select="+$_t_Quotes+$3+$_t_Quotes+"/>"+$_t_CRLF
	Else 
		$_t_XSL:=$_t_XSL+"<xsl:value-of select="+$_t_Quotes+"ALTERNATIVE"+$_t_Quotes+"/>"+$_t_CRLF
	End if 
	
	$_t_XSL:=$_t_XSL+"</xsl:for-each>"+$_t_CRLF
	$_t_XSL:=$_t_XSL+"</xsl:template>"+$_t_CRLF
	$_t_XSL:=$_t_XSL+"</xsl:stylesheet>"+$_t_CRLF
	
	TEXT TO BLOB:C554($_t_XSL; $_blb_XML; 3)
	
	//<html>
	//<body>
	//<h2>HELP CONTEXTS</h2>
	//<table border="1">
	//<tr bgcolor="#9acd32">
	//<td><b>CONTEXTNAME</b></td>
	//<td><b>DEFAULT</b></td>
	//<td><b>ALTERNATIVE</b></td>
	//</tr>
	//<xsl:for-each select="HELPCONTEXTS/CONTEXT[CONTEXTNAME='CONTACTS_ACC_EmailChoice']">
	//<xsl:sort select="HELPCONTEXTS/CONTEXT/CONTEXTNAME"/>
	//<tr>
	//<tr>
	//<td><xsl:value-of select="CONTEXTNAME"/></td>
	//<td><xsl:value-of select="DEFAULT"/></td>
	//<td><xsl:value-of select="ALTERNATIVE"/></td>
	//</tr>
	//</tr>
	//`</xsl:for-each>
	//</Table>
	//</body>
	//</html>
	//</xsl:template>
	//</xsl:stylesheet>
	If (Count parameters:C259>=2)
		$0:="TOC"  //Default reply
		If (Is a document:K24:1=Test path name:C476($1))
			While (Semaphore:C143("$WritingContextsDocument"))
				DelayTicks(2)
			End while 
			$_t_HelpDocumentPath:=PathFromPathName($1)
			DOCUMENT TO BLOB:C525($1; $_blb_Document)
			//_O_XSLT APPLY TRANSFORMATION($_blb_Document;$_blb_XML;$_blb_XMLReply)
			CLEAR SEMAPHORE:C144("$WritingContextsDocument")
		End if 
		$_t_TextReply:=BLOB to text:C555($_blb_XMLReply; 3)
		$_l_EndOfLinePosition:=Position:C15(Char:C90(10); $_t_TextReply)
		If ($_l_EndOfLinePosition<Length:C16($_t_TextReply))
			$_t_TextReply:=Substring:C12($_t_TextReply; $_l_EndOfLinePosition+1; Length:C16($_t_TextReply))
		Else 
			$_t_TextReply:=""
		End if 
		If ($_t_TextReply#"")
			$0:=$_t_TextReply
		Else 
			If (Count parameters:C259=2)
				$0:="docs.daybook.co.uk/"+HLP_GetContextReference($1; $2; "DEFAULT")
			End if 
		End if 
		
	End if 
End if 
CLEAR SEMAPHORE:C144("$ReadingXML")
ERR_MethodTrackerReturn("HLP_GetContextReference"; $_t_oldMethodName)
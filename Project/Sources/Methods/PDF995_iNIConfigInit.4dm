//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_iNIConfigInit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PDF_at_995tempTextArr;0)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; PDF_t_995FileContent)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_iNIConfigInit")

ARRAY TEXT:C222(PDF_at_995tempTextArr; 0)

$0:=False:C215
If (Is Windows:C1573)
	
	If (Test path name:C476(PDF995_iNIFilePathGet)=Is a document:K24:1)
		$0:=PDF995_fileContentGet(PDF995_iNIFilePathGet; ->PDF_t_995FileContent)
		If ($0)
			PDF_t_995FileContent:=Replace string:C233(PDF_t_995FileContent; Char:C90(Line feed:K15:40); "")
			PDF995_text2Array(PDF_t_995FileContent; ->PDF_at_995tempTextArr; Char:C90(Carriage return:K15:38); True:C214)
		End if 
	End if 
End if 

ERR_MethodTrackerReturn("PDF995_iNIConfigInit"; $_t_oldMethodName)

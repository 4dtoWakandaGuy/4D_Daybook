//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_iNIConfigCommit
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
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; PDF_t_995FileContent)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_iNIConfigCommit")


PDF_t_995FileContent:=""
$0:=False:C215
If (Is Windows:C1573)
	
	For ($_l_Index; 1; Size of array:C274(PDF_at_995tempTextArr))
		If (PDF_at_995tempTextArr{$_l_Index}#"")
			PDF_t_995FileContent:=PDF_t_995FileContent+PDF_at_995tempTextArr{$_l_Index}+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
		End if 
	End for 
	
	ARRAY TEXT:C222(PDF_at_995tempTextArr; 0)
	
	//DELETE DOCUMENT(PDF995_iNIFilePathGet )  `delete and create file with new configured options
	PDF995_DoDocument("DELETE DOCUMENT"; PDF995_iNIFilePathGet)  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
	
	
	$0:=PDF995_fileContentSet(PDF995_iNIFilePathGet; ->PDF_t_995FileContent)
End if 

ERR_MethodTrackerReturn("PDF995_iNIConfigCommit"; $_t_oldMethodName)

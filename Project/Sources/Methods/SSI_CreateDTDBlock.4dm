//%attributes = {}
If (False:C215)
	//Project Method Name:      SSI_CreateDTDBlock
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SSI_CreateDTDBlock")
//this method will create a DTD block..that block can then be put into a document or at
//the head of an XML document
If ($1>0)
	//The 'MAP' is defined
	SSI_LoadMap($1)
End if 
ERR_MethodTrackerReturn("SSI_CreateDTDBlock"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      Catalogue_FlagLinkfordeletion
	//------------------ Method Notes ------------------
	// Catalogue_FlagLinkForDeletion
	// 27/11/03 pb
	// Flags or deletes Catalogue Product link records depending
	// on whether they are in the BK or not
	// Params: $1 = the datetimestamp to apply
	
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Catalogue_FlagLinkfordeletion")

If (Records in selection:C76([Catalogue_ProductLink:109])>0)
	FIRST RECORD:C50([Catalogue_ProductLink:109])
	CREATE EMPTY SET:C140([Catalogue_ProductLink:109]; "delnow")
	For ($_l_Index; 1; Records in selection:C76([Catalogue_ProductLink:109]))
		If ([Catalogue_ProductLink:109]EW_BKReference:9#"")  // it is in the BK
			[Catalogue_ProductLink:109]Status:6:=-1  // inactive
			[Catalogue_ProductLink:109]TimeDateStamp:8:=$1
			SAVE RECORD:C53([Catalogue_ProductLink:109])
		Else 
			ADD TO SET:C119([Catalogue_ProductLink:109]; "delnow")
		End if 
		NEXT RECORD:C51([Catalogue_ProductLink:109])
	End for 
	USE SET:C118("delnow")
	DELETE SELECTION:C66([Catalogue_ProductLink:109])
End if 
ERR_MethodTrackerReturn("Catalogue_FlagLinkfordeletion"; $_t_oldMethodName)
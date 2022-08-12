//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBFooter
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBFooter")
//IME_DBHeader
//Rollo 9/6/2004

//Default footer for all daybook interface pages

IME_ReplyText2("ITX DGForm/")
IME_ReplyText2("ITX DGFooter1")
ERR_MethodTrackerReturn("IME_DBFooter"; $_t_oldMethodName)
If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Label_Extra
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vDetails)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Label_Extra"; Form event code:C388)
vDetails:="zdfasd"
vDetails:=""
ERR_MethodTrackerReturn("FM [DOCUMENTS].Label_Extra"; $_t_oldMethodName)
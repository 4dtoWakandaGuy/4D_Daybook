If (False:C215)
	//Table Form Method Name: [WEBSETUP_4D]IPRanges
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("FM [WEBSETUP_4D].IPRanges"; Form event code:C388)
If (Form event code:C388=On Load:K2:1)
	OpenHelp(Table:C252(->[WEBSETUP_4D:129]); "IPRanges")
	INT_SetDialog
End if 
ERR_MethodTrackerReturn("FM [WEBSETUP_4D].IPRanges"; $_t_oldMethodName)

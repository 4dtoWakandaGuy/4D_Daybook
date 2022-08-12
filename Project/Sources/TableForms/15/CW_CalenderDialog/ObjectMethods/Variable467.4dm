If (False:C215)
	//object Name: [USER]CW_CalenderDialog.Variable467
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CW_CalenderDialog.Variable467"; Form event code:C388)
//Object Method:  bDay#
//Created:  3/11/98 - Pelican Software Incorporated
//Last Modified:  3/11/98 - Pelican Software Incorporated
//Executes when a calendar day button is clicked

If (Form event code:C388=On Clicked:K2:4)
	CW_SelectDay(Self:C308)
End if 
ERR_MethodTrackerReturn("OBJ [USER].CW_CalenderDialog.Variable467"; $_t_oldMethodName)

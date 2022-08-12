If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oClearDates3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(VDoDateF; vDoDateT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.oClearDates3"; Form event code:C388)

VDoDateF:=!00-00-00!
vDoDateT:=!00-00-00!
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.oClearDates3"; $_t_oldMethodName)
If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oClearDates1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(VDnDateF; vDnDateT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.oClearDates1"; Form event code:C388)

VDnDateF:=!00-00-00!
vDnDateT:=!00-00-00!
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.oClearDates1"; $_t_oldMethodName)
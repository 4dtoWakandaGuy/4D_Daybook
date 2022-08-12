If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oClearDates1
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
	C_DATE:C307(VSDateF; vSDateT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oClearDates1"; Form event code:C388)

VSDateF:=!00-00-00!
vSDateT:=!00-00-00!
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oClearDates1"; $_t_oldMethodName)

If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oClearDates3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:48
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oClearDates3"; Form event code:C388)

VDoDateF:=!00-00-00!
vDoDateT:=!00-00-00!
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oClearDates3"; $_t_oldMethodName)
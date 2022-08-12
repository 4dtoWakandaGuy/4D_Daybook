If (False:C215)
	//object Name: [USER]Qualities_Pallette.Variable12
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
	C_LONGINT:C283(QV_l_CurrentMode)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesGroupName; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Variable12"; Form event code:C388)
If (QV_l_CurrentMode=2)
	//you can only add multi if you are adding
	If (QV_t_QualityName="") & (QV_t_QualitiesGroupName="")
		
		FORM GOTO PAGE:C247(2)
		
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Variable12"; $_t_oldMethodName)

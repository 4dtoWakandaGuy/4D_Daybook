If (False:C215)
	//object Name: [USER]Qualities_Pallette.Pop-up%2FDrop-down List3
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
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Pop-up/Drop-down List3"; Form event code:C388)
If (AA_at_SubSublistPOPNMs>0)
	QV_t_QualityName:=AA_at_SubSublistPOPNMs{AA_at_SubSublistPOPNMs}
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Pop-up/Drop-down List3"; $_t_oldMethodName)

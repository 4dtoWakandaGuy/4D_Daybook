If (False:C215)
	//object Name: [USER]Qualities_Pallette.Pop-up%2FDrop-down List2
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
	//ARRAY REAL(QV_ar_QualityLevels;0)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Pop-up/Drop-down List2"; Form event code:C388)
If (QV_ar_QualityLevels>0)
	QV_R_QualityLevel:=QV_ar_QualityLevels{QV_ar_QualityLevels}
	QV_ar_QualityLevels:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Pop-up/Drop-down List2"; $_t_oldMethodName)

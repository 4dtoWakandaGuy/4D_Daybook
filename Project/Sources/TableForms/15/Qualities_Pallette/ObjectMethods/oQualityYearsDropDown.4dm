//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_PosQualityYears;0)
	C_LONGINT:C283(QV_l_QualityYear)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Pop-up/Drop-down List1"; Form event code:C388)
If (QV_al_PosQualityYears>0)  //NG Checked April 2020
	QV_l_QualityYear:=QV_al_PosQualityYears{QV_al_PosQualityYears}  //NG Checked April 2020
	QV_al_PosQualityYears:=0  //NG Checked April 2020
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Pop-up/Drop-down List1"; $_t_oldMethodName)

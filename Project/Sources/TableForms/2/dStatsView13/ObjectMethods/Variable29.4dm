If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable29
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable29"; Form event code:C388)
If (aSV1<Size of array:C274(aSV1))
	aSV1:=aSV1+1
	aSVN1:=aSVN1+1
	aSV2:=aSV2+1
	aSV3:=aSV3+1
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable29"; $_t_oldMethodName)

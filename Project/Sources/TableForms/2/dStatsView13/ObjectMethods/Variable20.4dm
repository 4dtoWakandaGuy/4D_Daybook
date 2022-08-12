If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable20
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
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable20"; Form event code:C388)
If (Gen_Option)
	SORT ARRAY:C229(aSV4; aSVN1; aSV3; aSV1; aSV2; <)
Else 
	SORT ARRAY:C229(aSV4; aSVN1; aSV3; aSV1; aSV2; >)
End if 
aSV1:=0
aSVN1:=0
aSV2:=0
aSV3:=0
aSV4:=0
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable20"; $_t_oldMethodName)
If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable17
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
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable17"; Form event code:C388)
If (Gen_Option)
	If (r1=1)
		SORT ARRAY:C229(aSV1; aSVN1; aSV2; aSV3; aSV4; <)
	Else 
		SORT ARRAY:C229(aSVN1; aSV1; aSV2; aSV3; aSV4; <)
	End if 
Else 
	If (r1=1)
		SORT ARRAY:C229(aSV1; aSVN1; aSV2; aSV3; aSV4; >)
	Else 
		SORT ARRAY:C229(aSVN1; aSV1; aSV2; aSV3; aSV4; >)
	End if 
End if 
aSV1:=0
aSVN1:=0
aSV2:=0
aSV3:=0
aSV4:=0
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable17"; $_t_oldMethodName)
If (False:C215)
	//object Name: [COMPANIES]dAsk_QA.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(i; j; QA_l_Search1; xNextRec; xPrevRec)
	C_TEXT:C284($_t_oldMethodName; vCounty; vPostcode; vSubGroup1; vSubGroup2; vSubGroup4; vTown)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_QA.Variable13"; Form event code:C388)
j:=j+1
If (Is Windows:C1573)
	QA_Lookup2(j)
Else 
	QA_l_Search1:=j-1
	PLUGCALL_QuickAddress("LookUpStrings"; QA_l_Search1; ->[COMPANIES:2]Postal_Code:7; ->vSubGroup1; ->vSubGroup2; ->vTown; ->vCounty; ->vPostcode)
	
End if 
vSubGroup4:=String:C10(j)+" of "+String:C10(i)
//_O_ENABLE BUTTON(xPrevRec)
OBJECT SET ENABLED:C1123(xPrevRec; True:C214)
If (j=i)
	//_O_DISABLE BUTTON(xNextRec)
	OBJECT SET ENABLED:C1123(xNextRec; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_QA,xNextRec"; $_t_oldMethodName)

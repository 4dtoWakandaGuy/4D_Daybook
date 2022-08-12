If (False:C215)
	//object Name: [DOCUMENTS]dOpen.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionName;0)
	//ARRAY TEXT(aPrevTypeC;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dOpen.Variable6"; Form event code:C388)
If (SVS_at_PreviewTypeN=0)
	SVS_at_PreviewTypeN:=1
End if 
aPrevTypeC:=SVS_at_PreviewTypeN
vType:=aPrevTypeC{SVS_at_PreviewTypeN}
Letters_SWSaSrc
GEN_at_Identity:=1
GEN_at_Name:=1
If (SVS_at_PreviewTypeN#1)
	<>WP_at_DocumentDiaryActionCode:=Find in array:C230(<>WP_at_DocumentDiaryActionCode; aPrevTypeC{aPrevTypeC})
	If (<>WP_at_DocumentDiaryActionCode<1)
		<>WP_at_DocumentDiaryActionCode:=1
	End if 
	<>WP_at_DocumentDiaryActionName:=<>WP_at_DocumentDiaryActionCode
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dOpen.Variable6"; $_t_oldMethodName)

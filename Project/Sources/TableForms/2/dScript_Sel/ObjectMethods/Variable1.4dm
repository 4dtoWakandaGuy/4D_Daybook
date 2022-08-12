If (False:C215)
	//object Name: [COMPANIES]dScript_Sel.Variable1
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
	//ARRAY TEXT(GEN_at_Name;0)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; vName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dScript_Sel.Variable1"; Form event code:C388)
If (GEN_at_Name=0)
	If (Size of array:C274(GEN_at_Name)>0)
		GEN_at_Name:=1
	End if 
End if 
MESSAGES OFF:C175
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=GEN_at_Name{GEN_at_Name})
MESSAGES ON:C181
<>RecText:=[SCRIPTS:80]Recording_Text:4
vName:=[SCRIPTS:80]Script_Code:1
ACCEPT:C269
ERR_MethodTrackerReturn("OBJ [COMPANIES].dScript_Sel.Variable1"; $_t_oldMethodName)
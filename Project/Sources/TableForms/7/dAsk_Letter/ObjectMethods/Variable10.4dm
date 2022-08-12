If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Letter.Variable10
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
	C_LONGINT:C283(ch1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Letter.Variable10"; Form event code:C388)
USE SET:C118("Master2")
If (ch1=1)
	QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214)
	If (Records in selection:C76([DOCUMENTS:7])>0)
		Letters_Arr
		Array_LCStart
	Else 
		Gen_Alert("No Standard Documents found"; "")
		USE SET:C118("Master2")
		ch1:=0
	End if 
Else 
	Letters_Arr
	Array_LCStart
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dAsk_Letter.Variable10"; $_t_oldMethodName)

If (False:C215)
	//object Name: [DOCUMENTS]Letters_Out.Variable3
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
	//ARRAY TEXT(WS_at_DocumentTemplateClasses;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vMod2)
	C_LONGINT:C283($_WS_l_SelDocTemplateClass; vNo; vNo2; WS_l_SelDocTemplateClass)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; WIN_t_CurrentOutputform; WS_t_DocumentTemplateClass)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_Out.Variable3"; Form event code:C388)
If (WS_at_DocumentTemplateClasses>0)
	$_WS_l_SelDocTemplateClass:=WS_l_SelDocTemplateClass
	
	WS_l_SelDocTemplateClass:=WS_at_DocumentTemplateClasses
	
	
	If (Substring:C12(vButtDisO; 9; 1)#"F")
		If (Not:C34(In_ButtSilver))
			DB_bo_RecordModified:=False:C215
			vMod2:=False:C215
			COPY NAMED SELECTION:C331([DOCUMENTS:7]; "Selection")
			Letters_Sel
		End if 
		If (Records in selection:C76([DOCUMENTS:7])>0)
			vNo:=Records in selection:C76([DOCUMENTS:7])
			vNo2:=0
			CREATE SET:C116([DOCUMENTS:7]; "Master")
		Else 
			Gen_Alert("No "+WS_at_DocumentTemplateClasses{WS_at_DocumentTemplateClasses}+" found-the selection is empty"; "OK")
			// WS_l_SelDocTemplateClass:=$_WS_l_SelDocTemplateClass
			//WS_at_DocumentTemplateClasses:=WS_l_SelDocTemplateClass
			vNo:=Records in selection:C76([DOCUMENTS:7])
			vNo2:=0
			CREATE SET:C116([DOCUMENTS:7]; "Master")
		End if 
		CLEAR NAMED SELECTION:C333("Selection")
		vNo:=Records in selection:C76([DOCUMENTS:7])
	End if 
	
	//FS_SetFormSort (WIN_t_CurrentOutputform;table(»)
	WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_at_DocumentTemplateClasses}
	INT_Setoutput(Table:C252(->[DOCUMENTS:7]); WIN_t_CurrentOutputform; ->WS_t_DocumentTemplateClass)
End if 
ERR_MethodTrackerReturn("OBJ:Letters_Out,WS_at_DocumentTemplateClasses"; $_t_oldMethodName)

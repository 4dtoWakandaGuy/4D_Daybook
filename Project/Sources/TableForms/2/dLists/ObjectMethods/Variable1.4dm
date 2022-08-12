If (False:C215)
	//object Name: [COMPANIES]dLists.Variable1
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
	//C_UNKNOWN(bd2)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(xCount)
	//ARRAY LONGINT(GEN_al_NameID;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283(bd2; xCount; $_l_SelectedRow; LM_l_ListItemID)
	C_TEXT:C284(vText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dLists.Variable1"; Form event code:C388)
If (bd2=1)
	OBJECT SET ENTERABLE:C238(vText; True:C214)
	GOTO OBJECT:C206(vText)
	HIGHLIGHT TEXT:C210(vText; Length:C16(vText)+1; Length:C16(vText)+1)
	OBJECT SET ENABLED:C1123(xCount; True:C214)
Else 
	HIGHLIGHT TEXT:C210(vText; 1; 1)
	OBJECT SET ENTERABLE:C238(vText; False:C215)
	OBJECT SET ENABLED:C1123(xCount; False:C215)
	
	If ((vText="") & (GEN_at_Name{GEN_at_Name}=""))
		$_l_SelectedRow:=GEN_at_Name
		DELETE FROM ARRAY:C228(GEN_at_Name; $_l_SelectedRow; 1)
		DELETE FROM ARRAY:C228(GEN_at_RecordCode; $_l_SelectedRow; 1)
		DELETE FROM ARRAY:C228(GEN_at_Identity; $_l_SelectedRow; 1)
		If (GEN_at_Name>Size of array:C274(GEN_at_Name))
			GEN_at_Name:=Size of array:C274(GEN_at_Name)
			GEN_at_RecordCode:=GEN_at_Name
			GEN_at_Identity:=GEN_at_Name
		End if 
		vText:=GEN_at_Name{GEN_at_Name}
		LM_l_ListItemID:=GEN_al_NameID{GEN_at_Name}
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dLists.Variable1"; $_t_oldMethodName)

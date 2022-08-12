If (False:C215)
	//object Name: [USER]WS_SetManager.Variable23
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 06:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; $_l_SelectedRow; $_l_SizeofArray; vAdd; vNo; xSelect)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable23"; Form event code:C388)
$_l_SelectedRow:=GEN_at_Identity
If (In_Allowed("Enter Macro"; ->[SCRIPTS:80]))
	OK:=1
	Record_BarCreat
	xSelect:=1
	ZRecord_EditLst
	
	If (False:C215)
		Open_Pro_Window("Enter Macro")
		vAdd:=0
		vFromIn:=False:C215
		MODIFY RECORD:C57([SCRIPTS:80]; *)
		Close_ProWin
		If ((OK=1) & ([SCRIPTS:80]Script_Code:1#""))
			If (GEN_at_Identity#$_l_SelectedRow)
				<>DB_at_TableNamesMacro:=GEN_at_Identity-1
				Record_BarSrch
			Else 
				GEN_at_Name{GEN_at_Name}:=[SCRIPTS:80]Script_Code:1
				SORT ARRAY:C229(GEN_at_Name; >)
				GEN_at_Name:=Find in array:C230(GEN_at_Name; [SCRIPTS:80]Script_Code:1)
			End if 
		Else 
			DB_DeletionControl(->[SCRIPTS:80])
			
			DELETE RECORD:C58([SCRIPTS:80])
			DELETE FROM ARRAY:C228(GEN_at_Name; GEN_at_Name; 1)
			$_l_SizeofArray:=Size of array:C274(GEN_at_Name)
			If (GEN_at_Name>$_l_SizeofArray)
				GEN_at_Name:=$_l_SizeofArray
			End if 
			GEN_at_Identity:=$_l_SelectedRow
			<>DB_at_TableNamesMacro:=$_l_SelectedRow-1
		End if 
	End if 
	vNo:=Size of array:C274(GEN_at_Name)
End if 
ERR_MethodTrackerReturn("OBJ:WS_SetManager,xNext"; $_t_oldMethodName)

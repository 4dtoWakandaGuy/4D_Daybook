//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_BarArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Name;0)
	C_LONGINT:C283($_l_ScriptRow; vNo)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; $_t_ScriptName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarArr")
//Record_BarArr
If ((Size of array:C274(GEN_at_Name)>0) & (GEN_at_Name>0))
	$_t_ScriptName:=GEN_at_Name{GEN_at_Name}
Else 
	$_t_ScriptName:=""
End if 
SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; GEN_at_Name)
SORT ARRAY:C229(GEN_at_Name; >)
vNo:=Size of array:C274(GEN_at_Name)
$_l_ScriptRow:=Find in array:C230(GEN_at_Name; $_t_ScriptName)
If ($_l_ScriptRow>0)
	GEN_at_Name:=$_l_ScriptRow
Else 
	If (Size of array:C274(GEN_at_Name)>0)
		GEN_at_Name:=1
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=GEN_at_Name{GEN_at_Name})
		<>RecText:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
		
	Else 
		GEN_at_Name:=0
		<>RecText:=""
	End if 
End if 
ERR_MethodTrackerReturn("Record_BarArr"; $_t_oldMethodName)

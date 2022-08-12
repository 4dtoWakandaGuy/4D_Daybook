//%attributes = {}
If (False:C215)
	//Project Method Name:      Picture_expand
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
	C_BOOLEAN:C305(DB_bo_RecordModified; TE_bo_Modifiable)
	C_LONGINT:C283(TE_l_Pageshow)
	C_PICTURE:C286(TMP_Picture)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Picture_expand")
TMP_Picture:=$1->
DB_bo_RecordModified:=False:C215
If ($2="")
	$_t_WindowTitle:=Field name:C257($1)
	If ($_t_WindowTitle="@Desc")
		$_t_WindowTitle:=$_t_WindowTitle+"ription"
	End if 
Else 
	$_t_WindowTitle:=$2
End if 
TE_l_Pageshow:=2
Open_Pro_Window($_t_WindowTitle; 0; 3; ->[COMPANIES:2]; "Text_Expand")

TE_bo_Modifiable:=False:C215
DIALOG:C40([COMPANIES:2]; "Text_Expand")  //NG April 2004 Removed ◊Screen
Close_ProWin(Table name:C256(->[COMPANIES:2])+"_"+"Text_Expand")
TE_l_Pageshow:=0
ERR_MethodTrackerReturn("Picture_expand"; $_t_oldMethodName)

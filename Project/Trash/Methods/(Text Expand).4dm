//%attributes = {}
If (False:C215)
	//Project Method Name:      Text Expand
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
	C_BOOLEAN:C305($_bo_Modified; $3; DB_bo_RecordModified; TE_bo_Modifiable)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $2; vComments)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Text Expand")
vComments:=$1->
$_bo_Modified:=DB_bo_RecordModified
DB_bo_RecordModified:=False:C215
If ($2="")
	$_t_FieldName:=Field name:C257($1)
	If ($_t_FieldName="@Desc")
		$_t_FieldName:=$_t_FieldName+"ription"
	End if 
Else 
	$_t_FieldName:=$2
End if 
Open_Pro_Window($_t_FieldName; 0; 3; ->[COMPANIES:2]; "Text Expand13")
If (Count parameters:C259>=3)
	TE_bo_Modifiable:=$3
Else 
	
	TE_bo_Modifiable:=True:C214
End if 

DIALOG:C40([COMPANIES:2]; "Text Expand13")  //NG April 2004 Removed ◊Screen
Close_ProWin(Table name:C256(->[COMPANIES:2])+"_"+"Text Expand13")

If (OK=1)
	$1->:=vComments
End if 
DB_bo_RecordModified:=$_bo_Modified
ERR_MethodTrackerReturn("Text Expand"; $_t_oldMethodName)

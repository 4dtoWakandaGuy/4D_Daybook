//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_OpenDocument
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_useFileOpenPlugin)
	C_LONGINT:C283($_l_Mode; $3)
	C_TEXT:C284($_t_Document; $_t_DocumentPath; $_t_oldMethodName; $_t_Type; $_t_Type2; $1; $2)
	C_TIME:C306($0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_OpenDocument")
//Gen_Alert (DB_t_ErrTrackingStack)  `26/1/2010


If (Count parameters:C259>=1)
	$_t_Document:=$1
	If (Count parameters:C259>=2)
		$_t_Type:=$2
	Else 
		$_t_Type:=""
	End if 
	If (Count parameters:C259>=3)
		
		$_l_Mode:=$3
	Else 
		$_l_Mode:=0
	End if 
	<>DB_bo_useFileOpenPlugin:=False:C215
	If (<>DB_bo_useFileOpenPlugin)
		If ($_t_Document="")
			If ($_t_Type="")
				$_t_Type2:="*"
			Else 
				$_t_Type2:=$_t_Type
			End if 
			$_t_DocumentPath:="'"
			$_t_DocumentPath:=DB_SelectDocument(""; $_t_Type2; "Select Document to open."; 0)
			If ($_t_DocumentPath#"")
				$0:=DB_OpenDocument($_t_DocumentPath; $_t_Type)
			Else 
				$0:=?00:00:00?
			End if 
		Else 
			$0:=Open document:C264($_t_Document; $_t_Type)
			
		End if 
	Else 
		
		$0:=Open document:C264($_t_Document; $_t_Type)
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_OpenDocument"; $_t_oldMethodName)
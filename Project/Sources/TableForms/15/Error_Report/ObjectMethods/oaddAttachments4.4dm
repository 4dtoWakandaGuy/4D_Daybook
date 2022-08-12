If (False:C215)
	//object Name: [USER]Error_Report.oaddAttachments4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/04/2011 05:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ErrorAttachments; 0)
	//ARRAY TEXT(Err_at_aAttachements;0)
	//ARRAY TEXT(Err_at_aAttachementsPATH;0)
	C_LONGINT:C283($_l_Index; $_l_OK)
	C_TEXT:C284($_t_AttachmentPath; $_t_DocumentName; $_t_DocumentPath; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Error_Report.oaddAttachments4"; Form event code:C388)


ARRAY TEXT:C222($_at_ErrorAttachments; 0)
$_t_DocumentPath:=DB_SelectDocument(""; "*"; "Select Document(s) to Attach"; 1; ->$_at_ErrorAttachments)
$_l_OK:=OK
If ($_l_OK=1) & (Size of array:C274($_at_ErrorAttachments)>0)
	For ($_l_Index; 1; Size of array:C274($_at_ErrorAttachments))
		$_t_AttachmentPath:=$_at_ErrorAttachments{$_l_Index}
		$_t_DocumentName:=FileNamefromPath($_t_AttachmentPath)
		
		If ((Find in array:C230(Err_at_aAttachements; $_t_DocumentName)=-1) & (Find in array:C230(Err_at_aAttachements; $_t_AttachmentPath)=-1))
			
			INSERT IN ARRAY:C227(Err_at_aAttachements; 9999; 1)
			INSERT IN ARRAY:C227(Err_at_aAttachementsPATH; 9999; 1)
			Err_at_aAttachementsPATH{Size of array:C274(Err_at_aAttachementsPATH)}:=$_t_AttachmentPath
			Err_at_aAttachements{Size of array:C274(Err_at_aAttachements)}:=$_t_DocumentName
			
		End if 
	End for 
	If (Size of array:C274(Err_at_aAttachements)>0)
		OBJECT SET VISIBLE:C603(Err_at_aAttachements; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAttachLabel@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAttachPrompt@"; False:C215)
	Else 
		OBJECT SET VISIBLE:C603(Err_at_aAttachements; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAttachLabel@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAttachPrompt@"; True:C214)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].Error_Report.oaddAttachments4"; $_t_oldMethodName)

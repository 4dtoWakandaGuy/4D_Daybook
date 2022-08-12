
If (False:C215)
	//Object Name:      [COMPANIES].Company_In.oCOmFFComments
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/03/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(COM_At_FurthCommentsLabels;0)
	//ARRAY TEXT(COM_at_FurtherCommentIDS;0)
	C_BOOLEAN:C305($_bo_Coded)
	C_LONGINT:C283($_l_TableNumber; $_l_TableRow)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_NumberSTR; $_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumStr; $_t_UniqueCode; COM_t_FurtherFieldComment)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES]Company_In.oCOmFFComments"; Form event code:C388)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (COM_at_FurtherCommentIDS{COM_At_FurthCommentsLabels}#"")
			$_l_TableNumber:=Table:C252(->[COMPANIES:2])
			$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumStr:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			$_t_SemaphoreName:="ALFF"+$_t_TableNumStr+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
			If (Type:C295($_ptr_Field->)=9)
				$_t_NumberSTR:=String:C10($_ptr_Field->)
				$_bo_Coded:=($_t_NumberSTR#"0")
			Else 
				$_t_NumberSTR:=$_ptr_Field->
				$_bo_Coded:=($_t_NumberSTR#"")
			End if 
			$_t_UniqueCode:=$_t_TableNumStr+$_t_NumberSTR
			QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_UniqueCode; *)
			QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3=COM_At_FurthCommentsLabels{COM_At_FurthCommentsLabels})
			QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Deleted:8=0)
			COM_t_FurtherFieldComment:=""
			If (Records in selection:C76([CUSTOM_FIELDS:98])>0)
				COM_t_FurtherFieldComment:=[CUSTOM_FIELDS:98]Text_Field:6
			Else 
				CREATE RECORD:C68([CUSTOM_FIELDS:98])
				[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_UniqueCode
				Gen_CULPA(->[CUSTOM_FIELDS:98]Custom_Code:1)
				[CUSTOM_FIELDS:98]Field_Name:3:=COM_At_FurthCommentsLabels{COM_At_FurthCommentsLabels}
				OBJECT SET VISIBLE:C603(*; "oFurthFieldComments"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCompanyCommentField"; False:C215)
				
			End if 
			
			
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oFurthFieldComments"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCompanyCommentField"; True:C214)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES]Company_In.oCOmFFComments"; $_t_oldMethodName)

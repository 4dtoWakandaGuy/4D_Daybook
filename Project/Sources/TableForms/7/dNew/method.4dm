If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dNew
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
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_DocumentRow; $_l_event; r0; r1)
	C_TEXT:C284($_t_DocumentCode; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dNew"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	OpenHelp(Table:C252(->[DOCUMENTS:7]); "dNew")
	If (Size of array:C274(<>WP_at_DocumentDiaryActionCode)=0)
		Letters_SWActAr
	End if 
	If (Size of array:C274(<>WP_at_DocumentDiaryActionCode)>0)
		If (DB_t_CurrentFormUsage="LetNew")  //come from Diary_LetNew
			
			If ([DIARY:12]Document_Code:15#"")
				$_t_DocumentCode:=[DIARY:12]Document_Code:15
				RELATE ONE:C42([DIARY:12]Document_Code:15)
				If ([DOCUMENTS:7]Standard:9)
					r0:=1
				Else 
					r1:=1
				End if 
				Letters_InSWTem
				$_l_DocumentRow:=Find in array:C230(GEN_at_Identity; $_t_DocumentCode)
				If ($_l_DocumentRow>0)
					GEN_at_Identity:=$_l_DocumentRow
					GEN_at_Name:=$_l_DocumentRow
				End if 
			Else 
				r0:=1
				Letters_InSWTem
			End if 
		Else 
			r0:=1
			Letters_InSWTem
		End if 
	End if 
	INT_SetDialog
	
End if 
ERR_MethodTrackerReturn("FM [DOCUMENTS].dNew"; $_t_oldMethodName)
